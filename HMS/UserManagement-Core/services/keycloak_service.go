package services

import (
	"UserManagement-Core/configs"
	"UserManagement-Core/models"
	"context"

	"go.mongodb.org/mongo-driver/bson"
)

func InsertKeycloakUser(username string, userid string) error {
	data := bson.M{
		"username": username,
		"userid":   userid,
	}
	_, err := configs.KeycloakUserCollection.InsertOne(context.Background(), data)
	if err != nil {
		return err
	}
	return nil
}

func GetKeycloakUser(username string) (string, error) {
	var user models.KeycloakUser
	err := configs.KeycloakUserCollection.FindOne(context.Background(), bson.M{"username": username}).Decode(&user)
	return user.UserID, err
}
