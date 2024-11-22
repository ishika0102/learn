package controller

import (
	"UserManagement-Core/configs"
	"UserManagement-Core/helpers"
	"UserManagement-Core/models"
	"UserManagement-Core/services"

	"github.com/gofiber/fiber/v2"
	"go.mongodb.org/mongo-driver/bson"
)

func ViewProfile(ctx *fiber.Ctx) error {
	var UserId string
	if err := ctx.BodyParser(&UserId); err != nil {
		return err
	}
	filter := bson.M{
		"UserId": UserId}
	projection := bson.M{
		"_id":           0,
		"FirstName":     "$userdetails.FirstName",
		"LastName":      "$userdetails.LastName",
		"Email":         "$userdetails.Email",
		"CountryCode":   "$userdetails.CountryCode",
		"ContactNumber": "$userdetails.ContactNumber",
	}

	result, err := services.GetOne(filter, projection, configs.UserCollection)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	response := models.Response{Status: 200, Message: "Success", Data: result}
	return ctx.Status(fiber.StatusOK).JSON(response)
}

func ChangePassword(ctx *fiber.Ctx) error {
	var pwd models.ChangePasswordByUser
	err := ctx.BodyParser(&pwd)
	if err != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: err.Error(),
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	// Now you can use the values retrieved from the CustomClaims
	dbuser, er := services.GetUserByUserId(pwd.UserId)
	if er != nil {

		err_response := models.ErrorResponse{
			Status:  400,
			Message: "User not found",
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	errr := helpers.CheckPasswordHash(pwd.OldPassword, dbuser.(models.Reseller).Password)
	if errr != nil {
		err_response := models.ErrorResponse{
			Status:  400,
			Message: "Invalid Old Password",
		}
		return ctx.Status(fiber.StatusBadRequest).JSON(err_response)
	}
	// Hash the password
	hashedPassword, err := helpers.HashPassword(pwd.NewPassword)
	if err != nil {
		return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Failed to hash password"})
	}
	updateprojection := bson.M{
		"$set": bson.M{
			"Password": hashedPassword,
		},
	}
	filter := bson.M{"_id": pwd.UserId}
	_, err = services.UpdateOne(filter, updateprojection, configs.UserCollection)
	if err != nil {
		return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Internal Server Error - Failed to update password"})
	}
	response := helpers.Response(200, "SUCCESS", "Password changed successfully")
	// fiber.StatusOK - code 200 - indicates that success of GET, PUT, and DELETE requests
	return ctx.Status(fiber.StatusOK).JSON(response)
}

// func UpdateProfile(ctx *fiber.Ctx) error {
// 	return ctx.SendString("Update Profile")
// }
