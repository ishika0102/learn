package middleware

import (
	"context"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"fmt"
	"keycloak/controller"

	"github.com/Nerzal/gocloak/v13"
	contribJwt "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	golangJwt "github.com/golang-jwt/jwt/v5"
	"github.com/pkg/errors"
	"github.com/spf13/viper"
)

func NewJwtMiddleware() fiber.Handler {
	base64Str := viper.GetString("KeyCloak.RealmRS256PublicKey")
	publicKey, err := parseKeycloakRSAPublicKey(base64Str)
	if err != nil {
		panic(err)
	}
	return contribJwt.New(contribJwt.Config{
		SigningKey: contribJwt.SigningKey{
			JWTAlg: contribJwt.RS256,
			Key:    publicKey,
		},
		SuccessHandler: func(ctx *fiber.Ctx) error {
			_, err := successHandler(ctx)
			return err
		},
	})
}

func successHandler(ctx *fiber.Ctx) (*gocloak.IntroSpectTokenResult, error) {
	jwtToken := ctx.Locals("user").(*golangJwt.Token)
	claims := jwtToken.Claims.(golangJwt.MapClaims)

	ctxCopy := ctx.UserContext()

	var contextWithClaims = context.WithValue(ctxCopy, "claims", claims)
	kc := controller.NewIdentityManager()
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
		return nil, err
	}
	parsedKey, err := x509.ParsePKIXPublicKey(buf)
	if err != nil {
		return nil, err
	}
	publicKey, ok := parsedKey.(*rsa.PublicKey)
	if ok {
		return publicKey, nil
	}
	return nil, fmt.Errorf("unexpected key type %T", publicKey)
}
