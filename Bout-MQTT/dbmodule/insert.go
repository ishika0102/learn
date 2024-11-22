package dbmodule

import (
	"bout-mqtt/customlogs"
	"context"
	"fmt"
	"log"
	"runtime"
	"strconv"
	"sync"
	"time"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
)

var (
	streamDocuments      = make([]interface{}, 0)
	streamDocumentsMutex = &sync.Mutex{}
	streamDataChannel    = make(chan struct{})
)

// BulkInsert represents a MongoDB bulk insert operation.
type BulkInsert struct {
	collection *mongo.Collection
	documents  chan []interface{}
}

// FUCNC TO CRATE COLLECTION WHEN NEW GRIUP ID WITH INDEX FOR DEVICE ID
// NewBulkInsert initializes a new BulkInsert instance.
func NewBulkInsert(client *mongo.Client, dbName, collectionName string) (*BulkInsert, error) {
	collection := client.Database(dbName).Collection(collectionName)
	return &BulkInsert{
		collection: collection,
		documents:  make(chan []interface{}),
	}, nil
}

// Execute executes the bulk insert operation with documents received from the channel.
func (bi *BulkInsert) Execute(ctx context.Context, documents []interface{}) error {
	if len(documents) == 0 {
		return nil // No documents to insert
	}

	_, err := bi.collection.InsertMany(ctx, documents)
	if err != nil {
		return err
	}
	return nil
}

// Cancel closes the documents channel.
func (bi *BulkInsert) Cancel() {
	close(bi.documents)
}

// StartInserting starts inserting documents into MongoDB collection
// every specified duration.
func StartInserting(client *mongo.Client, ctx context.Context, dbName, collectionName string, wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Println("------------------------INSIDE START-INSERTING-----------------------------")
	// Create a new BulkInsert instance
	bulkInsert, err := NewBulkInsert(client, dbName, collectionName)
	if err != nil {
		log.Fatal(err)
	}
	defer bulkInsert.Cancel()

	// Start a goroutine to collect and insert documents periodically
	ticker := time.NewTicker(5 * time.Second) // Adjust interval as needed
	defer ticker.Stop()
	// Start a goroutine to collect and insert documents periodically

	for {
		select {
		case <-ctx.Done():
			fmt.Println("exiting ")
			return
		case <-streamDataChannel:
			streamDocumentsMutex.Lock()
			fmt.Println("stream doc in start inserting")
			fmt.Println(len(streamDocuments))
			if len(streamDocuments) > 0 {
				startTime := time.Now()
				if err := bulkInsert.Execute(ctx, streamDocuments); err != nil {
					log.Printf("Error inserting documents: %v\n", err)
				} else {
					customlogs.InsertLog("Inserted documents " + strconv.FormatInt(int64(len(streamDocuments)), 10) + " number of go routines " + strconv.FormatInt(int64(runtime.NumGoroutine()), 10) + " groupid " + collectionName)
				}
				endtime := time.Since(startTime).String()
				customlogs.InsertLog("Time taken to insert docs:" + endtime + "\n")

				streamDocuments = nil
			}
			streamDocumentsMutex.Unlock()
		}
	}

	//// Wait until the context is done
	//<-ctx.Done()
	//
	//// Signal to stop inserting
	//close(stopInserting)
}

func AddData(data bson.D) {
	streamDocumentsMutex.Lock()
	streamDocuments = append(streamDocuments, data)
	streamDataChannel <- struct{}{} // To send a value to streamDataChannel
	// fmt.Println(streamDocuments)
	fmt.Println("msg added to the streamdocument in the add data")
	streamDocumentsMutex.Unlock()

}
