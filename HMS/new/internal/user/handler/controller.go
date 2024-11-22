package handler

import (
	"HMS/internal/user"
	"HMS/internal/user/service"
	"HMS/pkg/logger"
	"HMS/pkg/message"
	"HMS/pkg/validate"
	"os"

	// "time"

	"HMS/pkg/apperror"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/log"
	// "github.com/opentracing/opentracing-go/log"
	// "github.com/opentracing/opentracing-go/log"
)

type UserSchema struct {
	IdentityNumber string `json:"identity_number" validate:"required,min=6"`
	FirstName      string `json:"first_name" validate:"required,min=2"`
	LastName       string `json:"last_name" validate:"required,min=2"`
	Email          string `json:"email" validate:"required,email"`
	// DateOfBirth    time.Time `json:"date_of_birth" validate:"required"`
}

func CreateUser(s *service.UserService) fiber.Handler {
	return func(c *fiber.Ctx) error {
		// Get body request
		var body UserSchema
		// Validate the body
		err := c.BodyParser(&body)
		if err != nil {
			// Map the error and response via the middleware
			// config.Logger.Printf("err:%v", err)
			logger.DefineLogger(20, nil, nil, "main", os.Getpid(), "Failed to parse body", map[string]interface{}{"error": err.Error()})
			return err
		}

		// Validate schema
		serr, err := validate.Validate(body)
		if err != nil {
			log.Error(serr)
			return apperror.BadRequest(serr)
		}

		// No schema errores then map body to domain
		u := &user.User{
			IdentityNumber: body.IdentityNumber,
			FirstName:      body.FirstName,
			LastName:       body.LastName,
			Email:          body.Email,
			// DateOfBirth:    body.DateOfBirth,
		}

		// Execute the service
		result, err := s.CreateUser(u)
		if err != nil {
			// if service response an error return via the middleware
			log.Error(err)
			return err
		}

		// Success execution
		return c.Status(fiber.StatusCreated).JSON(message.SuccessResponse(&result))
	}
}
