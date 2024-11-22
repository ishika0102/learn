package models

type Root struct {
	UserId        string `json:"UserId" bson:"_id"`
	Username      string `json:"Username" bson:"Username"`
	Password      string `json:"Password" bson:"Password"`
	UserRole      string `json:"UserRole" bson:"UserRole"`
	CreatedOn     string `json:"CreatedOn" bson:"CreatedOn"`
	BasicUserInfo `bson:",inline"`
	AuditDetails
}

type Reseller struct {
	User `bson:",inline"`
	AuditDetails
	BasicUserInfo `bson:",inline"`
}

type OrgAdmin struct {
	User          `bson:",inline"`
	BelongToOrgId string `json:"BelongToOrgId" bson:"BelongToOrgId" validate:"required"`
	AuditDetails
	BasicUserInfo `bson:",inline"`
}
type User struct {
	UserId         string `json:"UserId" bson:"_id"`
	Username       string `json:"Username" bson:"Username" validate:"required"`
	Password       string `json:"Password" bson:"Password" validate:"required"`
	UserRole       string `json:"UserRole" bson:"UserRole" validate:"required"`
	KeycloakUserId string `json:"KeycloakUserId" bson:"KeycloakUserId"`
	UserStatus     string `json:"UserStatus" bson:"UserStatus" validate:"required"`
}

type AuditDetails struct {
	CreatedByUserId  string `json:"CreatedByUserId,omitempty" bson:"CreatedByUserId"`
	CreatedOn        string `json:"CreatedOn,omitempty" bson:"CreatedOn"`
	ModifiedByUserId string `json:"ModifiedByUserId,omitempty" bson:"ModifiedByUserId,omitempty"`
	ModifiedOn       string `json:"ModifiedOn,omitempty" bson:"ModifiedOn,omitempty"`
}

// NOTE : adjust this struct for the user profile api. try to keep the user profile api common for all admins
type BasicUserInfo struct {
	FirstName     string `json:"FirstName" bson:"FirstName" validate:"required"`
	LastName      string `json:"LastName" bson:"LastName" validate:"required"`
	Email         string `json:"Email" bson:"Email" validate:"required,email"`
	CountryCode   string `json:"CountryCode" bson:"CountryCode" validate:"required"`
	ContactNumber string `json:"ContactNumber" bson:"ContactNumber" validate:"required"`
}

type ChangePasswordByUser struct {
	UserId      string `json:"UserId" bson:"UserId" validate:"required"`
	OldPassword string `json:"OldPassword" bson:"OldPassword" validate:"required"`
	NewPassword string `json:"NewPassword" bson:"NewPassword" validate:"required"`
}

type UserInterface interface {
	ViewProfile()
}
