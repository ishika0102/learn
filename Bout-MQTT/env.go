package main

import (
	"fmt"
	"log"
	"os"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/joho/godotenv"
)

// Env represents environment variables
type Env struct {
	MQTTBroker string
	MQTTPort   string
	ClientID   string
}

// Initialize environment variables from .env file
func (e *Env) init() {
	if err := godotenv.Load(); err != nil {
		log.Fatal("Error loading .env file")
	}
	e.MQTTBroker = os.Getenv("MQTT_BROKER")
	e.MQTTPort = os.Getenv("MQTT_PORT")
	e.ClientID = os.Getenv("CLIENT_ID")
}

// Define MQTT client options
func (e *Env) mqttClientOptions() *mqtt.ClientOptions {
	opts := mqtt.NewClientOptions()
	opts.AddBroker(fmt.Sprintf("tcp://%s:%s", e.MQTTBroker, e.MQTTPort))
	opts.SetClientID(e.ClientID)
	opts.SetDefaultPublishHandler(messagePubHandler)
	opts.OnConnect = connectHandler
	opts.OnConnectionLost = connectLostHandler
	return opts
}
