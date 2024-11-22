package helpers

import (
	"fmt"
	"strconv"
	"time"

	"github.com/google/uuid"
)

func GenerateUserID(prefix string) string {
	dateTimeStr := strconv.FormatInt(time.Now().UTC().UnixMicro(), 10)
	return prefix + "_" + dateTimeStr
}

func GenerateID(prefix string) string {
	id := uuid.New()
	// Get the first 6 characters of the UUID
	idStr := id.String()[:6]

	// Convert the hexadecimal string to an integer
	hexInt, err := strconv.ParseInt(idStr, 16, 64)
	if err != nil {
		// TODO: FUTURE : Handle error
		return ""
	}
	// Convert the hexadecimal integer to a 6-digit decimal number
	randomID := int(hexInt)%900000 + 100000
	final_id := fmt.Sprintf("%06d", randomID)
	return prefix + "_" + final_id
}
