package handler

import (
	"HMS/internal/patient"
	"HMS/internal/patient/service"
	"HMS/pkg/logger"
	"HMS/pkg/message"
	"HMS/pkg/validate"
	"os"
	"time"

	// "time"

	"HMS/pkg/apperror"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/log"
)

type createPatientSchema struct {
	UHID             string    `json:"uhid"`
	AlternateUHID    string    `json:"alternate_uhid"`
	AbhaAddresses    []string  `json:"abha_address"`
	FirstName        string    `json:"first_name" validate:"required,min=3"`
	LastName         string    `json:"last_name"`
	EmailID          string    `json:"email_id" validate:"required,email"`
	MobileNo         int       `json:"mobile_no" validate:"required,min=10"`
	DateOfBirth      time.Time `json:"date_of_birth" validate:"required"`
	Gender           string    `json:"gender" validate:"required"`
	Occupation       string    `json:"occupation"`
	Address          Address
	EmergencyContact EmergencyContact
}

type Address struct {
	Type        string `json:"type"`
	Line1       string `json:"line_1"`
	Line2       string `json:"line_2"`
	City        string `json:"city"`
	District    string `json:"district"`
	State       string `json:"state"`
	PinCode     string `json:"pin_code"`
	CountryCode string `json:"country_code"`
}

type Contact struct {
	PhoneType   string `json:"phone_type"`
	PhoneNumber string `json:"phone_number"`
	EmailID     string `json:"email_id"`
}

type EmergencyContact struct {
	Name         string  `json:"name"`
	Relationship string  `json:"relationship"`
	Address      Address `json:"address"`
	Contact      Contact `json:"contact"`
}

// Convert address to patient.Address
func ConvertToPatientAddress(a Address) patient.Address {
	return patient.Address{
		Type:        a.Type,
		Line1:       a.Line1,
		Line2:       a.Line2,
		City:        a.City,
		District:    a.District,
		State:       a.State,
		PinCode:     a.PinCode,
		CountryCode: a.CountryCode,
	}
}

// Convert address to patient.Contact
func ConvertToPatientContact(a Contact) patient.Contact {
	return patient.Contact{
		PhoneType:   a.PhoneType,
		PhoneNumber: a.PhoneNumber,
		EmailID:     a.EmailID,
	}
}

// Convert address to patient.Address
func ConvertToPatientEmergencyContact(a EmergencyContact) patient.EmergencyContact {
	return patient.EmergencyContact{
		Name:         a.Name,
		Relationship: a.Relationship,
		Address:      ConvertToPatientAddress(a.Address),
		Contact:      ConvertToPatientContact(a.Contact),
	}
}

func CreatePatient(s *service.PatientService) fiber.Handler {
	return func(c *fiber.Ctx) error {
		// Get body request
		var body createPatientSchema
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
		p := &patient.Patient{
			UHID:             body.UHID,
			AlternateUHID:    body.AlternateUHID,
			AbhaAddresses:    body.AbhaAddresses,
			PatientID:        "PID001",
			EhrId:            "EHRID001",
			FirstName:        body.FirstName,
			LastName:         body.LastName,
			EmailID:          body.EmailID,
			MobileNo:         body.MobileNo,
			Status:           "active",
			DateOfBirth:      body.DateOfBirth,
			Gender:           body.Gender,
			Occupation:       body.Occupation,
			Address:          ConvertToPatientAddress(body.Address),
			EmergencyContact: ConvertToPatientEmergencyContact(body.EmergencyContact),
			CreatedBy:        "ME",
			CreatedOn:        time.Now().UTC(),
		}

		// Execute the service
		result, err := s.CreatePatient(p)
		if err != nil {
			// if service response an error return via the middleware
			log.Error(err)
			return err
		}

		// Success execution
		return c.Status(fiber.StatusCreated).JSON(message.SuccessResponse(&result))
	}
}

func GetPatient(s *service.PatientService) fiber.Handler {
	return func(c *fiber.Ctx) error {
		// Execute the service
		result, err := s.GetPatient()
		if err != nil {
			// if service response an error return via the middleware
			log.Error(err)
			return err
		}

		// Success execution
		return c.Status(fiber.StatusOK).JSON(message.SuccessResponse(&result))
	}
}
