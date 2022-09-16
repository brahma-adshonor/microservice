CREATE TABLE `t_category`
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