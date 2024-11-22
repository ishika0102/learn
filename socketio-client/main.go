package main

import (
	"fmt"
	"log"
	"net/http"

	socketio "github.com/googollee/go-socket.io"
)

func main() {
	server := socketio.NewServer(nil)

	server.OnConnect("/", func(s socketio.Conn) error {
		// s.SetContext("")
		fmt.Println("Client connected:", s.ID())
		s.Send("message", "hello, client you have successfully connected to server at 8080")
		return nil
	})

	// server.OnEvent("/", "myEvent", func(s socketio.Conn, msg string) {
	// 	fmt.Printf("Received message from client: %s\n", msg)
	// 	s.Emit("message", "Hello, client!")
	// })
	// server.OnEvent("/", "myEvent", func(s socketio.Conn, msg map[string]interface{}) {
	// 	fmt.Printf("Received message from client: %s\n", msg["data"])
	// 	s.Emit("message", map[string]interface{}{"message": "Hello, client!"})
	// })
	server.OnEvent("/", "myEvent", func(s socketio.Conn, msg map[string]interface{}) {
		fmt.Printf("Received message from client: %s\n", msg["data"])
		s.Emit("message", map[string]interface{}{"message": "Hello, client!"})
		fmt.Println("Message sent to client")
	})

	server.OnDisconnect("/", func(s socketio.Conn, reason string) {
		fmt.Println("Client disconnected:", s.ID(), "Reason:", reason)
	})

	server.OnError("/", func(s socketio.Conn, e error) {
		fmt.Println("Socket error:", e)
	})

	go func() {
		if err := server.Serve(); err != nil {
			log.Fatalf("SocketIO server error: %v\n", err)
		}
	}()
	defer server.Close()

	http.Handle("/socket.io/", server)
	// http.Handle("/", http.FileServer(http.Dir("./public")))

	log.Println("Serving at http://192.168.1.82:8080...")
	if err := http.ListenAndServe("192.168.1.82:8080", nil); err != nil {
		log.Fatalf("HTTP server error: %v\n", err)
	}
}
