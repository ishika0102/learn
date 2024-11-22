package service

import (
	"HMS/internal/user"
	"HMS/internal/user/infrastructure"
	"context"
	"log"

	"HMS/pkg/apperror"

	"go.mongodb.org/mongo-driver/mongo"
)

type UserService struct {
	userRepository *infrastructure.UserRepository
}

func NewUserService(repository *infrastructure.UserRepository) *UserService {
	// return the pointer to user service
	return &UserService{
		userRepository: repository,
	}
}

func (us *UserService) CreateUser(u *user.User) (*mongo.InsertOneResult, error) {
	// create the new user and return the id
	id, err := us.userRepository.InsertIntoDB(context.Background(), u)
	if err != nil {
		// database error
		log.Println(err)
		err := apperror.InternalServerError()
		return nil, err
	}

	// user created successfuly
	return id, nil
}
