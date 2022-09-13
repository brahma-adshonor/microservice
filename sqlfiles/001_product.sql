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
    `created_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表';

# 商品类目表
CREATE TABLE `category`
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
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目表';

# 商品类目关系表
CREATE TABLE `product_category_relation`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类关系id',
    `product_id` int(11) NOT NULL COMMENT '商品id',
    `category_id` int(11) NOT NULL COMMENT '商品分类id',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_product_id` (`product_id`),
    KEY `idx_category_id` (`category_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类目关系表';


# 订单表
CREATE TABLE `order`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `order_id`         varchar(255) NOT NULL COMMENT '订单编号',
    `order_type`       int(1) NOT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单等',
    `order_status`     int(1) NOT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    `pay_type`         int(1) NOT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
    `trade_no`         varchar(255) NOT NULL COMMENT '交易号',
    `order_amount`     int(32) NOT NULL COMMENT '订单总金额',
    `pay_amount`       int(32) NOT NULL COMMENT '应付金额（实际支付金额）',
    `coupon_id`        int(11) NOT NULL COMMENT '优惠券id',
    `coupon_amount`    int(32) NOT NULL COMMENT '优惠券抵扣金额',
    `pay_at`           datetime       NOT NULL  COMMENT '支付时间',
    `created_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表';



# 用户表
CREATE TABLE `user`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `username`     varchar(255) NOT NULL COMMENT '用户名',
    `password`     varchar(255) NOT NULL COMMENT '密码',
    `phone`        varchar(255) NOT NULL COMMENT '手机号',
    `email`        varchar(255) NOT NULL COMMENT '邮箱',
    `created_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表';

# 购物车表
CREATE TABLE `cart`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`      int(11) NOT NULL COMMENT '用户id',
    `product_id`   int(11) NOT NULL COMMENT '商品id',
    `quantity`     int(11) NOT NULL COMMENT '商品数量',
    `delete_status` int(1) default 0 comment '是否删除',
    `created_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车表';


# 优惠卷表
CREATE TABLE `coupon`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `coupon_name`  varchar(255) NOT NULL COMMENT '优惠卷名称',
    `coupon_type`  int(1) NOT NULL COMMENT '优惠卷类型：0->全场通用；1->指定分类；2->指定商品',
    `coupon_amount` int(11) NOT NULL COMMENT '优惠卷金额',
    `coupon_min_amount` int(11) NOT NULL COMMENT '最低消费金额',
    `coupon_start_time` datetime NOT NULL COMMENT '优惠卷开始时间',
    `coupon_end_time` datetime NOT NULL COMMENT '优惠卷结束时间',
    `coupon_status` int(1) NOT NULL COMMENT '优惠卷状态：0->未使用；1->已使用；2->已过期',
    `coupon_user_id` int(11) NOT NULL COMMENT '用户id',
    `coupon_product_category_id` int(11) NOT NULL COMMENT '商品分类id',
    `coupon_product_id` int(11) NOT NULL COMMENT '商品id',
    `created_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠卷表';



