package models

type Login struct {
	Username      string `json:"Username" validate:"required"`
	Password      string `json:"Password" validate:"required"`
	ContactNumber string `json:"ContactNumber" validate:"required"`
	Email         string `json:"Email" validate:"required"`
}

type KeycloakUser struct {
	Username string `json:"username"`
	UserID   string `json:"userid"`
}
