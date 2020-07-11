
 drop table if exists module_video_summary; -- 模块视频配置表
 drop table if exists module_video_detail; -- 模块视频详情表

CREATE TABLE `module_video_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id，预留字段',
  `alg_mac` varchar(64) COMMENT '以后可能做单独配置的，预留字段',
  `name` varchar(64) COMMENT '模块名称',
  `weight` int COMMENT '权重，1-100',
  `image_url` varchar(256) COMMENT '模块封面图片地址',
  `video_count` int COMMENT '视频数量',
  `remark` varchar(256) COMMENT '备注',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频模块配置表';

alter table module_video_summary add INDEX mvs_customer_id_idx(customer_id);

CREATE TABLE `module_video_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id，预留字段',
  `module_id` bigint(20) COMMENT '模块id',
  `name` varchar(64) COMMENT '视频名称',
  `weight` int COMMENT '权重，1-100',
  `image_url` varchar(256) COMMENT '视频图片地址',
  `video_url` varchar(256) COMMENT '视频地址',
  `video_length` varchar(64) COMMENT '视频时长，暂时由前段写入String',
  `video_format` varchar(64) COMMENT '视频格式，暂时由前段写入String',
  `exposure_count` bigint(20) COMMENT '曝光总数，播放次数',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块视频详情表';

alter table module_video_detail add INDEX mvd_customer_id_idx(customer_id);
alter table module_video_detail add INDEX mvd_module_id_idx(module_id);
