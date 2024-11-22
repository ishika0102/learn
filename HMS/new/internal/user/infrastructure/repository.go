package infrastructure

import (
	"context"

	"HMS/pkg/database"

	"go.mongodb.org/mongo-driver/mongo"
)

type UserRepository struct {
	collection *mongo.Collection
}

func NewUserRepository(dbcon *database.MongoDB) *UserRepository {
	return &UserRepository{
		collection: dbcon.Database.Collection("users"),
	}
}

func (r *UserRepository) InsertIntoDB(ctx context.Context, data interface{}) (*mongo.InsertOneResult, error) {

	result, err := r.collection.InsertOne(ctx, data)
	if err != nil {
		return nil, err
	}
	return result, nil
}
