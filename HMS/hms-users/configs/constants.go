package configs

var USER_COLLECTION = "users"
var ROLES_COLLECTION = "roles"

var DefaultRoles = map[string][]string{
	"Doctor":             {"*"},
	"Nurse":              {"read", "write"},
	"FrontOffice":        {"read", "write"},
	"Pharmacists":        {"read", "write"},
	"BillingSpecialists": {"read", "write"},
}
