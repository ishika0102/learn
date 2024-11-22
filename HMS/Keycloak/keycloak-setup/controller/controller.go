package controller

import (
	"context"
	"fmt"

	"github.com/Nerzal/gocloak/v13"
	"github.com/gofiber/fiber/v2"
	"github.com/pkg/errors"
	"github.com/spf13/viper"

	"keycloak/helpers"
)

type KeycloakConfig struct {
	Realm        string
	BaseURL      string
	ClientID     string
	ClientSecret string
}

func NewIdentityManager() *KeycloakConfig {

	return &KeycloakConfig{
		BaseURL:      viper.GetString("KeyCloak.BaseUrl"),
		Realm:        viper.GetString("KeyCloak.Realm"),
		ClientID:     viper.GetString("KeyCloak.RestApi.ClientId"),
		ClientSecret: viper.GetString("KeyCloak.RestApi.ClientSecret"),
	}
}

type RegisterRequest struct {
	Username string `json:"Username"`
	Password string `json:"Password"`
}

func RegisterUser(ctx *fiber.Ctx) error {

	var user RegisterRequest
	err := ctx.BodyParser(&user)
	if err != nil {
		return errors.Wrap(err, "unable to parse incoming request")
	}
	kc := NewIdentityManager()
	// Call register function to create user in Keycloak
	userId, err := register(user.Username, user.Password, kc)
	if err != nil {
		fmt.Println("err in register")
		// Return error response
		return ctx.Status(500).SendString(err.Error())
	}
	// Return success response
	response := helpers.Response(200, "User registered!", fiber.Map{"KeycloakUserId": userId})
	return ctx.JSON(response)

}

func loginRestApiClient(ctx context.Context, kc *KeycloakConfig) (*gocloak.JWT, error) {
	client := gocloak.NewClient(kc.BaseURL)
	token, err := client.LoginClient(ctx, kc.ClientID, kc.ClientSecret, kc.Realm)
	if err != nil {
		return nil, errors.Wrap(err, "unable to login the rest client")
	}
	return token, nil
}

func register(username, password string, kc *KeycloakConfig) (string, error) {
	newUser := gocloak.User{
		Username: gocloak.StringP(username),
		Enabled:  gocloak.BoolP(true),
	}
	token, err := loginRestApiClient(context.Background(), kc)
	if err != nil {
		fmt.Println("error in loginRestApiClient of register")
		return "", err
	}
	client := gocloak.NewClient(kc.BaseURL)
	userId, err := client.CreateUser(context.Background(), token.AccessToken, kc.Realm, newUser)
	if err != nil {
		fmt.Println("error in CreateUser of register")
		return "", err
	}
	err = client.SetPassword(context.Background(), token.AccessToken, userId, kc.Realm, password, false)
	if err != nil {
		fmt.Println("error in SetPassword of register")
		return "", err
	}
	return userId, nil
}
