package svc

import (
	"log"

	"github.com/brahma-adshonor/microservice/code/app/user/token"

	"github.com/brahma-adshonor/microservice/code/app/user/model"

	"go.uber.org/zap"
)

type ServiceContext struct {
	User           *model.User
	Logger         *zap.Logger
	TokenGenerator *token.JWTTokenGen
}

func NewServiceContext() *ServiceContext {

	logger, err := zap.NewProduction()
	if err != nil {
		log.Fatalf("can't initialize zap logger: %v", err)
	}
	defer logger.Sync()

	return &ServiceContext{
		User:           model.NewUserModel(NewDBService()),
		Logger:         logger,
		TokenGenerator: token.NewJWTTokenGen("auth server", "123456"),
	}
}
