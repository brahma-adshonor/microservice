-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (1, '202103011234567890', 0, 2, 0, '202103011234567890', 100, 100, 0, 0, 1, '2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (2, '202103011234567891', 0, 3, 0, '202103011234567891', 100, 100, 0, 0, 2,'2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (3, '202103011234567892', 0, 4, 0, '202103011234567892', 100, 100, 0, 0, 3,'2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (4, '202103011234567893', 0, 2, 0, '202103011234567893', 100, 100, 0, 0, 4,'2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (5, '202103011234567894', 0, 3, 0, '202103011234567894', 100, 100, 0, 0, 5,'2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (6, '202103011234567895', 0, 4, 0, '202103011234567895', 100, 100, 0, 0, 6,'2021-03-01 12:34:56');
INSERT INTO `t_order` (`id`,`order_id`, `order_type`, `order_status`, `pay_type`, `trade_no`, `order_amount`, `pay_amount`, `coupon_id`, `coupon_amount`, `user_id`, `pay_at`)VALUES (7, '202103011234567896', 0, 2, 0, '202103011234567896', 100, 100, 0, 0, 7,'2021-03-01 12:34:56');


-- ----------------------------
-- Records of t_order_item
-- ----------------------------

INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(1, '202103011234567890', 1, '烟台红富士苹果', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');
INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(2, '202103011234567891', 2, '西州蜜瓜25号哈密瓜', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');
INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(3, '202103011234567892', 3, '特级黄冠梨', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');
INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(4, '202103011234567893', 4, '平谷大桃', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');
INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(5, '202103011234567894', 5, '芒果', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');
INSERT INTO `t_order_item` (`id`,`order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `created_at`, `updated_at`)VALUES(6, '202103011234567890', 2, '西州蜜瓜25号哈密瓜', 100, 1, '2021-03-01 12:34:56', '2021-03-01 12:34:56');