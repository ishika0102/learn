package helpers

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

// HashPassword hashes the given password using sha256
func HashPassword(password string) (string, error) {
	// Convert password string to bytes
	passwordBytes := []byte(password)

	// Hash the password using SHA-256
	hasher := sha256.New()
	hasher.Write(passwordBytes)
	hashedPasswordBytes := hasher.Sum(nil)

	// Convert the hashed password bytes to hexadecimal representation
	hashedPassword := hex.EncodeToString(hashedPasswordBytes)

	return hashedPassword, nil
}

func CheckPasswordHash(password, hashedPassword string) error {
	// Convert password string to bytes
	passwordBytes, _ := HashPassword(password)
	// Compare the hashed password with the provided hash
	if passwordBytes != hashedPassword {
		return fmt.Errorf("passwords do not match")
	}
	return nil
}
