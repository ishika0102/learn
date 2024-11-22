package injection

import (
	"log"

	userservice "HMS/internal/user/service"
	"HMS/pkg/database"

	"go.uber.org/dig"
)

var container *dig.Container

var UserServiceProvider *userservice.UserServiceInjection

func ProvideComponents() {
	container = dig.New()

	// Provide MongoDB configuration and connection
	err := container.Provide(func() *database.MongoDB {
		mongoDB, err := database.NewMongoDB()
		if err != nil {
			log.Fatalf("Failed to initialize MongoDB: %v", err)
		}
		return mongoDB
	})
	if err != nil {
		panic(err)
	}

	// User service provider injection
	userservice.ProvideUserComponents(container)

}

func InitComponents() error {
	UserServiceProvider = userservice.NewUserServiceInjection()
	err := UserServiceProvider.InitUserComponents(container)
	if err != nil {
		panic(err)
	}
	return err
}
