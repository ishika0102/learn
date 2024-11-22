package service

import (
	"HMS/internal/patient/infrastructure"
	"HMS/pkg/database"

	"go.uber.org/dig"
)

type PatientServiceInjection struct {
	db                     *database.MongoDB
	PatientServiceProvider *PatientService
}

func NewPatientServiceInjection() *PatientServiceInjection {
	return &PatientServiceInjection{}
}
func ProvidePatientComponents(c *dig.Container) {
	// repositorory provider injection
	err := c.Provide(infrastructure.NewPatientRepository)
	if err != nil {
		panic(err)
	}

	// service provider injection
	err = c.Provide(NewPatientService)
	if err != nil {
		panic(err)
	}
}

func (s *PatientServiceInjection) InitPatientComponents(container *dig.Container) error {
	return container.Invoke(func(db *database.MongoDB, us *PatientService) {
		s.db = db
		s.PatientServiceProvider = us
	})
}

// Define your service methods here
