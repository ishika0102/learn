package configs

import (
	"context"
	"fmt"
	"hms-users/helpers"
	"hms-users/models"
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
var RolesCollection *mongo.Collection
var KC *models.KeycloakConfig

func init() {
	InitViper()
	KC = models.NewIdentityManager()
	MongoConnection = NewDbConnection()
	UserCollection = GetCollection(USER_COLLECTION)
	RolesCollection = GetCollection(ROLES_COLLECTION)
	CreateDefaultRolesInDb()
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
	return MongoConnection.Database("hms").Collection(collectionName)
}

func CreateDefaultRolesInDb() {
	data := make(map[string]interface{})
	data["FacilityId"] = "DefaultRoles"
	data["Roles"] = DefaultRoles

	filter := bson.M{"FacilityId": "DefaultRoles"}
	result := RolesCollection.FindOne(context.Background(), filter)

	//Creating the Modules Data if it doesn't exist
	if result.Err() == mongo.ErrNoDocuments {
		_, err := RolesCollection.InsertOne(context.Background(), data)
		if err != nil {
			errResponse := helpers.ErrorResponse(500, err.Error())
			fmt.Println(errResponse)
			return
		}
		return
	}

	//Updating the Modules Data if it already exists
	update := bson.M{"$set": bson.M{"Roles": data["DefaultRoles"]}}
	err := RolesCollection.FindOneAndUpdate(context.Background(), filter, update).Decode(&result)
	if err != nil {
		errResponse := helpers.ErrorResponse(500, err.Error())
		fmt.Println(errResponse)
		return
	}
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
	// Set individual config values in Viper
	viper.Set("ListenIP", os.Getenv("KeyCloakListenIP"))
	viper.Set("ListenPort", os.Getenv("KeyccloakListenPort"))
	viper.Set("Realm", os.Getenv("KeyCloakRealm"))
	viper.Set("BaseUrl", os.Getenv("KeyCloakBaseUrl"))
	viper.Set("ClientID", os.Getenv("KeyCloakRestApiClientId"))
	viper.Set("ClientSecret", os.Getenv("KeyCloakRestApiClientSecret"))
	viper.Set("PublicKey", os.Getenv("KeyCloakRealmRS256PublicKey"))

}
