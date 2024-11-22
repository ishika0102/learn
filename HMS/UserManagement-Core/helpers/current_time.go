package helpers

import (
	"strconv"
	"time"
)

func GetCurrentEpochTimeInFormat(inMicroseconds bool) string {
	currentTime := time.Now().UTC()

	if inMicroseconds {
		return strconv.FormatInt(currentTime.UnixMicro(), 10)
	}
	return strconv.FormatInt(currentTime.Unix(), 10) // The 10 as the second argument specifies base 10 for formatting the integer.
}
