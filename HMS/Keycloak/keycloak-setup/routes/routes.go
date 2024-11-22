package routes

import (
	"keycloak/controller"

	"github.com/gofiber/fiber/v2"
)

func KeycloakRoute(app fiber.Router) {
	app.Post("/register", controller.RegisterUser)
}
