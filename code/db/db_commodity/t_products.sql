CREATE TABLE `t_products`
(
    `id`               int(32)      NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `name`             varchar(255) NOT NULL COMMENT '商品名称',
    `price`            int(32)      NOT NULL COMMENT '商品价格, 价格分',
    `pic`              varchar(255) COMMENT '商品图片',
    `description`      varchar(255) NOT NULL COMMENT '商品描述',
    `sale`             int COMMENT '销量',
    `delete_status`    int(1)                DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
    `publish_status`   int(1)                DEFAULT 0 COMMENT '上架状态：0->下架；1->上架',
    `recommend_status` int(10)               DEFAULT 0 COMMENT '推荐状态；0->不推荐；5->五星推荐',
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表';


-- ----------------------------
-- Records of t_products
-- ----------------------------
INSERT INTO `t_products` (`id`,`name`,`price`,`pic`,`description`,`sale`,`delete_status`,`publish_status`,`recommend_status`) VALUES
(1,"烟台红富士苹果","4490","https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/df392d01993cdab9de740fe17798bda1","烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果","0",0,1,5),
(2,"西州蜜瓜25号哈密瓜","3690","https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/c3dee23a62efe14bbd4fc2c70046dc73","西州蜜瓜25号哈密瓜 2粒装 单果1.25kg以上 新鲜水果","0",0,1,4),
(3,"特级黄冠梨","19900","https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/39c84604648e05d89837cfaf159d587e","【京东空运】平谷大桃 北京水蜜桃 新鲜水果 蜜露桃子礼盒 京东生鲜 非阳山水蜜桃 单果7两-8两大果 12个礼盒装","0",0,1,3),
(4,"平谷大桃","4490","https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/aa6da6c7dbf4638aa16362ca6d0720b4","长城果品 特级黄冠梨 皇冠梨 净重5斤 梨子 新鲜水果","0",0,1,3),
(5,"芒果","2900","https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/28ce03b5e05ed98a9e2fd41e2e833f47","凯特芒果大果新鲜水果 5斤200-400g","0",0,1,3);
