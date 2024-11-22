package handler

import (
	"HMS/internal/user/service"

	"github.com/gofiber/fiber/v2"
)

func UserRouter(app fiber.Router, s *service.UserServiceInjection) {
	app.Post("/", CreateUser(s.UserServiceProvider))
}
