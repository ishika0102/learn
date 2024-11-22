package controller

import (
	"UserManagement-Core/configs"
	"UserManagement-Core/helpers"
	"UserManagement-Core/middleware"
	"UserManagement-Core/models"
	"UserManagement-Core/services"
	"fmt"

	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"go.mongodb.org/mongo-driver/bson"
)

func CreateOrgAdmin(ctx *fiber.Ctx) error {
	var newOrgAdmin models.OrgAdmin

	if err := ctx.BodyParser(&newOrgAdmin); err != nil {
		return err
	}
	err := validator.New().Struct(&newOrgAdmin)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}

	kc := middleware.NewIdentityManager()
	fmt.Println(kc)
	// Call register function to create user in Keycloak
	userid, err := middleware.Register(newOrgAdmin.Username, newOrgAdmin.Password, newOrgAdmin.Email, newOrgAdmin.ContactNumber, kc)
	if err != nil {
		fmt.Println("err in register")
		// Return error response
		return ctx.Status(500).SendString(err.Error())
	}
	newOrgAdmin.KeycloakUserId = userid
	// Generate the user_id using helpers module function
	user_id := helpers.GenerateUserID("USR")
	// Set the user_id back to the root struct
	newOrgAdmin.UserId = user_id

	newOrgAdmin.CreatedOn = helpers.GetCurrentEpochTimeInFormat(false)
	// Insert the new distributor admin into the "user" collection
	result, err := services.InsertIntoDB(configs.UserCollection, newOrgAdmin)
	fmt.Println(result)
	if err != nil {
		return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Failed to create root user"})
	}
	response := helpers.Response(200, "SUCCESS", fiber.Map{"UserId": result.InsertedID})
	return ctx.JSON(response)
}

func UpdateOrgAdmin(ctx *fiber.Ctx) error {
	var daUser models.OrgAdmin
	if err := ctx.BodyParser(&daUser); err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	filter := bson.M{"_id": daUser.UserId}
	updateProjection := bson.M{
		"$set": bson.M{
			"FirstName":                     daUser.FirstName,
			"LastName":                      daUser.LastName,
			"Email":                         daUser.Email,
			"CountryCode":                   daUser.CountryCode,
			"ContactNumber":                 daUser.ContactNumber,
			"auditdetails.ModifiedByUserId": "root", // TODO: JWT : after jwt token use that to add value here
			"auditdetails.ModifiedOn":       helpers.GetCurrentEpochTimeInFormat(false),
		},
	}
	// var updatedUser models.Users
	result, err := services.UpdateOne(filter, updateProjection, configs.UserCollection)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	response := helpers.Response(200, "SUCCESS", result)
	// return ctx.Status(fiber.StatusOK).JSON(result)
	return ctx.JSON(response)
}

func DeleteOrgAdmin(ctx *fiber.Ctx) error {
	return ctx.SendString("Delete Org Admin")
}

func ViewOrgAdmin(ctx *fiber.Ctx) error {
	var orgUser models.OrgAdmin
	orgUser.UserId = ctx.Params("user_id")

	Projection := bson.M{
		"UserId":        "$_id",
		"_id":           0,
		"UserName":      1,
		"FirstName":     "$basicuserinfo.FirstName",
		"LastName":      "$basicuserinfo.LastName",
		"Email":         "$basicuserinfo.Email",
		"BelongToOrg":   1,
		"CountryCode":   "$basicuserinfo.CountryCode",
		"ContactNumber": "$basicuserinfo.ContactNumber",
	}
	filter := bson.M{"_id": orgUser.UserId}
	// var resultModel models.Users
	result, err := services.GetOne(filter, Projection, configs.UserCollection)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	// response := helpers.Response(200, "SUCCESS", result)
	// fiber.StatusOK - code 200 - indicates that success of GET, PUT, and DELETE requests
	return ctx.Status(fiber.StatusOK).JSON(result)
}
