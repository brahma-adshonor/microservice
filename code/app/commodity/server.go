package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/brahma-adshonor/microservice/code/app/commodity/model"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var (
	db  *gorm.DB
	err error
)

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello\n")
}
func getProduct(w http.ResponseWriter, r *http.Request) {
	var request ProductRequst
	var response ProductResponse

	fmt.Printf("http body is : %v\n", r.Body)
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	fmt.Printf("ProductRequest is : %v\n", request)

	var result *gorm.DB
	if request.All {
		result = db.Find(&response.Products)
	} else {
		result = db.Where(request.Ids).Find(&response.Products)
	}

	if result.Error != nil {
		response.Err = result.Error
	}
	if result.RowsAffected == 0 {
		response.Msg = "empty table"
	}

	fmt.Printf("Product Response is %v\n", response)
	json.NewEncoder(w).Encode(&response)
}

func init() {
	db, err = gorm.Open(mysql.New(mysql.Config{
		DSN:                       "gorm:password@tcp(127.0.0.1:3306)/mall?charset=utf8&parseTime=True&loc=Local", // data source name
		DefaultStringSize:         256,                                                                            // default size for string fields
		DisableDatetimePrecision:  true,                                                                           // disable datetime precision, which not supported before MySQL 5.6
		DontSupportRenameIndex:    true,                                                                           // drop & create when rename index, rename index not supported before MySQL 5.7, MariaDB
		DontSupportRenameColumn:   true,                                                                           // `change` when rename column, rename column not supported before MySQL 8, MariaDB
		SkipInitializeWithVersion: false,                                                                          // auto configure based on currently MySQL version
	}), &gorm.Config{})
}

type ProductRequst struct {
	Ids []int32 `json:"ids,omitempty"`
	All bool    `json:"all,omitempty"`
}

type ProductResponse struct {
	Ret      int
	Msg      string
	Err      error
	Products []model.Product
}

func main() {
	http.HandleFunc("/getProduct", getProduct)
	http.HandleFunc("/hello", hello)
	fmt.Println("staring discount service on port 7000")
	http.ListenAndServe(":8090", nil)
}
