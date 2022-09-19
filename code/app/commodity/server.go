package main

import (
	"fmt"
	"github.com/brahma-adshonor/microservice/code/app/commodity/svc"
	"net/http"

	"github.com/brahma-adshonor/microservice/code/app/commodity/handler"
)

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello\n")
}

func main() {
	context := svc.NewServiceContext()

	http.HandleFunc("/getProduct", handler.GetProduct(context))

	// following is test function, hold here
	http.HandleFunc("/hello", hello)
	fmt.Println("staring discount service on port 8090")
	http.ListenAndServe(":8090", nil)
}
