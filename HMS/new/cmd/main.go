package main

import (
	"fmt"
	"log"
	"os"

	userhandler "HMS/internal/user/handler"
	"HMS/pkg/injection"
	"HMS/pkg/logger"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/fiber/v2/middleware/helmet"
	"github.com/joho/godotenv"
)

func init() {
	// Load the .env file
	if err := godotenv.Load(); err != nil {
		log.Fatalf("Error loading .env file : %v", err)
	}
}
func main() {
	injection.ProvideComponents()

	if err := injection.InitComponents(); err != nil {
		log.Fatalf("Failed to initialize components: %v", err)
	}
	app := fiber.New()

	// add fiber middlewares
	app.Use(cors.New())
	app.Use(helmet.New())

	// create health end point
	app.Get("/health", func(c *fiber.Ctx) error {
		return c.SendString("Status ok - api running")
	})
	// // Simple endpoint to check server status
	app.Get("/", func(ctx *fiber.Ctx) error {

		return ctx.SendString("Server is running")
	})

	logger.InitLogger()
	// logger.Logger.Printf("Logger is working successfully")
	logger.DefineLogger(20, nil, nil, "main", os.Getpid(), "Logger is working successfully", nil)

	// create api group
	api := app.Group("/api") // /api

	// add api group for user
	userApi := api.Group("/user") // /api/user
	userhandler.UserRouter(userApi, injection.UserServiceProvider)

	err := app.Listen("0.0.0.0:8000")
	if err != nil {
		fmt.Printf("Error starting the server: %v", err)
		// logger.Logger.Printf("Failed to start server: %v", err)
		logger.DefineLogger(20, nil, nil, "main", os.Getpid(), "Failed to start server", map[string]interface{}{"error": err.Error()})
		os.Exit(1)

	}

}
