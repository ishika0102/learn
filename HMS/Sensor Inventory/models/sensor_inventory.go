package models

type SensorInventory struct {
	PatchId    string `json:"PatchId" bson:"PatchId" validate:"required"`
	Expirydate string `json:"Expirydate" bson:"Expirydate"`
	BoxCode    string `json:"BoxCode" bson:"BoxCode"`
	SSID       string `json:"SSID" bson:"SSID"`
	Vendor     string `json:"Vendor" bson:"Vendor"`
	AuditDetails
}

type AuditDetails struct {
	CreatedByUserId  string `json:"CreatedByUserId,omitempty" bson:"CreatedByUserId"`
	CreatedOn        string `json:"CreatedOn,omitempty" bson:"CreatedOn"`
	ModifiedByUserId string `json:"ModifiedByUserId,omitempty" bson:"ModifiedByUserId,omitempty"`
	ModifiedOn       string `json:"ModifiedOn,omitempty" bson:"ModifiedOn,omitempty"`
}
