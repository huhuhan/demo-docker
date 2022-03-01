
CREATE TABLE `report_file` (
    `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` varchar(64) DEFAULT NULL COMMENT '报表的名称',
    `content` text COMMENT '报表的内容',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表数据表';