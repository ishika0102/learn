package patient

import "time"

// Patient Main Struct
type Patient struct {
	UHID             string
	AlternateUHID    string
	AbhaAddresses    []string
	PatientID        string
	EhrId            string
	FirstName        string
	LastName         string
	EmailID          string
	MobileNo         int
	Status           string
	DateOfBirth      time.Time
	Gender           string
	Occupation       string
	FamilyMembers    map[string]string
	Address          Address
	EmergencyContact EmergencyContact
	CreatedBy        string
	CreatedOn        time.Time
	ModifyBy         string
	ModifiedDate     time.Time
	CareProvider     CareProvider
	InsuranceStatus  string
	InsuranceID      string
}

type Address struct {
	Type        string
	Line1       string
	Line2       string
	City        string
	District    string
	State       string
	PinCode     string
	CountryCode string
}

type Contact struct {
	PhoneType   string
	PhoneNumber string
	EmailID     string
}

type EmergencyContact struct {
	Name         string
	Relationship string
	Address      Address
	Contact      Contact
}

type CareProvider struct {
	Name    string
	Type    string
	Address Address
	Contact Contact
}
