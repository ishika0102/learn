package routes

import (
	controller "UserManagement-Core/controllers"
	"UserManagement-Core/middleware"
	"fmt"

	"github.com/gofiber/fiber/v2"
)

func LoginRoute(app fiber.Router) {
	app.Post("/login", middleware.CheckLogin)
	app.Post("/register", middleware.RegisterUser)
}

func ResellerRoute(app fiber.Router) {
	fmt.Println("inside reseller routes")
	app.Post("/reseller", controller.CreateReseller)
	app.Put("/reseller", controller.UpdateReseller)
	app.Get("/reseller/:user_id", controller.ViewResellerAdmin)

}

func OrganizationRoute(app fiber.Router) {
	app.Post("/organization", middleware.NewJwtMiddleware, controller.CreateOrganization)
	app.Put("/organization", middleware.NewJwtMiddleware, controller.UpdateOrganization)
	app.Get("/organization/:org_id", middleware.NewJwtMiddleware, controller.ViewOrganization)
}
func OrgAdminRoute(app fiber.Router) {
	app.Post("/orgadmin", middleware.NewJwtMiddleware, controller.CreateOrgAdmin)
	app.Put("/orgadmin", middleware.NewJwtMiddleware, controller.UpdateOrgAdmin)
	app.Get("/orgadmin/:user_id", middleware.NewJwtMiddleware, controller.ViewOrgAdmin)
}
