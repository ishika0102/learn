package models

type Doctor struct {
	UserId         string   `json:"UserId"`
	Name           string   `json:"Name"`
	Speciality     string   `json:"Speciality"`
	Qualifications []string `json:"Qualifications"`
}
type ContactInfo struct {
	Email   string `json:"Email" validate:"required,email"`
	Phone   string `json:"Phone" validate:"required,numeric"`
	Address Address
}

type Address struct {
	Street  string `json:"Street" validate:"required"`
	City    string `json:"City" validate:"required"`
	State   string `json:"State" validate:"required"`
	Zip     string `json:"Zip" validate:"required,numeric"`
	Country string `json:"Country" validate:"required"`
}
