package main

import (
	"net/http"

	"go.uber.org/zap"

	"github.com/brahma-adshonor/microservice/code/app/user/handler"
	"github.com/brahma-adshonor/microservice/code/app/user/svc"
)

func main() {
	s := svc.NewServiceContext()
	http.HandleFunc("/login", handler.Login(s))
	http.HandleFunc("/checkToken", handler.CheckToken(s))
	http.HandleFunc("/getUser", handler.GetUser(s))

	if err := http.ListenAndServe(":8091", nil); err != nil {
		s.Logger.Fatal("failed to serve: %v", zap.Error(err))
	}
}
