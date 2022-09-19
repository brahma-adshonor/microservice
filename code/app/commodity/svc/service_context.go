package svc

import "gorm.io/gorm"

type ServiceContext struct {
	Db *gorm.DB
}

func NewServiceContext() *ServiceContext {
	return &ServiceContext{
		Db: NewDBService(),
	}
}
