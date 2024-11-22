package configs

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/spf13/viper"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var MongoConnection *mongo.Client
var UserCollection *mongo.Collection
var FacilityCollection *mongo.Collection
var InventoryCollection *mongo.Collection
var SensorInventoryCollection *mongo.Collection

func init() {
	InitViper()
	MongoConnection = NewDbConnection()
	UserCollection = GetCollection("", USER_COLLECTION)
	FacilityCollection = GetCollection("", FACILITY_COLLECTION)
	SensorInventoryCollection = GetCollection("", SENSOR_INVENTORY_COLLECTION)
	CreateCollectionIndex(SensorInventoryCollection, "PatchId")
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
func GetCollection(prefix string, collectionName string) *mongo.Collection {
	return MongoConnection.Database("hms").Collection(prefix + collectionName)
}

func CreateCollectionIndex(collection *mongo.Collection, key string) {

	// Define the unique index model
	indexModel := mongo.IndexModel{
		Keys:    bson.D{{Key: key, Value: 1}},
		Options: options.Index().SetUnique(true),
	}
	// Create the index on the collection
	indexName, err := collection.Indexes().CreateOne(context.Background(), indexModel)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Created index:", indexName)
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

	// Set individual config values
	viper.Set("mongoURI", mongoURI)

}
