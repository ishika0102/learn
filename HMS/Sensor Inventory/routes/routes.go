package routes

import (
	"SensorInventory/controllers"

	"github.com/gofiber/fiber/v2"
)

func SensorInventory(app *fiber.App) {
	app.Post("/sensor-inventory", controllers.AddSensorInventory)
	app.Get("/sensor-inventory/all", controllers.ViewAllSensorInventory)
	app.Get("/sensor-inventory/:id", controllers.ViewOneSensorInventory)
	app.Put("/sensor-inventory/:id/:status", controllers.UpdateOneSensorInventoryStatus)
	app.Put("/sensor-inventory", controllers.UpdateOneSensorInventory)
}
