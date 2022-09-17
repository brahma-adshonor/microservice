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

