package user

import (
	"context"

	"go.mongodb.org/mongo-driver/mongo"
)

type UserRepository interface {
	InsertIntoDB(ctx context.Context, data interface{}) (*mongo.InsertOneResult, error)
}
