package main

import (
	"UserManagement-Core/routes"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

func main() {

	app := fiber.New()

	app.Use(cors.New())

	routes.LoginRoute(app)

	// app.Use(middleware.NewJwtMiddleware())
	routes.ResellerRoute(app)
	routes.OrgAdminRoute(app)
	routes.OrganizationRoute(app)

	// Routes

	// // Simple endpoint to check server status
	app.Get("/status", func(ctx *fiber.Ctx) error {

		return ctx.SendString("Server is running")
	})
	err := app.Listen("0.0.0.0:7001")
	if err != nil {
		fmt.Printf("Error starting the server: %v", err)
	}
}
