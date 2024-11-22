package middleware

import (
	"UserManagement-Core/models"
	"context"
	"fmt"
	"time"

	"github.com/Nerzal/gocloak/v13"
	"github.com/gofiber/fiber/v2"
)

func CheckLogin(ctx *fiber.Ctx) error {
	var user models.Login
	if err := ctx.BodyParser(&user); err != nil {
		return ctx.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Bad Request"})
	}

	// Validate user input
	if user.Username == "" || user.Password == "" {
		return ctx.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Username and Password is required"})
	}

	// Initialize gocloak client
	client := gocloak.NewClient("http://localhost:3000")
	fmt.Println(user.Username, user.Password)
	e := time.Now().Add(30 * time.Second).Unix()
	token, err := client.LoginAdmin(context.Background(), user.Username, user.Password, "HMS")
	if err != nil {
		fmt.Println("loginAdmin", err.Error())
		return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"message": "Failed to authenticate with Keycloak"})
	}

	token.ExpiresIn = int(e)

	return ctx.JSON(fiber.Map{"Token": token.AccessToken})
}
