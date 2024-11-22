package helpers

import (
	"hms-users/models"
)

func Response(status int, message string, data interface{}) (response models.Response) {
	resultresponse := models.Response{Status: status, Message: message, Data: data}
	return resultresponse
}

func ErrorResponse(status int, message string) (response models.ErrorResponse) {
	result := models.ErrorResponse{Status: status, Message: message}
	return result
}
