
CREATE TABLE `acct` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sso_id` char(36) NOT NULL COMMENT 'SSO平台主键',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像url',
  `mobile` char(20) DEFAULT NULL COMMENT '电话号码',
  `idcard` char(18) DEFAULT NULL COMMENT '身份证号',
  `idcard_url` varchar(255) DEFAULT NULL COMMENT '身份证照片',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` char(36) DEFAULT '' COMMENT '创建人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` char(36) DEFAULT '' COMMENT '更新人',
  `version` int(11) unsigned NOT NULL DEFAULT 1 COMMENT '版本号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记"0"未删除，”1“已删除',
  `is_corp_admin` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否企业管理员',
  PRIMARY KEY (`id`),
  KEY `IDX_SSO_ID_DELETED` (`sso_id`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `acct_platform_role` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id` varchar(50) NOT NULL COMMENT '终端ID',
  `acct_id` bigint(11) NOT NULL COMMENT 'biz_acct主键',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_id` int(11) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `equip` (
   `id` varchar(30) COLLATE utf8_bin NOT NULL,
  `device_code` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '设备编码',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备详细信息',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT 0,
  `series_model_version` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '产品编码-产品系列-产品版本',
  `status_sdk` int(1) DEFAULT 1 COMMENT 'sdk状态  0 停用  1 启用',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `series` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '系列',
  `model` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '型号',
  `version` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '版本',
  `device_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '设备类型  BUS：熊猫智行',
  `dss_bus_as_device_id` varchar(32) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_device_code` (`device_code`) USING BTREE,
  KEY `idx_series_model_version` (`series_model_version`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='iot设备信息表';




CREATE TABLE `v3_media_device_smv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `series_model_version` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `media_id` bigint(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `series` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列',
  `model` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL  COMMENT '型号',
  `version` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




alter table v3_play_log add COLUMN `device_code` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '设备id';
alter table v3_plan add COLUMN   `platform_id` varchar(50) COLLATE utf8_bin DEFAULT 'PandaBus' COMMENT '所属项目  默认熊猫智行';


alter table v3_position add COLUMN `media_id` int(11) DEFAULT NULL COMMENT '媒体id';
alter table v3_position CHANGE  `position_type`  `position_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '广告位类型  1-横幅 2-开屏 3-插屏 4-原生';
alter table v3_position add COLUMN  `location` tinyint(4) DEFAULT NULL COMMENT '广告位位置  1-全屏 2-页面顶部 3-页面底部 4-侧边栏 5-屏次 6-未知';
alter table v3_position add COLUMN    `screen` tinyint(4) DEFAULT NULL COMMENT '屏次，当location=5时有值  1-首屏 2-二屏 3-三屏 4-四屏 5-五屏 6-五屏以上';
alter table v3_position add COLUMN `audience_ai` tinyint(4) DEFAULT NULL COMMENT '是否支持广告溯源  1-图片溯源 2-图片视频溯源 3-不支持';
alter table v3_position CHANGE  `face_id_support`  `face_id_support` tinyint(1) DEFAULT 0 COMMENT '眼控定向  0 不支持 1 支持';
alter table v3_position CHANGE  `status`  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态，0-停用 1-启用';
alter table v3_position add COLUMN  `deleted` tinyint(1)  DEFAULT 0 COMMENT '是否删除  0 否  1 是';
alter table v3_position add COLUMN  `code` varchar(50) default null;
ALTER TABLE v3_position CHANGE `display_device_type` `display_device_type` BIGINT (20) DEFAULT NULL;
ALTER TABLE v3_position CHANGE `status` `status` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '状态，0-停用 1-启用';
alter table media add column `create_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人';
alter table media add column `update_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人';



alter table v3_plan_ads_item change `status` `status` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '状态，0:待审核  1 审核通过  2审核拒绝';
alter table v3_plan_ads_item add COLUMN `remark` varchar(200) DEFAULT null COMMENT '备注(拒绝原因)' ;
alter table v3_plan  add COLUMN `audit_time` datetime DEFAULT current_timestamp() COMMENT '提审时间';
alter table v3_plan add COLUMN  `audit_status` char(2) COLLATE utf8_bin DEFAULT '1' COMMENT '审核状态 -1 准备中  0：待审核  1 审核通过  2 审核拒绝 3已结束';
alter table v3_plan add COLUMN `customer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL;

alter table v3_play_log add column `device_code` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '设备id';
alter table v3_play_log add column `media_name` varchar(255) COLLATE utf8_bin DEFAULT NULL;
alter table v3_play_log add column `media_id` int(11) DEFAULT NULL;
alter table v3_play_log add column `position_name` varchar(255) COLLATE utf8_bin DEFAULT NULL;
alter table v3_play_log add column `position_id` int(11) DEFAULT NULL;
alter table v3_play_log add column `customer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL;


update v3_plan set audit_time = now();

update v3_play_log  a left join v3_plan b on a.plan_id = b.id set a.position_id = b.position_id;

update v3_play_log a left join v3_position b on a.position_id = b.id set a.position_name = b.name;