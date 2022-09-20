CREATE TABLE `t_order`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `order_id`      varchar(255) NOT NULL COMMENT '订单编号',
    `order_type`    int(1) NOT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单等',
    `order_status`  int(1) NOT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    `pay_type`      int(1) NOT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
    `trade_no`      varchar(255) NOT NULL COMMENT '交易号',
    `order_amount`  int(32) NOT NULL COMMENT '订单总金额',
    `pay_amount`    int(32) NOT NULL COMMENT '应付金额（实际支付金额）',
    `coupon_id`     int(11) NOT NULL COMMENT '优惠券id',
    `coupon_amount` int(32) NOT NULL COMMENT '优惠券抵扣金额',
    `user_id`       int(11) NOT NULL COMMENT '用户id',
    `pay_at`        datetime     NOT NULL COMMENT '支付时间',
    `created_at`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表';