package middleware

import (
	"UserManagement-Core/services"
	"context"
	"fmt"
	"math/rand"
	"time"

	"github.com/Nerzal/gocloak/v13"
	"github.com/gofiber/fiber/v2"
	"github.com/pkg/errors"

	"github.com/spf13/viper"
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
	Username      string `json:"Username"`
	Password      string `json:"Password"`
	Email         string `json:"Email"`
	ContactNumber string `json:"ContactNumber"`
}

func RegisterUser(ctx *fiber.Ctx) error {
	// fmt.Println("register user")
	var user RegisterRequest
	err := ctx.BodyParser(&user)
	if err != nil {
		return errors.Wrap(err, "unable to parse incoming request")
	}
	kc := NewIdentityManager()
	// fmt.Println(kc)
	// Call register function to create user in Keycloak
	_, err = Register(user.Username, user.Password, user.Email, user.ContactNumber, kc)
	if err != nil {
		fmt.Println("err in register")
		// Return error response
		return ctx.Status(500).SendString(err.Error())
	}
	// Return success response
	return ctx.SendString("User registered!")
}

func loginRestApiClient(ctx context.Context, kc *KeycloakConfig) (*gocloak.JWT, error) {
	client := gocloak.NewClient(kc.BaseURL)
	token, err := client.LoginClient(ctx, kc.ClientID, kc.ClientSecret, kc.Realm)
	if err != nil {
		return nil, errors.Wrap(err, "unable to login the rest client")
	}
	return token, nil
}

func Register(username, password string, email string, contactNumber string, kc *KeycloakConfig) (string, error) {
	fmt.Println(username)
	tempPasswordStr := GenerateRandomCode()
	newUser := gocloak.User{
		Username:      gocloak.StringP(username),
		Enabled:       gocloak.BoolP(true),
		Email:         gocloak.StringP(email),
		EmailVerified: gocloak.BoolP(true),
		Credentials: &[]gocloak.CredentialRepresentation{
			{
				Type:      gocloak.StringP("password"), // Using a fixed type for password
				Value:     gocloak.StringP(tempPasswordStr),
				Temporary: gocloak.BoolP(true),
			},
		},
		Attributes: &map[string][]string{
			"ContactNumber": {contactNumber}, // Adding contact number to attributes
		},
	}
	token, err := loginRestApiClient(context.Background(), kc)
	if err != nil {
		fmt.Println("error in loginRestApiClient of register")
		return "", err
	}
	client := gocloak.NewClient(kc.BaseURL)
	userId, err := client.CreateUser(context.Background(), token.AccessToken, kc.Realm, newUser)
	if err != nil {
		fmt.Println("error in CreateUser of register", err)
		return "", err
	}
	err = client.SetPassword(context.Background(), token.AccessToken, userId, kc.Realm, password, false)
	if err != nil {
		fmt.Println("error in SetPassword of register")
		return "", err
	}
	err1 := services.InsertKeycloakUser(username, userId)
	if err1 != nil {
		fmt.Println("error in InsertKeycloakUser of register")
		return "", err
	}
	return userId, nil
}

func UpdateKeycloakUser(userID string, newAttributes map[string]interface{}) error {
	kc := NewIdentityManager()
	client := gocloak.NewClient(kc.BaseURL)

	// Obtain an admin token
	token, err := client.LoginClient(context.Background(), kc.ClientID, kc.ClientSecret, kc.Realm)
	if err != nil {
		fmt.Println("error-in-login", err)
		return err
	}
	fmt.Println("userid ", userID)
	// var user *gocloak.User
	// user = &gocloak.User{ID: &userID}
	// Get the user by ID
	user, err := client.GetUserByID(context.Background(), token.AccessToken, "HMS", userID)
	if err != nil {
		fmt.Println("error in get user by id ", err)
		return err
	}
	fmt.Println("user ", user)
	// Update user attributes based on newAttributes
	if username, ok := newAttributes["username"].(string); ok {
		user.Username = &username
	}
	if email, ok := newAttributes["email"].(string); ok {
		user.Email = &email
	}
	if contactNumber, ok := newAttributes["ContactNumber"].(string); ok {
		(*user.Attributes)["ContactNumber"] = []string{contactNumber}
	}

	// Update the user
	err = client.UpdateUser(context.Background(), token.AccessToken, "HMS", *user)
	if err != nil {
		fmt.Println("error in update user", err)
		return err
	}

	return nil
}

// getClientSecret retrieves the client secret key for the specified client ID.
func getClientSecret(keycloak *gocloak.GoCloak, ctx context.Context, realmName, clientID, adminUsername, adminPassword string) (*string, error) {
	// Authenticate as admin
	token, err := keycloak.LoginAdmin(ctx, adminUsername, adminPassword, clientID)
	if err != nil {
		return nil, fmt.Errorf("error logging in as admin: %v", err)
	}

	// Get client secret
	clientSecretObj, err := keycloak.GetClientSecret(ctx, token.AccessToken, realmName, clientID)
	if err != nil {
		return nil, fmt.Errorf("error getting client secret: %v", err)
	}

	return clientSecretObj.Value, nil
}

// getPublicKey retrieves the public key for the specified attribute (e.g., `public-key`) of a client.
func GetPublicKey(realmName, clientID, adminUsername, adminPassword string) (*string, error) {
	fmt.Println("inside get public key")
	kc := NewIdentityManager()
	client := gocloak.NewClient(kc.BaseURL)
	// Authenticate as admin
	_, err := client.LoginAdmin(context.Background(), adminUsername, adminPassword, realmName)
	if err != nil {
		return nil, fmt.Errorf("error logging in as admin: %v", err)
	}

	// Get public key
	publicKeyObj, err := client.GetIssuer(context.Background(), realmName)
	if err != nil {
		return nil, fmt.Errorf("error getting public key: %v", err)
	}
	fmt.Println(publicKeyObj.PublicKey)

	return publicKeyObj.PublicKey, nil
}

func GenerateRandomCode() string {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))

	// Generate a random 6-digit code
	code := fmt.Sprintf("%06d", r.Intn(1000000))

	return code
}
