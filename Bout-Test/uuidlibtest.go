package main

import (
	"crypto/rand"
	"fmt"
	"math/big"
)

func generateUniqueID() string {
	const digits = "0123456789"
	idLength := 8
	var id string

	for i := 0; i < idLength; i++ {
		num, err := rand.Int(rand.Reader, big.NewInt(int64(len(digits))))
		if err != nil {
			fmt.Println("Error generating random number:", err)
			return ""
		}
		id += string(digits[num.Int64()])
	}

	return id
}

func main() {
	uniqueID := generateUniqueID()
	fmt.Println("Generated Unique ID:", uniqueID)
}
