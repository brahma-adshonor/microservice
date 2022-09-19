CREATE TABLE `t_product_category_relation`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类关系id',
    `product_id`  int(11) NOT NULL COMMENT '商品id',
    `category_id` int(11) NOT NULL COMMENT '商品分类id',
    `created_at`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY           `idx_product_id` (`product_id`),
    KEY           `idx_category_id` (`category_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类目关系表';