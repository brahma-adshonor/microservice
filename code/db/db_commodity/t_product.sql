CREATE TABLE `t_product`
(
    `id`               int(32)      NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `name`             varchar(255) NOT NULL COMMENT '商品名称',
    `price`            int(32)      NOT NULL COMMENT '商品价格, 价格分',
    `pic`              varchar(255) COMMENT '商品图片',
    `description`      varchar(255) NOT NULL COMMENT '商品描述',
    `sale`             int COMMENT '销量',
    `delete_status`    int(1)                DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
    `publish_status`   int(1)                DEFAULT 0 COMMENT '上架状态：0->下架；1->上架',
    `recommend_status` int(10)               DEFAULT 0 COMMENT '推荐状态；0->不推荐；10->五星推荐',
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表';