package models

import "github.com/spf13/viper"

type KeycloakConfig struct {
	Realm        string
	BaseURL      string
	ClientID     string
	ClientSecret string
	PublicKey    string
}

func NewIdentityManager() *KeycloakConfig {

	return &KeycloakConfig{
		BaseURL:      viper.GetString("BaseUrl"),
		Realm:        viper.GetString("Realm"),
		ClientID:     viper.GetString("ClientId"),
		ClientSecret: viper.GetString("ClientSecret"),
		PublicKey:    viper.GetString("PublicKey"),
	}
}
