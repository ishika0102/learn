package middleware

import (
	"context"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"fmt"

	"github.com/Nerzal/gocloak/v13"
	contribJwt "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	golangJwt "github.com/golang-jwt/jwt/v5"
	"github.com/pkg/errors"
	"github.com/spf13/viper"
)

func NewJwtMiddleware(ctx *fiber.Ctx) error {
	fmt.Println("inside jwt middleware")
	base64Str := viper.GetString("KeyCloak.RealmRS256PublicKey")
	publicKey, err := parseKeycloakRSAPublicKey(base64Str)
	// fmt.Println(publicKey)
	if err != nil {
		panic(err)
	}
	contribJwt.New(contribJwt.Config{
		SigningKey: contribJwt.SigningKey{
			JWTAlg: contribJwt.RS256,
			Key:    publicKey,
		},
		SuccessHandler: func(ctx *fiber.Ctx) error {
			_, err := successHandler(ctx)
			return err
		},
	})
	return ctx.Next()
}

func successHandler(ctx *fiber.Ctx) (*gocloak.IntroSpectTokenResult, error) {
	fmt.Println("inside success handler")
	jwtToken := ctx.Locals("user").(*golangJwt.Token)
	// fmt.Println("jwt ", jwtToken.Raw)
	claims := jwtToken.Claims.(golangJwt.MapClaims)
	// fmt.Println("claims ", claims)
	ctxCopy := ctx.UserContext()

	var contextWithClaims = context.WithValue(ctxCopy, "claims", claims)
	kc := NewIdentityManager()
	client := gocloak.NewClient(kc.BaseURL)
	rptResult, err := client.RetrospectToken(contextWithClaims, jwtToken.Raw, kc.ClientID, kc.ClientSecret, kc.Realm)
	if err != nil {
		return nil, errors.Wrap(err, "unable to retrospect token")
	}
	if !*rptResult.Active {
		return nil, errors.New("token is not active")
	}

	return rptResult, nil
}

func parseKeycloakRSAPublicKey(base64Str string) (*rsa.PublicKey, error) {
	buf, err := base64.StdEncoding.DecodeString(base64Str)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	parsedKey, err := x509.ParsePKIXPublicKey(buf)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	publicKey, ok := parsedKey.(*rsa.PublicKey)
	if ok {
		// fmt.Println("public key ", publicKey)
		return publicKey, nil
	}
	return nil, fmt.Errorf("unexpected key type %T", publicKey)
}
