CREATE TABLE `t_cart`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`       int(11) NOT NULL COMMENT '用户id',
    `product_id`    int(11) NOT NULL COMMENT '商品id',
    `quantity`      int(11) NOT NULL COMMENT '商品数量',
    `delete_status` int(1) default 0 comment '是否删除',
    `created_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车表';
