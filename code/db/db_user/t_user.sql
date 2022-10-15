CREATE TABLE `t_user`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `username`   varchar(255) NOT NULL COMMENT '用户名',
    `open_id`   varchar(255) NOT NULL COMMENT 'openID',
    `phone`      varchar(255) NOT NULL COMMENT '手机号',
    `email`      varchar(255) NOT NULL COMMENT '邮箱',
    `gender`     int(1) DEFAULT 1 COMMENT '性别：0->未知；1->男；2->女',
    `status`     int(1) DEFAULT 1 COMMENT '帐号启用状态:0->禁用；1->启用',
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表';

