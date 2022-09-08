# 商品表
CREATE TABLE `product`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `name`             varchar(255)   NOT NULL COMMENT '商品名称',
    `price`            decimal(10, 2) NOT NULL COMMENT '商品价格',
    `pic`              varchar(255) COMMENT '商品图片',
    `description`      varchar(255)   NOT NULL COMMENT '商品描述',
    `sale`             int COMMENT '销量',
    `delete_status`    int(1) DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
    `publish_status`   int(1) DEFAULT 0 COMMENT '上架状态：0->下架；1->上架',
    `recommend_status` int(1) DEFAULT 0 COMMENT '推荐状态；0->不推荐；1->推荐',
    `category_id`      int(11) NOT NULL COMMENT '类目编号',
    `created_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_category_type` (`category_type`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表';


# 商品分类表
CREATE TABLE `product_category`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
    `name`        varchar(255) NOT NULL COMMENT '商品分类名称',
    `description` varchar(255) NOT NULL COMMENT '商品分类描述',
    `parent_id`   int(11) NOT NULL COMMENT '父分类id',
    `level`       int(11) NOT NULL COMMENT '分类层级',
    `sort`        int(11) NOT NULL COMMENT '排序',
    `icon`        varchar(255) NOT NULL COMMENT '图标',
    `keywords`    varchar(255) NOT NULL COMMENT '关键字',
    `show_status` int(1) COMMENT '显示状态：0->不显示；1->显示',
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表';





































