package main

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	// // Simple endpoint to check server status
	app.Get("/status", func(ctx *fiber.Ctx) error {

		return ctx.SendString("Server is running")
	})
	err := app.Listen("0.0.0.0:9002")
	if err != nil {
		fmt.Printf("Error starting the server: %v", err)
	}
}
