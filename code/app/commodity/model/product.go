package model

// 第一个版本，我们只支持未删除的商品，以及上架的商品
type Product struct {
	ID              int32
	Name            string
	Price           int32 // 单位分
	Pic             string
	Description     string
	Sale            int32
	RecommendStatus int32 // 推荐指数
}
