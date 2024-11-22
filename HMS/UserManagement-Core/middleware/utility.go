package middleware

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
)

// Define roles
const (
	DA   = "DA"
	OA   = "OA"
	ROOT = "ROOT"
)

// Define a map to store allowed roles for each API endpoint
var apiPermissions = map[string][]string{
	"CreateReseller":    {ROOT, DA},
	"UpdateReseller":    {},
	"ViewResellerAdmin": {},
	"CreateOrgAdmin":    {},
	"UpdateOrgAdmin":    {},
}

// // Middleware function to check if the user has access to the requested endpoint
func CheckAccess(funcName string, userRole string) error {
	// Check if the endpoint exists in permissions map
	allowedMethods, ok := apiPermissions[funcName]
	fmt.Println(funcName)
	if !ok {
		fmt.Println(ok)
		// Endpoint not found in permissions map, deny access
		return fiber.NewError(fiber.StatusUnauthorized, "Unauthorized endpoint")
	}
	// Check if the user's role is allowed
	for _, role := range allowedMethods {
		if role == userRole {
			// User has access
			fmt.Println("inside if check access")
			return nil
		}
	}

	// User's role is not allowed, deny access
	return fiber.NewError(fiber.StatusForbidden, "Forbidden, user has no access")
}
