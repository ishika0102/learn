package main

import (
	"fmt"
	"keycloak/middleware"
	"keycloak/routes"

	"log"
	"strings"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/spf13/viper"
)

func main() {
	initViper()

	app := fiber.New()
	app.Use(cors.New())

	routes.KeycloakRoute(app)
	app.Use(middleware.NewJwtMiddleware())

	// Define register route and handler
	fmt.Print("got request")

	// Start server
	err := app.Listen("0.0.0.0:7000")
	if err != nil {
		fmt.Printf("Error starting the keycloak server: %v", err)
	}

}

func initViper() {
	viper.SetConfigName("config")
	viper.SetConfigType("json")
	viper.AddConfigPath(".")
	viper.SetEnvPrefix("demo")
	viper.AutomaticEnv()
	viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_"))

	err := viper.ReadInConfig()
	if err != nil {
		panic(fmt.Errorf("unable to initialize viper: %w", err))
	}
	log.Println("viper config initialized")
}
