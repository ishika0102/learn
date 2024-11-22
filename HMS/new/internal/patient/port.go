package patient

import (
	"context"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

type PatientRepository interface {
	InsertIntoDB(ctx context.Context, data *Patient) (*mongo.InsertOneResult, error)
	GetOne(filter primitive.M, projection bson.M) (map[string]interface{}, error)
}
