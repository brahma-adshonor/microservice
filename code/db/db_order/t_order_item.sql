CREATE TABLE `t_order_item`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `order_id`         varchar(255) NOT NULL COMMENT '订单编号',
    `product_id`       int(11) NOT NULL COMMENT '商品id',
    `product_name`     varchar(255) NOT NULL COMMENT '商品名称',
    `product_price`    int(32) NOT NULL COMMENT '商品价格',
    `product_quantity` int(11) NOT NULL COMMENT '商品数量',
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品信息表';