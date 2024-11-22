package controller

import (
	"UserManagement-Core/configs"
	"UserManagement-Core/helpers"
	"UserManagement-Core/models"
	"UserManagement-Core/services"

	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"go.mongodb.org/mongo-driver/bson"
)

func CreateOrganization(ctx *fiber.Ctx) error {
	var organization models.Organization

	if err := ctx.BodyParser(&organization); err != nil {

		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)

	}
	// validate using the valicate_org in validate function in model org fucntion
	err := validator.New().Struct(&organization)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	org_id := helpers.GenerateID("ORG")
	organization.OrgId = org_id
	organization.CreatedByUserId = "user_id" // TODO: JWT : after jwt token use that to add value here
	organization.CreatedOn = helpers.GetCurrentEpochTimeInFormat(false)

	result, err := services.InsertIntoDB(configs.OrganizationCollection, organization)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", fiber.Map{"OrgId": result.InsertedID})
	return ctx.Status(fiber.StatusCreated).JSON(response)

}

func ViewOrganization(ctx *fiber.Ctx) error {
	var organization models.Organization
	organization.OrgId = ctx.Params("org_id")

	Projection := bson.M{
		"Name":          1,
		"ContactNumber": 1,
		"CountryCode":   1,
		"Address":       1,
		"City":          1,
		"State":         1,
		"Country":       1,
		"Pincode":       1,
		"_id":           0,
	}
	filter := bson.M{"_id": organization.OrgId}
	result, err := services.GetOne(filter, Projection, configs.OrganizationCollection)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	response := helpers.Response(200, "Success", result)
	return ctx.Status(fiber.StatusCreated).JSON(response)
}

func UpdateOrganization(ctx *fiber.Ctx) error {
	var organization models.Organization
	if err := ctx.BodyParser(&organization); err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}

	filter := bson.M{"_id": organization.OrgId}
	updateProjection := bson.M{"$set": bson.M{
		"Name":                          organization.Name,
		"ContactNumber":                 organization.ContactNumber,
		"CountryCode":                   organization.CountryCode,
		"Address":                       organization.Address,
		"City":                          organization.City,
		"State":                         organization.State,
		"Country":                       organization.Country,
		"Pincode":                       organization.Pincode,
		"auditdetails.ModifiedByUserID": "user_id_here", // TODO: JWT : after jwt token use that to add value here
		"auditdetails.ModifiedOn":       helpers.GetCurrentEpochTimeInFormat(false),
	}}
	result, err := services.UpdateOne(filter, updateProjection, configs.OrganizationCollection)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", result)
	return ctx.Status(fiber.StatusCreated).JSON(response)
}

func DeleteOrganization(ctx *fiber.Ctx) error {
	return ctx.SendString("Delete Organization")
}
