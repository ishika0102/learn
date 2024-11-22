// package main

// import (
// 	"bout-mqtt/customlogs"
// 	"bout-mqtt/dbmodule"
// 	"context"
// 	"fmt"
// 	"log"
// 	"os"
// 	"os/signal"
// 	"reflect"
// 	"sync"
// 	"syscall"

// 	"go.mongodb.org/mongo-driver/bson"
// 	"go.mongodb.org/mongo-driver/mongo"
// 	"go.mongodb.org/mongo-driver/mongo/options"

// 	mqtt "github.com/eclipse/paho.mqtt.golang"
// )

// type Message struct {
// 	client  mqtt.Client
// 	message mqtt.Message
// }

// var (
// 	wg               sync.WaitGroup
// 	clientOptions    = options.Client().ApplyURI("mongodb://localhost:27017")
// 	mongoClient, err = mongo.Connect(context.Background(), clientOptions)
// 	insertOnce       sync.Once
// 	updateOnce       sync.Once
// 	messageChannel   = make(chan Message, 100) // Increased channel capacity
// 	workerPoolSize   = 100                     // Number of workers in the pool
// )

// func handleMessage(message Message) {
// 	var doc bson.D
// 	fmt.Println("inside handlemessage")
// 	if err := bson.UnmarshalExtJSON(message.message.Payload(), true, &doc); err != nil {
// 		log.Println("Error unmarshalling message payload:", err)
// 		return
// 	}

// 	// Add data for update and insertion
// 	dbmodule.AddData(doc)
// 	dbmodule.AddDataForUpdate(doc)
// 	wg.Done()
// }

// func workerPool() {
// 	for msg := range messageChannel {
// 		handleMessage(msg)

// 	}
// }

// var onMessageReceived mqtt.MessageHandler = func(client mqtt.Client, message mqtt.Message) {
// 	messageChannel <- Message{client: client, message: message} // Send message to channel
// 	fmt.Println("Msg recieved and send to channel")
// 	fmt.Println(string(message.Payload()))
// 	fmt.Println(len(messageChannel))
// 	wg.Add(1) // Add to waitgroup for each message received
// }

// func main() {
// 	var env Env
// 	env.init()
// 	// Initialize MongoDB client
// 	if err != nil {
// 		log.Fatal("Error connecting to MongoDB:", err)
// 	}
// 	defer mongoClient.Disconnect(context.Background())

// 	// Initialize logging
// 	err := customlogs.Initialize("insert_log.txt", "update_log.txt")
// 	if err != nil {
// 		log.Fatal("Error initializing logs:", err)
// 	}
// 	defer customlogs.Close()

// 	// Start worker pool
// 	for i := 0; i < workerPoolSize; i++ {
// 		go workerPool()
// 	}

// 	// Start inserting and updating workers
// 	ctx, cancel := context.WithCancel(context.Background())
// 	defer cancel()

// 	dbName := "bout-go-test"
// 	insertCollectionName := "backup_device_data_test"
// 	updateCollectionName := "live_device_data_test"

// 	wg.Add(1)
// 	go dbmodule.StartInserting(mongoClient, ctx, dbName, insertCollectionName, &wg)

// 	wg.Add(1)
// 	go dbmodule.StartUpdating(mongoClient, ctx, dbName, updateCollectionName, &wg)

// 	// Initialize MQTT client
// 	client := mqtt.NewClient(env.mqttClientOptions())
// 	if token := client.Connect(); token.Wait() && token.Error() != nil {
// 		log.Fatal("Error connecting to MQTT broker:", token.Error())
// 	}
// 	defer client.Disconnect(250)

// 	// Subscribe to MQTT topic
// 	topic := "/bout/#"
// 	if token := client.Subscribe(topic, 2, onMessageReceived); token.Wait() && token.Error() != nil {
// 		log.Fatal("Error subscribing to topic:", token.Error())
// 	}

// 	// Handle OS signals
// 	sigChan := make(chan os.Signal, 1)
// 	signal.Notify(sigChan, syscall.SIGINT, syscall.SIGTERM)
// 	<-sigChan

// 	// Cancel context to stop workers
// 	cancel()

// 	// Wait for all workers to finish processing
// 	// wg.Wait()
// }

package main

import (
	"bout-mqtt/customlogs"
	"bout-mqtt/dbmodule"
	"reflect"

	"context"
	"fmt"
	"log"
	"os"
	"os/signal"
	"sync"
	"syscall"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	mqtt "github.com/eclipse/paho.mqtt.golang"
)

var (
	wg               sync.WaitGroup
	clientOptions    = options.Client().ApplyURI("mongodb://localhost:27017")
	mongoClient, err = mongo.Connect(context.Background(), clientOptions)
	insertOnce       sync.Once
	updateOnce       sync.Once
)
var onMessageReceived mqtt.MessageHandler = func(client mqtt.Client, message mqtt.Message) {
	var doc bson.D
	if err := bson.UnmarshalExtJSON(message.Payload(), true, &doc); err != nil {
		log.Fatal(err)
	}
	dbName := "bout-go-test"
	updateCollectionName := "live_device_data_test"
	insertCollectionName := "backup_device_data_test"

	// Start insert and update goroutines only once

	wg.Add(1)
	go dbmodule.StartInserting(mongoClient, context.Background(), dbName, insertCollectionName, &wg)

	updateOnce.Do(func() {
		wg.Add(1)
		go dbmodule.StartUpdating(mongoClient, context.Background(), dbName, updateCollectionName, &wg)
	})
	// Add data for update and insertion
	dbmodule.AddDataForUpdate(doc)
	dbmodule.AddData(doc)

}
var messagePubHandler mqtt.MessageHandler = func(client mqtt.Client, msg mqtt.Message) {
	var x = msg.Payload()
	fmt.Printf("Received message: %T from topic: %s,\n", x, msg.Topic())
	fmt.Println(reflect.TypeOf(x))

}
var connectHandler mqtt.OnConnectHandler = func(client mqtt.Client) {
	fmt.Println("Connected")
}

var connectLostHandler mqtt.ConnectionLostHandler = func(client mqtt.Client, err error) {
	fmt.Printf("Connect lost: %v", err)
}

func main() {

	var env Env
	env.init()
	// Initialize logging
	err := customlogs.Initialize("insert_log.txt", "update_log.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer customlogs.Close()

	client := mqtt.NewClient(env.mqttClientOptions())
	if token := client.Connect(); token.Wait() && token.Error() != nil {
		// fmt.Println(token.Error())
		// panic(token.Error())
		log.Fatal("Error connecting to MQTT broker:", token.Error())
	}
	// Subscribe to MQTT topic
	topic := "/bout/#"
	if token := client.Subscribe(topic, 2, onMessageReceived); token.Wait() && token.Error() != nil {
		panic(fmt.Sprintf("Error subscribing to topic: %s", token.Error()))
	}
	sigChan := make(chan os.Signal, 1)
	signal.Notify(sigChan, syscall.SIGINT, syscall.SIGTERM)
	<-sigChan

}
