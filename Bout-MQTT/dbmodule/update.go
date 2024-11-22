package dbmodule

import (
	"context"
	"fmt"
	"log"
	"sync"
	"time"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"bout-mqtt/customlogs"
)

var (
	updatestreamDocuments      = make([]interface{}, 0)
	updatestreamDocumentsMutex = &sync.Mutex{}
	updatestreamDataChannel    = make(chan struct{})
)

// BulkUpdateByDeviceID represents a MongoDB bulk update operation based on device ID.
type BulkUpdateByDeviceID struct {
	collection *mongo.Collection
	documents  chan []interface{}
}

// NewBulkUpdateByDeviceID initializes a new BulkUpdateByDeviceID instance.
func NewBulkUpdateByDeviceID(client *mongo.Client, dbName, collectionName string) (*BulkUpdateByDeviceID, error) {
	collection := client.Database(dbName).Collection(collectionName)
	// fmt.Println("inside newbulkupdatebydeviceid")
	return &BulkUpdateByDeviceID{
		collection: collection,
		documents:  make(chan []interface{}),
	}, nil
}

// BulkUpdateByDeviceID updates multiple documents based on device ID and updates the rest of the fields.
func (bu *BulkUpdateByDeviceID) BulkUpdateByDeviceID(ctx context.Context, deviceID string, update bson.M) error {
	filter := bson.M{"DeviceId": deviceID}
	opts := options.Update().SetUpsert(true) // Upsert if document doesn't exist
	_, err := bu.collection.UpdateMany(ctx, filter, update, opts)
	if err != nil {
		return err
	}
	// fmt.Println("inside bulkupdatebydeviceid", updated)
	return nil
}

// AddData adds data to the updatestreamDocuments map.
func AddDataForUpdate(data bson.D) {
	// fmt.Println("inside adddataforupdate")
	updatestreamDocumentsMutex.Lock()
	updatestreamDocuments = append(updatestreamDocuments, data)
	updatestreamDataChannel <- struct{}{}
	fmt.Println("Appended in updatestreamDocuments : function AddDataForUpdate") // To send a value to streamDataChannel
	// fmt.Println(updatestreamDocuments)
	updatestreamDocumentsMutex.Unlock()
}
func (bu *BulkUpdateByDeviceID) Cancel() {
	close(bu.documents)
}

// StartUpdating starts the bulk update process for documents in MongoDB collection.
func StartUpdating(client *mongo.Client, ctx context.Context, dbName, collectionName string, wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Println("------------------------INSIDE START-UPDATING-----------------------------")
	fmt.Println(collectionName)

	updateHandler, err := NewBulkUpdateByDeviceID(client, dbName, collectionName)
	if err != nil {
		log.Fatal(err)
	}
	defer updateHandler.Cancel()
	// Start a goroutine to collect and insert documents periodically
	ticker := time.NewTicker(5 * time.Second) // Adjust interval as needed
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			fmt.Println("exiting")
			return
		case <-updatestreamDataChannel:
			updatestreamDocumentsMutex.Lock()
			fmt.Println("inside startupdating updatestreamdoc")
			fmt.Println(len(updatestreamDocuments))
			if len(updatestreamDocuments) > 0 {
				fmt.Println(len(updatestreamDocuments))
				// fmt.Println(collectionName)
				for _, doc := range updatestreamDocuments {
					// fmt.Println("inside startupdating - for")
					marshalDoc, err := bson.Marshal(doc.(bson.D))
					if err != nil {
						log.Printf("Error marshalling document: %v\n", err)
						continue
					}

					var docMap bson.M
					err = bson.Unmarshal(marshalDoc, &docMap)
					if err != nil {
						log.Printf("Error unmarshalling document: %v\n", err)
						continue
					}

					deviceID, ok := docMap["DeviceId"].(string)
					if !ok {
						log.Printf("Device ID not found in document: %v\n", docMap)
						continue
					}
					// fmt.Printf("Device ID: %s\n", deviceID)
					if !ok {
						log.Println("Invalid document format, missing DeviceId")
						continue
					}

					update := bson.M{"$set": docMap} // Update all fields
					startTime := time.Now()
					if err := updateHandler.BulkUpdateByDeviceID(ctx, deviceID, update); err != nil {
						log.Printf("Error updating documents for DeviceID %s: %v\n", deviceID, err)
					} else {
						customlogs.UpdateLog("Updated documents for DeviceID " + deviceID)
					}
					endtime := time.Since(startTime).String()
					customlogs.UpdateLog("Time taken to update docs in live_data collection :" + endtime + "\n")
				}
				updatestreamDocuments = nil // Clear processed documents
			}
			updatestreamDocumentsMutex.Unlock()
		}
	}
}
