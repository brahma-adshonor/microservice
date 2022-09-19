package handler

import (
	"encoding/json"
	"fmt"
	"github.com/brahma-adshonor/microservice/code/app/commodity/svc"
	"net/http"

	"github.com/brahma-adshonor/microservice/code/app/commodity/model"
	"gorm.io/gorm"
)

type ProductRequst struct {
	Ids []int32 `json:"ids,omitempty"`
	All bool    `json:"all,omitempty"`
}

type ProductResponse struct {
	Ret      int
	Msg      string
	Err      error
	Products []model.TProduct
}

var (
	ctx *svc.ServiceContext
)

func GetProduct(context *svc.ServiceContext) func(w http.ResponseWriter, r *http.Request) {
	ctx = context
	return getProduct
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
		result = ctx.Db.Find(&response.Products)
	} else {
		result = ctx.Db.Where(request.Ids).Find(&response.Products)
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
