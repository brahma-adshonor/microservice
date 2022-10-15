package config

import "time"

var (
	AppID       = "wx3f4f5f6f7f8f9f0f"
	AppSecret   = "e10adc3949ba59abbe56e057f20f883e"
	MysqlConfig = DbConfig{
		Host:     "127.0.0.1",
		Port:     3306,
		Name:     "db_auth",
		User:     "root",
		Password: "12345678",
	}

	TokenExpire = time.Hour * 24 * 7
)

type DbConfig struct {
	Host     string `mapstructure:"host" json:"host"`
	Port     int    `mapstructure:"port" json:"port"`
	Name     string `mapstructure:"db" json:"db"`
	User     string `mapstructure:"user" json:"user"`
	Password string `mapstructure:"password" json:"password"`
}
