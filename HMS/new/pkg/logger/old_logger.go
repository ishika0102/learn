package logger

// import (
// 	"log"

// 	"gopkg.in/natefinch/lumberjack.v2"
// )

// var Logger *log.Logger

// func InitLogger() {
// 	logger := &lumberjack.Logger{
// 		Filename:   "app.log",
// 		MaxSize:    20, // megabytes
// 		MaxBackups: 20,
// 		MaxAge:     3650, // days
// 		Compress:   true, // compress log files
// 	}

// 	Logger = log.New(logger, "", log.Ldate|log.Ltime|log.Lshortfile)
// }
