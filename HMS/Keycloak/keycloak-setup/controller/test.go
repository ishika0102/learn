package controller

import (
	"context"

	"github.com/Nerzal/gocloak/v13"
)

func registerUserAndGetID(username, email, password string) (string, error) {
	keycloak := gocloak.NewClient("https://your-keycloak-domain/auth")

	ctx := context.Background()
	adminToken, err := keycloak.LoginAdmin(ctx, "your-admin-username", "your-admin-password", "your-realm")
	if err != nil {
		return "", err
	}

	newUser := gocloak.User{
		Username: &username,
		Email:    &email,
		Enabled:  gocloak.BoolP(true),
		// Credentials: []gocloak.CredentialRepresentation{
		// 	{Type: gocloak.StringP("password"), Value: &password},
		// },
	}

	createdUser, err := keycloak.CreateUser(ctx, adminToken.AccessToken, "your-realm", newUser)
	if err != nil {
		return "", err
	}

	return createdUser, nil
}
