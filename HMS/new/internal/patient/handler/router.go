package handler

import (
	"HMS/internal/patient/service"

	"github.com/gofiber/fiber/v2"
)

func PatientRouter(app fiber.Router, s *service.PatientServiceInjection) {
	app.Post("/", CreatePatient(s.PatientServiceProvider))
	app.Get("/:uhid", GetPatient(s.PatientServiceProvider))
}
