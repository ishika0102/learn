package services

import (
	"context"
	"fmt"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func InsertIntoDB(collection *mongo.Collection, data interface{}) (*mongo.InsertOneResult, error) {

	result, err := collection.InsertOne(context.Background(), data)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func GetAll(filter primitive.M, projection bson.M, collection *mongo.Collection) ([]bson.M, error) {

	cursor, err := collection.Find(context.Background(), filter, options.Find().SetProjection(projection))
	if err != nil {
		fmt.Println("getall", err.Error())
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
		fmt.Println("getall", err.Error())
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

func FindOne(filter primitive.M, collection *mongo.Collection) (interface{}, error) {
	var result bson.M
	err := collection.FindOne(context.Background(), filter).Decode(&result)
	if err != nil {
		return nil, err
	}
	return result, nil
}
