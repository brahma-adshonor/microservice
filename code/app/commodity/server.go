package main

import (
	"github.com/brahma-adshonor/micro_service/code/app/commodity/model"

	"fmt"
	"net/http"
)

func commodityHandler(w http.ResponseWriter, r *http.Request) {
	type m model.Model
}

func main() {
	http.HandleFunc("/commodity", commodityHandler)
	fmt.Println("staring discount service on port 7000")
	http.ListenAndServe(":7000", nil)
}
