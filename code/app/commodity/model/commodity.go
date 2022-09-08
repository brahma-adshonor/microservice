package model

// 第一个版本，我们只支持未删除的商品，以及上架的商品
type Model struct {
	id          int32
	name        string
	price       int32 // 单位分
	pic         string
	description string
	sale        int32
	recommend   int32 // 推荐指数
}
