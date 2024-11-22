package models

type Organization struct {
	OrgId string `json:"OrgId" bson:"_id"`
	Name  string `json:"Name" bson:"Name" validate:"required"`
	// OrgType       string `json:"OrgType,omitempty" bson:"OrgType" validate:"required"`
	CountryCode   string `json:"CountryCode,omitempty" bson:"CountryCode" validate:"required"`
	ContactNumber string `json:"ContactNumber,omitempty" bson:"ContactNumber" validate:"required"`
	Address       string `json:"Address,omitempty" bson:"Address" validate:"required"`
	City          string `json:"City,omitempty" bson:"City" validate:"required"`
	State         string `json:"State,omitempty" bson:"State" validate:"required"`
	Country       string `json:"Country,omitempty" bson:"Country" validate:"required"`
	Pincode       string `json:"Pincode,omitempty" bson:"Pincode" validate:"required"`
	OrgStatus     string `json:"OrgStatus" bson:"OrgStatus" validate:"required"`
	AuditDetails
}
