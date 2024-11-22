package service

import (
	"HMS/internal/patient"
	"HMS/internal/patient/infrastructure"
	"context"
	"log"

	"HMS/pkg/apperror"

	"go.mongodb.org/mongo-driver/mongo"
)

type PatientService struct {
	patientRepository patient.PatientRepository
}

func NewPatientService(repository *infrastructure.PatientRepository) *PatientService {
	// return the pointer to patient service
	return &PatientService{
		patientRepository: repository,
	}
}

func (ps *PatientService) CreatePatient(p *patient.Patient) (*mongo.InsertOneResult, error) {
	// create the new patient and return the id
	id, err := ps.patientRepository.InsertIntoDB(context.Background(), p)
	if err != nil {
		// database error
		log.Println(err)
		err := apperror.InternalServerError()
		return nil, err
	}

	// patient created successfuly
	return id, nil
}

func (ps *PatientService) GetPatient() ([]patient.Patient, error) {

	filter:= bson.M{"_id"
	// get all patients
	patients, err := ps.patientRepository.GetOne(filter,projection)
	if err != nil {
		// database error
		log.Println(err)
		err := apperror.InternalServerError()
		return nil, err
	}
	return patients, nil
}
