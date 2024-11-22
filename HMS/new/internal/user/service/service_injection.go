package service

import (
	"HMS/internal/user/infrastructure"
	"HMS/pkg/database"

	"go.uber.org/dig"
)

type UserServiceInjection struct {
	db                  *database.MongoDB
	UserServiceProvider *UserService
}

func NewUserServiceInjection() *UserServiceInjection {
	return &UserServiceInjection{}
}
func ProvideUserComponents(c *dig.Container) {
	// repositorory provider injection
	err := c.Provide(infrastructure.NewUserRepository)
	if err != nil {
		panic(err)
	}

	// service provider injection
	err = c.Provide(NewUserService)
	if err != nil {
		panic(err)
	}
}

func (s *UserServiceInjection) InitUserComponents(container *dig.Container) error {
	return container.Invoke(func(db *database.MongoDB, us *UserService) {
		s.db = db
		s.UserServiceProvider = us
	})
}

// Define your service methods here
