package test

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"net/http"

	"github.com/bxcodec/faker/v3"
)

func CreateInventoryDefault() (string, error) {
	pharmacyData := map[string]interface{}{"Name": faker.Username(), "Quantity": 10000}
	jsonData, _ := json.Marshal(pharmacyData)

	//Creating One Inventory
	createURL := baseURL + "/inventory"
	resp, err := http.Post(createURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	if resp.StatusCode == 201 {
		//Extracting Response Data
		body, _ := ioutil.ReadAll(resp.Body)
		var respdata map[string]interface{}
		err = json.Unmarshal(body, &respdata)
		if err != nil {
			return "", err
		}
		// Extract the specific field value
		idValue, _ := respdata["data"].(map[string]interface{})["Id"].(string)
		return idValue, nil
	}

	return "", err

}
