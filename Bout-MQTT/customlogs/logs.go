package customlogs

import (
	"log"
	"os"
)

var (
	logFile       *os.File
	insertLogFile *os.File
	updateLogFile *os.File
)

// Initialize initializes logging by opening the log files and setting log outputs.
func Initialize(logFilePath1, logFilePath2 string) error {
	var err error
	insertLogFile, err = os.OpenFile(logFilePath1, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		return err
	}
	updateLogFile, err = os.OpenFile(logFilePath2, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		return err
	}
	return nil
}

// Close closes the log file.
func Close() {
	// if logFile != nil {
	// 	logFile.Close()
	// }
	if insertLogFile != nil {
		insertLogFile.Close()
	}
	if updateLogFile != nil {
		updateLogFile.Close()
	}
}

// InsertLog logs a message to the first log file.
func InsertLog(message string) {
	log.SetOutput(insertLogFile)
	log.Println(message)
}

// UpdateLog logs a message to the second log file.
func UpdateLog(message string) {
	log.SetOutput(updateLogFile)
	log.Println(message)
}
