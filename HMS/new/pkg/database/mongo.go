package database

import (
	"context"
	"os"
	"time"

	"HMS/pkg/logger"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type MongoDB struct {
	Client   *mongo.Client
	Database *mongo.Database
}

func NewMongoDB() (*MongoDB, error) {
	clientOpts := options.Client().ApplyURI(os.Getenv("MONGO_URI"))

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	client, err := mongo.Connect(ctx, clientOpts)
	if err != nil {
		return nil, err
	}

	if err := client.Ping(ctx, nil); err != nil {
		return nil, err
	}

	dbName := os.Getenv("DB_NAME")
	if dbName == "" {
		logger.Logger.Fatalf("DB_NAME environment variable is required")
	}

	return &MongoDB{
		Client:   client,
		Database: client.Database(dbName),
	}, nil
}

func (db *MongoDB) Close() error {
	return db.Client.Disconnect(context.Background())
}
