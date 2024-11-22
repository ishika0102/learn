package logger

// import (
// 	"log"
// 	"os"
// )

// var Logger *log.Logger

// func InitLogger() {
// 	file, err := os.OpenFile("app.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
// 	if err != nil {
// 		log.Fatal("Failed to open log file: ", err)
// 	}

// 	Logger = log.New(file, "", log.Ldate|log.Ltime|log.Lshortfile)
// }

import (
	"context"

	"fmt"
	"log"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/natefinch/lumberjack"

	// "github.com/natefinch/lumberjack"
	"go.mongodb.org/mongo-driver/mongo"
)

// Logger instance
var Logger *log.Logger

// InitLogger initializes the logger with configurations
func InitLogger() {
	logFile := &lumberjack.Logger{
		Filename:   "app_new.log",
		MaxSize:    19, // megabytes
		MaxBackups: 20,
		Compress:   true,
	}
	Logger = log.New(logFile, "", log.Ldate|log.Ltime|log.Lshortfile)
	log.SetOutput(logFile)
}

// AddAuditLog adds an audit log entry to MongoDB
func AddAuditLog(user map[string]string, refId string, data map[string]interface{}, collection *mongo.Collection, eventType string, recordType string) {
	timestamp := time.Now().UTC()
	var auditLogInfo AuditLogInfoType

	if user != nil {
		switch eventType {
		case "CREATE":
			auditLogInfo = AuditLogInfoType{CreatedBy: user["username"], CreatedById: user["user_id"], CreatedDateTime: timestamp}
		case "UPDATE", "DELETE":
			auditLogInfo = AuditLogInfoType{ModifiedBy: user["username"], ModifiedById: user["user_id"], ModifiedDateTime: timestamp}
		}
	}

	auditLogData := BaseAuditLog{
		EventType:    eventType,
		RefId:        refId,
		Data:         data,
		RecordType:   recordType,
		AuditLogInfo: auditLogInfo,
	}

	_, err := collection.InsertOne(context.Background(), auditLogData)
	if err != nil {
		Logger.Printf("Error inserting audit log: %v", err)
	}
}

// DefineLogger logs messages with various levels
func DefineLogger(level int, user map[string]string, c *fiber.Ctx, loggName string, pid int, message string, body map[string]interface{}) {
	txt := ""

	if user != nil {
		txt += fmt.Sprintf("- USER: %s ", user["user_id"])
	}
	if c != nil {
		txt += fmt.Sprintf("- IP: %s - URL: %s %s ", c.IP(), c.Method(), c.OriginalURL())
	}
	if message != "" {
		txt += fmt.Sprintf("- MESSAGE: %s ", message)
	}
	if pid != 0 {
		txt += fmt.Sprintf("- PID: %d ", pid)
	}
	if loggName != "" {
		txt += fmt.Sprintf("- FILE: %s ", loggName)
	}
	if body != nil {
		txt += fmt.Sprintf("- BODY: %v ", body)
	}

	switch level {
	case 10:
		Logger.Println("DEBUG: " + txt)
	case 20:
		Logger.Println("INFO: " + txt)
	case 30:
		Logger.Println("WARNING: " + txt)
	case 40:
		Logger.Println("ERROR: " + txt)
	case 50:
		Logger.Println("CRITICAL: " + txt)
	default:
		Logger.Println("DEBUG: " + txt)
	}
}
