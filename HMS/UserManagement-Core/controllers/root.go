package controller

import (
	"UserManagement-Core/models"

	"github.com/gofiber/fiber/v2"
)

func CreateRoot(ctx *fiber.Ctx) error {
	var root models.Root

	if err := ctx.BodyParser(&root); err != nil {
		return err
	}

	return ctx.JSON(root)

}
