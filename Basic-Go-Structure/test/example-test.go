package test

import (
	"bytes"
	"encoding/json"
	"net/http"
	"testing"

	"github.com/bxcodec/faker/v3"
	"github.com/stretchr/testify/assert"
)

var testCount int
var baseURL = "http://localhost:6000"

type TestCase struct {
	Details        map[string]interface{}
	ExpectedStatus int
}

func TestCreateInventoryCases(t *testing.T) {
	name := faker.Username()
	testCases := []TestCase{
		{Details: map[string]interface{}{"Name": name, "Quantity": 10000, "CP": 10}, ExpectedStatus: 201},                            //Valid Data
		{Details: map[string]interface{}{"Name": name, "Quantity": 1000}, ExpectedStatus: 400},                                       //Already Existing Medicine Name
		{Details: map[string]interface{}{"Name": "Dolo"}, ExpectedStatus: 422},                                                       //Missing the Quantity field
		{Details: map[string]interface{}{"Quantity": 10}, ExpectedStatus: 422},                                                       //Missing the Name field
		{Details: map[string]interface{}{"Name": faker.Username(), "Quantity": 100, "Location": "INVALID_LOC"}, ExpectedStatus: 404}, //Invalid Locations
	}
	for _, testcase := range testCases {
		t.Run("Create Inventory", func(t *testing.T) {
			jsonData, err := json.Marshal(testcase.Details)
			assert.Nil(t, err, "Error while marshalling the data")

			createURL := baseURL + "/inventory"
			resp, err := http.Post(createURL, "application/json", bytes.NewBuffer(jsonData))
			assert.Nil(t, err, "Error creating HTTP request")
			defer resp.Body.Close()

			assert.Equal(t, testcase.ExpectedStatus, resp.StatusCode)
			testCount++
		})
	}
}

func TestViewOneInventory(t *testing.T) {
	//Creating One Inventory
	id, err := CreateInventoryDefault()
	assert.Nil(t, err, "Error while creating inventory")

	//Getting One Inventory Data
	viewoneURL := baseURL + "/inventory/" + id
	resp, err := http.Get(viewoneURL)
	assert.Nil(t, err, "Error creating HTTP request")
	defer resp.Body.Close()

	assert.Equal(t, 200, resp.StatusCode)

	testCount++

}

func TestViewOneInvalidID(t *testing.T) {
	//Getting One Inventory Data with Invalid ID
	viewoneURL := baseURL + "/inventory/INVALID_ID"
	resp, err := http.Get(viewoneURL)
	assert.Nil(t, err, "Error creating HTTP request")
	defer resp.Body.Close()
	assert.Equal(t, 404, resp.StatusCode)
}

func TestViewAllInventory(t *testing.T) {
	//To view all Inventory Data
	viewAllURL := baseURL + "/inventory"
	resp, err := http.Get(viewAllURL)
	assert.Nil(t, err, "Error creating HTTP request")
	defer resp.Body.Close()
	assert.Equal(t, 200, resp.StatusCode)

	testCount++

}

func TestUpdateOneInventory(t *testing.T) {
	name := faker.Username()
	testCases := []TestCase{
		{Details: map[string]interface{}{"Name": name, "Quantity": 10000}, ExpectedStatus: 200},                                        //Valid Data
		{Details: map[string]interface{}{"Quantity": 1000}, ExpectedStatus: 422},                                                       //Missing the Name field
		{Details: map[string]interface{}{"Name": faker.Username()}, ExpectedStatus: 422},                                               //Missing the Quantity field
		{Details: map[string]interface{}{"Name": name, "Quantity": 100}, ExpectedStatus: 400},                                          //giving Already exising Medicine Name
		{Details: map[string]interface{}{"Name": faker.Username(), "Quantity": 10000, "Location": "INVALID_LOC"}, ExpectedStatus: 404}, //Invalid Location
	}
	for _, testcase := range testCases {
		t.Run("Update Inventory", func(t *testing.T) {
			// Creating One Inventory
			id, err := CreateInventoryDefault()
			assert.Nil(t, err, "Error while creating inventory")

			updateURL := baseURL + "/inventory/" + id
			jsonData, _ := json.Marshal(testcase.Details)

			req, err := http.NewRequest("PUT", updateURL, bytes.NewBuffer(jsonData))
			assert.Nil(t, err, "Error creating HTTP request")
			req.Header.Set("Content-Type", "application/json")

			client := &http.Client{}
			resp, err := client.Do(req)
			assert.Nil(t, err, "Error making PUT request")
			defer resp.Body.Close()

			assert.Equal(t, testcase.ExpectedStatus, resp.StatusCode)

			testCount++
		})
	}
}

func TestUpdateInvInvalidId(t *testing.T) {
	//Updating Inventory with Invalid Id
	updateURL := baseURL + "/inventory/INVALID_ID"
	pharmacyData := map[string]interface{}{"Name": faker.Username(), "Quantity": 10000}
	jsonData, _ := json.Marshal(pharmacyData)

	req, err := http.NewRequest("PUT", updateURL, bytes.NewBuffer(jsonData))
	assert.Nil(t, err, "Error creating HTTP request")
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)
	assert.Nil(t, err, "Error making PUT request")
	defer resp.Body.Close()

	assert.Equal(t, 404, resp.StatusCode)

	testCount++
}

func TestUpdateInventoryStatusInvalidId(t *testing.T) {
	//Updating Inventory Status with Invalid Id
	updateURL := baseURL + "/inventory/INVALID_ID/1"

	req, err := http.NewRequest("PUT", updateURL, nil)
	assert.Nil(t, err, "Error creating HTTP request")

	client := &http.Client{}
	resp, err := client.Do(req)
	assert.Nil(t, err, "Error making PUT request")
	defer resp.Body.Close()

	assert.Equal(t, 404, resp.StatusCode)

	testCount++
}

func TestUpdateInventoryInvalidStatus(t *testing.T) {
	//Updating Inventory with Invalid Status
	id, err := CreateInventoryDefault()
	assert.Nil(t, err, "Error while creating inventory")

	updateURL := baseURL + "/inventory/update-status/" + id + "/INVALID_STATUS"
	req, err := http.NewRequest("PUT", updateURL, nil)
	assert.Nil(t, err, "Error creating HTTP request")

	client := &http.Client{}
	resp, err := client.Do(req)
	assert.Nil(t, err, "Error making PUT request")
	defer resp.Body.Close()

	assert.Equal(t, 400, resp.StatusCode)

	testCount++
}

func TestUpdateInventoryStatusValid(t *testing.T) {

	id, err := CreateInventoryDefault()
	assert.Nil(t, err, "Error while creating inventory")

	updateURL := baseURL + "/inventory/update-status/" + id + "/1"
	req, err := http.NewRequest("PUT", updateURL, nil)
	assert.Nil(t, err, "Error creating HTTP request")

	client := &http.Client{}
	resp, err := client.Do(req)
	assert.Nil(t, err, "Error making PUT request")
	defer resp.Body.Close()

	assert.Equal(t, 200, resp.StatusCode)

	testCount++
}
