package configs

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/spf13/viper"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var MongoConnection *mongo.Client
var UserCollection *mongo.Collection
var OrganizationCollection *mongo.Collection
var KeycloakUserCollection *mongo.Collection

func init() {
	InitViper()
	MongoConnection = NewDbConnection()
	UserCollection = GetCollection(USER_COLLECTION)
	OrganizationCollection = GetCollection(ORGANIZATION_COLLECTION)
	KeycloakUserCollection = GetCollection(KEYCLOAK_USERS)
}
func NewDbConnection() *mongo.Client {

	clientOptions := options.Client().ApplyURI(viper.GetString("mongoURI"))
	client, err := mongo.Connect(context.Background(), clientOptions)
	if err != nil {
		log.Fatal("newdbconnection", err)
	}
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	// Ping the database
	// TODO: FUTURE : handle error if not able to connect to mongodb below
	err = client.Ping(ctx, nil)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Connected to MongoDB")

	return client
}

// GetCollection returns a collection from the database
func GetCollection(collectionName string) *mongo.Collection {
	return MongoConnection.Database("user-management-core").Collection(collectionName)
}

func InitViper() {
	fmt.Println("Initializing Viper")
	// Load .env
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Set config values directly from environment variables
	mongoURI := os.Getenv("MONGO_URL")

	// Initialize Viper
	viper.SetConfigName("configs")
	viper.SetConfigType("json")
	viper.AddConfigPath(".")
	if err := viper.ReadInConfig(); err != nil {
		log.Fatalf("Error reading config file, %s", err)
	}

	// Set individual config values
	viper.Set("mongoURI", mongoURI)

}
