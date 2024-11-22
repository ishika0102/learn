package infrastructure

import (
	"context"

	"HMS/internal/patient"
	"HMS/pkg/database"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type PatientRepository struct {
	collection *mongo.Collection
}

func NewPatientRepository(dbcon *database.MongoDB) *PatientRepository {
	return &PatientRepository{
		collection: dbcon.Database.Collection("patients"),
	}
}

func (r *PatientRepository) InsertIntoDB(ctx context.Context, data *patient.Patient) (*mongo.InsertOneResult, error) {

	result, err := r.collection.InsertOne(ctx, data)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (r *PatientRepository) GetOne(filter primitive.M, projection bson.M) (map[string]interface{}, error) {
	options := options.FindOne().SetProjection(projection)
	var result map[string]interface{}

	err := r.collection.FindOne(context.Background(), filter, options).Decode(&result)
	if err != nil {
		return nil, err
	}
	return result, nil
}
