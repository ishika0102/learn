package controllers

import (
	"SensorInventory/configs"
	"SensorInventory/helpers"
	"SensorInventory/models"
	"SensorInventory/services"
	"context"

	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/go-gota/gota/dataframe"
	"github.com/go-gota/gota/series"
	"github.com/gofiber/fiber/v2"
	"go.mongodb.org/mongo-driver/bson"
)

func AddSensorInventory(ctx *fiber.Ctx) error {

	UserId := ctx.FormValue("UserId")
	FacilityId := ctx.FormValue("FacilityId")

	if (UserId == "" && FacilityId == "") || (UserId != "" && FacilityId != "") {
		err_response := helpers.ErrorResponse(400, "Either UserId or FacilityId is Required")
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}

	//Checking if the User Exists
	if UserId != "" {
		filter := bson.M{"_id": UserId}
		user, _ := services.FindOne(filter, configs.UserCollection)
		if user == nil {
			err_response := helpers.ErrorResponse(404, "User Details Not Found")
			return ctx.Status(fiber.StatusNotFound).JSON(err_response)
		}
	}

	//Checking if the Facility Exists
	if FacilityId != "" {
		filter := bson.M{"_id": FacilityId}
		facility, _ := services.FindOne(filter, configs.FacilityCollection)
		if facility == nil {
			err_response := helpers.ErrorResponse(404, "Facility Details Not Found")
			return ctx.Status(fiber.StatusNotFound).JSON(err_response)
		}
	}

	file, err := ctx.FormFile("File")
	if err != nil {
		err_response := helpers.ErrorResponse(400, err.Error())
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}

	openedfile, err := file.Open()
	if err != nil {
		err_response := helpers.ErrorResponse(400, err.Error())
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	defer openedfile.Close()

	xlsx, err := excelize.OpenReader(openedfile)
	if err != nil {
		err_response := helpers.ErrorResponse(400, err.Error())
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	sheetName := xlsx.GetSheetName(1)

	rows := xlsx.GetRows(sheetName)

	// Create a DataFrame from the rows
	df := dataframe.LoadRecords(rows)
	df.SetNames("SSID", "Password", "BLE-Password", "LotNumber", "BoxCode",
		"PatchCode", "PatchId", "MFGDate", "ExpiryDate", "HSN",
		"Vendor", "Description")

	length := df.Nrow()
	UserIds := make([]string, length)
	FacilityIds := make([]string, length)
	Statuses := make([]string, length)
	for i := range length {
		if FacilityId != "" {
			FacilityIds[i] = FacilityId
		} else {
			UserIds[i] = UserId
		}

		Statuses[i] = "Unused"
	}
	var newdf dataframe.DataFrame
	if UserId != "" {
		IdSeries := dataframe.New(series.New(UserIds, series.String, "UserId"))
		newdf = df.CBind(IdSeries)
	} else {
		FacilityIdSeries := dataframe.New(series.New(FacilityIds, series.String, "FacilityId"))
		newdf = df.CBind(FacilityIdSeries)
	}

	StatusSeries := dataframe.New(series.New(Statuses, series.String, "Status"))

	newdf = newdf.CBind(StatusSeries)

	data := newdf.Maps()
	var documents []interface{}
	for _, item := range data {
		documents = append(documents, item)
	}

	//Inserting into db
	_, err = configs.SensorInventoryCollection.InsertMany(context.Background(), documents)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}
	response := helpers.Response(201, "SUCCESS", nil)
	return ctx.Status(fiber.StatusCreated).JSON(response)
}

func ViewAllSensorInventory(ctx *fiber.Ctx) error {

	filter := bson.M{"Status": bson.M{"$in": []string{"Unused", "Used"}}}
	queryparams := ctx.Queries()

	//Adding Filter Query
	if queryparams["Status"] != "" {
		filter["Status"] = queryparams["Status"]
	}
	if queryparams["UserId"] != "" {
		filter["UserId"] = queryparams["UserId"]
	}
	if queryparams["FacilityId"] != "" {
		filter["FacilityId"] = queryparams["FacilityId"]
	}

	//Adding Search Query
	if queryparams["searchquery"] != "" {
		searchquery := queryparams["searchquery"]
		filter["$or"] = bson.A{
			bson.M{"PatchId": bson.M{"$regex": searchquery, "$options": "i"}},
			bson.M{"UserId": bson.M{"$regex": searchquery, "$options": "i"}},
			bson.M{"FacilityId": bson.M{"$regex": searchquery, "$options": "i"}},
			// Add more fields as needed for searching
		}
	}

	result, err := services.GetAll(filter, nil, configs.SensorInventoryCollection)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}

	response := helpers.Response(200, "SUCCESS", result)
	return ctx.Status(fiber.StatusOK).JSON(response)
}

func UpdateOneSensorInventoryStatus(ctx *fiber.Ctx) error {
	Id := ctx.Params("id")
	status := ctx.Params("status")

	filter := bson.M{"PatchId": Id}
	result, err := services.FindOne(filter, configs.SensorInventoryCollection)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}
	if result == nil {
		err_response := helpers.ErrorResponse(404, "Sensor Inventory Not Found")
		return ctx.Status(fiber.StatusNotFound).JSON(err_response)
	}
	projection := bson.M{"$set": bson.M{
		"Status":                        status,
		"auditdetails.ModifiedByUserID": "USER", //TODO
		"auditdetails.ModifiedOn":       helpers.GetCurrentEpochTimeInFormat(false)}}

	updatedata, err := services.UpdateOne(filter, projection, configs.SensorInventoryCollection)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", updatedata)
	return ctx.Status(fiber.StatusOK).JSON(response)
}

func ViewOneSensorInventory(ctx *fiber.Ctx) error {
	Id := ctx.Params("id")
	filter := bson.M{"PatchId": Id}
	result, err := services.FindOne(filter, configs.SensorInventoryCollection)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}
	if result == nil {
		err_response := helpers.ErrorResponse(404, "Sensor Inventory Not Found")
		return ctx.Status(fiber.StatusNotFound).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", result)
	return ctx.Status(fiber.StatusOK).JSON(response)
}

func UpdateOneSensorInventory(ctx *fiber.Ctx) error {
	var InventoryData models.SensorInventory
	if err := ctx.BodyParser(&InventoryData); err != nil {
		err_response := helpers.ErrorResponse(400, err.Error())
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}

	filter := bson.M{"PatchId": InventoryData.PatchId}
	projection := bson.M{"$set": bson.M{
		"ExpiryDate":                    InventoryData.Expirydate,
		"BoxCode":                       InventoryData.BoxCode,
		"SSID":                          InventoryData.SSID,
		"Vendor":                        InventoryData.Vendor,
		"auditdetails.ModifiedByUserID": "USER", //TODO
		"auditdetails.ModifiedOn":       helpers.GetCurrentEpochTimeInFormat(false)}}

	updatedata, err := services.UpdateOne(filter, projection, configs.SensorInventoryCollection)
	if err != nil {
		err_response := helpers.ErrorResponse(500, err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", updatedata)
	return ctx.Status(fiber.StatusOK).JSON(response)

}
