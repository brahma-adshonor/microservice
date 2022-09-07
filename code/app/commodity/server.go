package main

import (
	"fmt"
	"net/http"
)

func commodityHandler(w http.ResponseWriter, r *http.Request) {

}

func main() {
	http.HandleFunc("/commodity", commodityHandler)
	fmt.Println("staring discount service on port 7000")
	http.ListenAndServe(":7000", nil)
}
