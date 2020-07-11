
 drop table if exists trans_city_info; -- 城市
 drop table if exists trans_customer_user; -- 用户表
 drop table if exists trans_customer_user_role; -- 用户角色表
 drop table if exists trans_position; -- 广告位
 drop table if exists trans_position_format; -- 广告位格式
 drop table if exists trans_tag_category; -- 标签类别
 drop table if exists trans_tag; -- 标签

 drop table if exists trans_carrier_category; -- 载体类别

 drop table if exists trans_customer; -- 客户
 drop table if exists trans_carrier; -- 客户载体
 drop table if exists trans_carrier_position; -- 载体广告位关联

 drop table if exists trans_material; -- 广告素材
 drop table if exists trans_material_tag; -- 广告标签关联
 drop table if exists trans_ads; -- 广告（素材集合）
 drop table if exists trans_ads_material; -- 广告素材表
 drop table if exists trans_launch_plan; -- 播放设置
 drop table if exists trans_launch_plan_exclude; -- 投放计划排除
 drop table if exists trans_launch_plan_monitor; -- 投放计划监控

 drop table if exists trans_material_counter_hour; -- 广告数据汇总

CREATE TABLE `trans_city_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `province_code` varchar(64) COMMENT '载体广告位编号',
  `province_name` varchar(64) COMMENT '载体广告位编号',
  `city_code` varchar(64) COMMENT '载体广告位编号',
  `city_name` varchar(64) COMMENT '载体广告位编号',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市信息表';

alter table trans_city_info add INDEX ci_base_id_idx(base_id);
alter table trans_city_info add INDEX ci_province_code_idx(province_code);
alter table trans_city_info add INDEX ci_city_code_idx(city_code);

CREATE TABLE `trans_customer_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `sso_id` bigint(20) COMMENT 'sso系统用户ID',
  `admin_flag` char(1) COMMENT '超级管理员：0不是，1是。超级管理员无法在用户界面删除',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人登录用户名，sso系统登录名',
  `update_name` varchar(80) COMMENT '修改人登录用户名，sso系统登录名',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户用户表';

alter table trans_customer_user add INDEX uc_base_id_idx(base_id);
alter table trans_customer_user add INDEX uc_customer_id_idx(customer_id);
alter table trans_customer_user add INDEX uc_sso_id_idx(sso_id);

CREATE TABLE `trans_customer_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `user_id` bigint(20) COMMENT '商户用户id',
  `customer_id` bigint(20) COMMENT '客户id',
  `sso_id` bigint(20) COMMENT 'sso系统用户ID',
  `role_code` varchar(64) COMMENT '角色码。现在只有ADS_ADMIN，ADS_OP',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人登录用户名，sso系统登录名',
  `update_name` varchar(80) COMMENT '修改人登录用户名，sso系统登录名',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户用户表';

alter table trans_customer_user_role add INDEX ucr_base_id_idx(base_id);
alter table trans_customer_user_role add INDEX ucr_user_id_idx(user_id);
alter table trans_customer_user_role add INDEX ucr_customer_id_idx(customer_id);
alter table trans_customer_user_role add INDEX ucr_sso_id_idx(sso_id);

CREATE TABLE `trans_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `code` varchar(64) COMMENT '广告位编号',
  `name` varchar(64) COMMENT '广告位名称，例如720p',
  `category` char(1) COMMENT '广告位类别，0：视频，1，图片',
  `ads_length` int COMMENT '广告尺寸，长度',
  `ads_width` int COMMENT '广告尺寸，宽度',
  `ads_format` varchar(64) COMMENT 'mp4,flv数据用逗号分隔',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位配置流水表';

alter table trans_position add INDEX p_base_id_idx(base_id);
alter table trans_position add INDEX p_code_idx(code);

CREATE TABLE `trans_position_format` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `position_id` bigint(20) COMMENT '广告位id',
  `format_code` varchar(64) COMMENT '格式编号',
  `format_name` varchar(64) COMMENT '格式名称，例如mp4',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位格式表';

alter table trans_position_format add INDEX pf_base_id_idx(base_id);
alter table trans_position_format add INDEX pf_position_id_idx(position_id);

CREATE TABLE `trans_tag_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `code` varchar(64) COMMENT '标签类别编号',
  `name` varchar(64) COMMENT '广告标签类别名称',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告标签类别流水表';

alter table trans_tag_category add INDEX tc_base_id_idx(base_id);

CREATE TABLE `trans_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `category_id` bigint(20) COMMENT '标签类别id',
  `code` varchar(64) COMMENT '标签编号',
  `name` varchar(64) COMMENT '广告标签名称',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告标签流水表';

alter table trans_tag add INDEX t_base_id_idx(base_id);
alter table trans_tag add INDEX t_category_id_idx(category_id);
alter table trans_tag add INDEX t_code_idx(code);

CREATE TABLE `trans_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `code` varchar(64) COMMENT '客户编号',
  `name` varchar(64) COMMENT '客户名称',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户流水表';

alter table trans_customer add INDEX c_base_id_idx(base_id);
alter table trans_customer add INDEX c_code_idx(code);

CREATE TABLE `trans_carrier_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `name` varchar(64) COMMENT '载体类别名称',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='载体类别流水表';

alter table trans_carrier_category add INDEX cc_base_id_idx(base_id);

CREATE TABLE `trans_carrier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `name` varchar(64) COMMENT '载体名称',
  `code` varchar(64) COMMENT '载体编号，和载体交互使用',
  `principal` varchar(64) COMMENT '辅助加密字段',
  `carrier_category_id` bigint(20) COMMENT '广告载体类别id',
  `property1` varchar(128) COMMENT '广告载体属性1，公交车则为车牌号',
  `property2` varchar(128) COMMENT '广告载体属性2，公交车则为运营路线',
  `property3` varchar(128) COMMENT '广告载体属性3，公交车则为运营路线',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户载体流水表';

alter table trans_carrier add INDEX c_base_id_idx(base_id);
alter table trans_carrier add INDEX c_customer_id_idx(customer_id);
alter table trans_carrier add INDEX c_code_idx(code);
alter table trans_carrier add INDEX c_property1_idx(property1);
alter table trans_carrier add INDEX c_carrier_category_id_idx(carrier_category_id);

CREATE TABLE `trans_carrier_alg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `carrier_id` bigint(20) COMMENT '车辆id',
  `carrier_code` varchar(64) COMMENT '车辆的deviceCode编号',
  `alg_mac` varchar(64) COMMENT '车辆上算法工控机MAC地址',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆算法工控机配置表';

alter table trans_carrier_alg add INDEX ca_base_id_idx(base_id);
alter table trans_carrier_alg add INDEX ca_customer_id_idx(customer_id);
alter table trans_carrier_alg add INDEX ca_carrier_id_idx(carrier_id);
alter table trans_carrier_alg add INDEX ca_carrier_code_idx(carrier_code);
alter table trans_carrier_alg add INDEX ca_alg_mac_idx(alg_mac);

CREATE TABLE `trans_carrier_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `carrier_id` bigint(20) COMMENT '客户载体id',
  `code` varchar(64) COMMENT '载体广告位编号',
  `name` varchar(64) COMMENT '广告播放实体，例如车中间屏幕，车后方屏幕左上，？？？有待详细讨论',
  `position_id` bigint(20) COMMENT '广告位id',
  `position_name` varchar(64) COMMENT '广告位名称',
  `carrier_category_id` bigint(20) COMMENT '广告载体类别id，冗余字段',
  `property1` varchar(128) COMMENT '载体广告位属性1',
  `property2` varchar(128) COMMENT '载体广告位属性2',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户载体广告位流水表';

alter table trans_carrier_position add INDEX cp_base_id_idx(base_id);
alter table trans_carrier_position add INDEX cp_customer_id_idx(customer_id);
alter table trans_carrier_position add INDEX cp_carrier_id_idx(carrier_id);
alter table trans_carrier_position add INDEX cp_code_idx(code);
alter table trans_carrier_position add INDEX cp_carrier_category_id_idx(carrier_category_id);

CREATE TABLE `trans_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `code` varchar(64) COMMENT '广告编号',
  `name` varchar(64) COMMENT '广告名称',
  `position_id` bigint(20) COMMENT '广告位id',
  `position_name` varchar(64) COMMENT '广告位名称，冗余字段',
  `position_category` char(1) COMMENT '广告位类别，0：视频，1，图片,冗余字段',
  `width` int COMMENT '广告尺寸，宽度',
  `height` int COMMENT '广告尺寸，长度',
  `format_code` varchar(64) COMMENT '格式编号',
  `format_name` varchar(64) COMMENT '格式名称，例如mp4',
  `preview` varchar(256) COMMENT '预览，视频第一帧，图片地址。',
  `address` varchar(256) COMMENT '广告内容地址，CDN地址',
  `exposure_count` bigint(20) COMMENT '曝光总数，counter表的汇总',
  `view_count` bigint(20) COMMENT '观看次数',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：POSITION被删除',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告素材表';

alter table trans_material add INDEX m_base_id_idx(base_id);
alter table trans_material add INDEX m_customer_id_idx(customer_id);
alter table trans_material add INDEX m_code_idx(code);
alter table trans_material add INDEX m_position_id_idx(position_id);

CREATE TABLE `trans_material_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `material_id` bigint(20) COMMENT '素材id',
  `tag_category_id` bigint(20) COMMENT '标签类别id',
  `tag_id` bigint(20) COMMENT '标签id',
  `tag_name` varchar(64) COMMENT '广告标签名称',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='素材标签关联表';

alter table trans_material_tag add INDEX mt_base_id_idx(base_id);
alter table trans_material_tag add INDEX mt_customer_id_idx(customer_id);
alter table trans_material_tag add INDEX mt_material_id_idx(material_id);
alter table trans_material_tag add INDEX mt_tag_category_id_idx(tag_category_id);
alter table trans_material_tag add INDEX mt_tag_id_idx(tag_id);

CREATE TABLE `trans_ads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `code` varchar(64) COMMENT '广告编号',
  `name` varchar(64) COMMENT '广告名称',
  `info` varchar(128) COMMENT '广告信息',
  `position_id` bigint(20) COMMENT '广告位id',
  `position_name` varchar(64) COMMENT '广告位名称，冗余字段',
  `position_category` char(1) COMMENT '广告位类别，0：视频，1，图片,冗余字段',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告内容表';

alter table trans_ads add INDEX a_base_id_idx(base_id);
alter table trans_ads add INDEX a_customer_id_idx(customer_id);
alter table trans_ads add INDEX a_code_idx(code);
alter table trans_ads add INDEX a_position_id_idx(position_id);

CREATE TABLE `trans_ads_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `ads_id` bigint(20) COMMENT '广告id',
  `material_id` bigint(20) COMMENT '素材id',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：使用，1：停用',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告素材关联表';

alter table trans_ads_material add INDEX am_base_id_idx(base_id);
alter table trans_ads_material add INDEX am_customer_id_idx(customer_id);
alter table trans_ads_material add INDEX am_ads_id_idx(ads_id);
alter table trans_ads_material add INDEX am_material_id_idx(material_id);

CREATE TABLE `trans_launch_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `launch_type` char(1) COMMENT '投放属性，0不限，1按时间，2按次数，3按资费',
  `start_date` varchar(8) COMMENT '开始日期yyyymmdd',
  `end_date` varchar(8) COMMENT '结束日期yyyymmdd',
  `start_time` varchar(6) COMMENT '开始时间hhmmss',
  `end_time` varchar(6) COMMENT '结束时间hhmmss',
  `max_count` int COMMENT '投放最大次数',
  `max_balance` decimal(16,2) COMMENT '资费',
  `strategy_type` char(1) COMMENT '策略，0不限（按客户），1素材，2按广告，3按标签，4标签类别',
  `strategy_id` bigint(20) COMMENT '策略ID，策略1素材ID，策略2广告ID，策略3标签ID，策略4标签类别ID',
  `carrier_type` char(1) COMMENT '载体类型，0全配置（按客户），1按载体ID，2按载体类型',
  `carrier_id` bigint(20) COMMENT '载体ID，类型1载体ID，类型2载体类型ID',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0未启用，1启用，2自然结束，3运营关闭',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告投放计划流水表';

alter table trans_launch_plan add INDEX lp_base_id_idx(base_id);
alter table trans_launch_plan add INDEX lp_customer_id_idx(customer_id);
alter table trans_launch_plan add INDEX lp_strategy_id_idx(strategy_id);
alter table trans_launch_plan add INDEX lp_carrier_id_idx(carrier_id);

CREATE TABLE `trans_launch_plan_exclude` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `launch_plan_id` bigint(20) COMMENT '投放计划id',
  `customer_id` bigint(20) COMMENT '客户id',
  `launch_type` char(1) COMMENT '投放属性，0不限，1按时间，2按次数，3按资费，冗余字段',
  `start_date` varchar(8) COMMENT '排除开始日期yyyymmdd',
  `end_date` varchar(8) COMMENT '排除结束日期yyyymmdd',
  `start_time` varchar(6) COMMENT '排除开始时间hhmmss',
  `end_time` varchar(6) COMMENT '排除结束时间hhmmss',
  `max_count` int COMMENT '投放最大次数，冗余字段',
  `max_balance` decimal(16,2) COMMENT '资费，冗余字段',
  `strategy_type` char(1) COMMENT '排除策略，0不限（按客户），1素材，2按广告，3按标签，4标签类别',
  `strategy_id` bigint(20) COMMENT '排除策略ID，策略1素材ID，策略2广告ID，策略3标签ID，策略4标签类别ID',
  `carrier_type` char(1) COMMENT '排除载体类型，0全配置（按客户），1按载体ID，2按载体类型',
  `carrier_id` bigint(20) COMMENT '排除载体ID，类型1载体ID，类型2载体类型ID',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0未启用，1启用，2自然结束，3运营关闭',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告投放计划，排除流水表';

alter table trans_launch_plan_exclude add INDEX lpe_base_id_idx(base_id);
alter table trans_launch_plan_exclude add INDEX lpe_launch_plan_id_idx(launch_plan_id);
alter table trans_launch_plan_exclude add INDEX lpe_customer_id_idx(customer_id);
alter table trans_launch_plan_exclude add INDEX lpe_strategy_id_idx(strategy_id);
alter table trans_launch_plan_exclude add INDEX lpe_carrier_id_idx(carrier_id);

CREATE TABLE `trans_launch_plan_monitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `launch_plan_id` bigint(20) COMMENT '投放计划id',
  `customer_id` bigint(20) COMMENT '客户id',
  `launch_type` char(1) COMMENT '投放属性，0不限，1按时间，2按次数，3按资费，冗余字段',
  `start_date` varchar(8) COMMENT '开始日期yyyymmdd',
  `end_date` varchar(8) COMMENT '结束日期yyyymmdd',
  `start_time` varchar(6) COMMENT '开始时间hhmmss',
  `end_time` varchar(6) COMMENT '结束时间hhmmss',
  `max_count` int COMMENT '投放最大次数',
  `current_count` int COMMENT '当前投放次数',
  `max_balance` decimal(16,2) COMMENT '资费',
  `current_balance` decimal(16,2) COMMENT '当前资费',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0：监控中，1：结束',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告投放计划监控流水表';

alter table trans_launch_plan_monitor add INDEX lpm_base_id_idx(base_id);
alter table trans_launch_plan_monitor add INDEX lpm_launch_plan_id_idx(launch_plan_id);
alter table trans_launch_plan_monitor add INDEX lpm_customer_id_idx(customer_id);

CREATE TABLE `trans_material_counter_hour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `base_id` bigint(20) COMMENT '主表id',
  `customer_id` bigint(20) COMMENT '客户id',
  `launch_plan_id` bigint(20) COMMENT '播放计划ID',
  `carrier_category_id` bigint(20) COMMENT '载体类别id，冗余字段',
  `material_id` bigint(20) COMMENT '素材id',
  `counter_hour` varchar(10) COMMENT '统计频率，小时。yyyymmddHH，按时间分割',
  `material_count` bigint(20) COMMENT '广告投放次数',
  `remarks` varchar(128) COMMENT '备注',
  `status` char(1) COMMENT '状态，0使用中，1已汇聚',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  `trans_detail` varchar(64) COMMENT '流水信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告播放统计小时表';

alter table trans_material_counter_hour add INDEX mch_base_id_idx(base_id);
alter table trans_material_counter_hour add INDEX mch_customer_id_idx(customer_id);
alter table trans_material_counter_hour add INDEX mch_launch_plan_id_idx(launch_plan_id);
alter table trans_material_counter_hour add INDEX mch_carrier_category_id_idx(carrier_category_id);
alter table trans_material_counter_hour add INDEX mch_material_id_idx(material_id);
alter table trans_material_counter_hour add INDEX mch_counter_hour_idx(counter_hour);
alter table trans_material_counter_hour add INDEX mch_plan_material_hour_idx(launch_plan_id,material_id,counter_hour);
