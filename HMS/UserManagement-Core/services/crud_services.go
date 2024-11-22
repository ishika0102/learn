package services

import (
	"context"

	// "reflect"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	// "go.mongodb.org/mongo-driver/mongo/options"

	"UserManagement-Core/configs"
	"UserManagement-Core/models"
)

func InsertIntoDB(collection *mongo.Collection, data interface{}) (*mongo.InsertOneResult, error) {

	result, err := collection.InsertOne(context.Background(), data)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func GetUserByUsername(username string) (interface{}, error) {
	var user interface{}
	err := configs.UserCollection.FindOne(context.Background(), bson.M{"UserName": username}).Decode(&user)
	return user, err
}

func GetUserByUserId(userid string) (interface{}, error) {
	var user interface{}
	err := configs.UserCollection.FindOne(context.Background(), bson.M{"_id": userid}).Decode(&user)
	return user, err
}

func GetAll(filter primitive.M, projection bson.M, collection *mongo.Collection) ([]bson.M, error) {

	cursor, err := collection.Find(context.Background(), filter, options.Find().SetProjection(projection))
	if err != nil {
		return nil, err
	}
	defer cursor.Close(context.Background())

	var results []bson.M

	for cursor.Next(context.Background()) {
		var result bson.M
		if err := cursor.Decode(&result); err != nil {
			return nil, err
		}
		results = append(results, result)
	}

	if err := cursor.Err(); err != nil {
		return nil, err
	}

	return results, nil
}
func GetOne(filter primitive.M, projection bson.M, collection *mongo.Collection) (map[string]interface{}, error) { // changed the return type from interface to map string interface see if its effecting other apis
	options := options.FindOne().SetProjection(projection)
	// Create a map to hold the decoded values
	var result map[string]interface{}

	err := collection.FindOne(context.Background(), filter, options).Decode(&result)
	if err != nil {
		// fmt.Println(err)
		return nil, err
	}
	return result, nil
}

func UpdateOne(filter primitive.M, projection bson.M, collection *mongo.Collection) (interface{}, error) {
	// Set options for FindOneAndUpdate : to update a document and also retrieve its original or modified state in a single operation.
	options := options.FindOneAndUpdate().SetReturnDocument(options.After)
	// Perform FindOneAndUpdate operation
	var result map[string]interface{}
	err := collection.FindOneAndUpdate(context.Background(), filter, projection, options).Decode(&result)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func CheckEmailExists(email string) (bool, error) {
	var result interface{}
	err := configs.UserCollection.FindOne(context.Background(), bson.M{"basicuserinfo.Email": email}).Decode(&result)
	if err != nil {
		if err == mongo.ErrNoDocuments {
			return false, nil // Email does not exist
		}

		return false, err // Return other errors
	}
	return true, nil // Email exists
}

func GetKeycloakId(id string) (string, error) {
	var result models.User
	filter := bson.M{"_id": id}
	projection := bson.M{"KeycloakUserId": 1}
	options := options.FindOne().SetProjection(projection)
	err := configs.UserCollection.FindOne(context.Background(), filter, options).Decode(&result)
	if err != nil {
		return "", err
	}

	return result.KeycloakUserId, nil

}
