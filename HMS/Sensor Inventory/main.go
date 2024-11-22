package main

import (
	"SensorInventory/routes"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

func main() {
	app := fiber.New()
	app.Use(cors.New())
	routes.SensorInventory(app)

	// // Simple endpoint to check server status
	app.Get("/status", func(ctx *fiber.Ctx) error {

		return ctx.SendString("Server is running")
	})
	err := app.Listen("0.0.0.0:5000")
	if err != nil {
		fmt.Printf("Error starting the server: %v", err)
	}

}
