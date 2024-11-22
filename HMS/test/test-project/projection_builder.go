package main

import (
	"fmt"
	"reflect"

	"go.mongodb.org/mongo-driver/bson"
)

// Define a function to automatically build the update projection for a given struct.
func buildUpdateProjection(obj interface{}) bson.M {
	// Initialize an empty bson.D slice to hold the update projection.
	updateProjection := bson.M{}

	// Get the type of the object using reflection.
	objType := reflect.TypeOf(obj)

	// Iterate through the fields of the struct.
	for i := 0; i < objType.NumField(); i++ {
		field := objType.Field(i)

		// Get the value of the field using reflection.
		fieldValue := reflect.ValueOf(obj).FieldByName(field.Name)

		// Check if the field is valid and has a non-zero value.
		if fieldValue.IsValid() && !reflect.DeepEqual(fieldValue.Interface(), reflect.Zero(fieldValue.Type()).Interface()) {
			// If the field is an embedded struct, recursively build the update projection for its fields.
			if field.Type.Kind() == reflect.Struct && field.Anonymous {
				embeddedProjection := buildUpdateProjection(fieldValue.Interface())
				for k, v := range embeddedProjection {
					updateProjection[k] = v
				}
			} else {
				// Add the field to the update projection.
				updateProjection[field.Name] = fieldValue.Interface()
			}
		}
	}

	// Return the constructed update projection.
	return updateProjection
}

func main() {
	// Define a struct with some fields.
	type Test struct {
		Test1 string
		Test2 string
	}
	type User struct {
		Name    string
		Age     int
		Address string
		Test
	}

	// Create an instance of the struct.
	var user User
	user.Name = "John"
	user.Age = 30
	user.Address = "123 Main St"
	user.Test.Test1 = "test1"
	user.Test.Test2 = "test2"
	// Build the update projection.
	updateProjection := buildUpdateProjection(user)
	fmt.Println(updateProjection)

	// Use the updateProjection in your MongoDB update operation.
	// db.collection.updateOne(filter, update, options.Update().Set(updateProjection))

}

// // Usage example:
// daUser := models.Reseller{
// 	// Populate the fields of the Reseller struct.
// }

// // Automatically build the update projection for daUser.
// updateProjection := buildUpdateProjection(daUser)

// // Use the updateProjection in your MongoDB update operation.
