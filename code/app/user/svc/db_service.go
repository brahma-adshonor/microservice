package svc

import (
	"fmt"

	"github.com/brahma-adshonor/microservice/code/app/user/config"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func NewDBService() *gorm.DB {

	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		config.MysqlConfig.User, config.MysqlConfig.Password, config.MysqlConfig.Host, config.MysqlConfig.Port, config.MysqlConfig.Name)

	db, err := gorm.Open(mysql.New(mysql.Config{
		DSN:                       dsn,   // data source name
		DefaultStringSize:         256,   // default size for string fields
		DisableDatetimePrecision:  true,  // disable datetime precision, which not supported before MySQL 5.6
		DontSupportRenameIndex:    true,  // drop & create when rename index, rename index not supported before MySQL 5.7, MariaDB
		DontSupportRenameColumn:   true,  // `change` when rename column, rename column not supported before MySQL 8, MariaDB
		SkipInitializeWithVersion: false, // auto configure based on currently MySQL version
	}), &gorm.Config{})

	if err != nil {
		panic("db init failed")
	}

	return db
}
