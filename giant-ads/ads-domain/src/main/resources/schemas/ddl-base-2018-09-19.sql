
 drop table if exists station_information; -- 车站路线信息表
 drop table if exists station_config; -- 车站路线配置表


 drop table if exists behavior_monitor_event; -- 行为监控事件
 drop table if exists behavior_monitor_summary_all; -- 行为监控事件汇总表
 drop table if exists behavior_monitor_summary_car; -- 行为监控事件汇总表
 

 drop table if exists city_info; -- 城市
 drop table if exists customer_user; -- 用户表
 drop table if exists customer_user_role; -- 用户角色表
 drop table if exists position; -- 广告位
 drop table if exists position_format; -- 广告位格式
 drop table if exists tag_category; -- 标签类别
 drop table if exists tag; -- 标签

 drop table if exists carrier_category; -- 载体类别

 drop table if exists customer; -- 客户
 drop table if exists carrier; -- 客户载体
 drop table if exists carrier_alg; -- 车辆算法工控机配置表
 drop table if exists carrier_android; -- 车辆安卓配置表
 drop table if exists carrier_position; -- 载体广告位关联

 drop table if exists material; -- 广告素材
 drop table if exists material_tag; -- 广告标签关联
 drop table if exists ads; -- 广告（素材集合）
 drop table if exists ads_material; -- 广告素材表
 drop table if exists launch_plan; -- 播放设置
 drop table if exists launch_plan_exclude; -- 投放计划排除
 drop table if exists launch_plan_monitor; -- 投放计划监控

 drop table if exists material_counter_hour; -- 广告数据汇总


CREATE TABLE `station_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `name` varchar(64) COMMENT '路线名称',
  `information` varchar(512) COMMENT '路线信息',
  `reserve_1` varchar(512) COMMENT '预留字段1',
  `reserve_2` varchar(521) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车站路线信息表';

alter table station_information add INDEX si_customer_id_idx(customer_id);

CREATE TABLE `station_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `carrier_id` bigint(20) COMMENT '车辆id',
  `carrier_code` varchar(64) COMMENT '车辆的deviceCode编号',
  `information_id` bigint(20) COMMENT '车站路线信息表id',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车站路线配置表';

alter table station_config add INDEX sc_customer_id_idx(customer_id);
alter table station_config add UNIQUE sc_carrier_id_uni(carrier_id);
alter table station_config add UNIQUE sc_carrier_code_uni(carrier_code);

CREATE TABLE `behavior_monitor_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `alg_mac` varchar(64) COMMENT '车辆上算法工控机MAC地址',
  `carrier_id` bigint(20) COMMENT '车辆ID',
  `device_code` varchar(64) COMMENT '车辆deviceCode',
  `camera_position` varchar(2) COMMENT '相机位置',
  `camera_code` varchar(64) COMMENT '相机编号',
  `behavior_type` char(1) COMMENT '事件类型，0吸烟，1偷盗，2摔倒',
  `image_url` varchar(256) COMMENT '事件图片地址',
  `video_url` varchar(256) COMMENT '事件视频地址',
  `begin_time` datetime COMMENT '事件开始时间',
  `reserve_1` varchar(64) COMMENT '预留字段1',
  `reserve_2` varchar(64) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行为监控事件表';

alter table behavior_monitor_event add INDEX bme_customer_id_idx(customer_id);
alter table behavior_monitor_event add INDEX bme_alg_mac_idx(alg_mac);
alter table behavior_monitor_event add INDEX bme_carrier_id_idx(carrier_id);
alter table behavior_monitor_event add INDEX bme_begin_time_idx(begin_time);

CREATE TABLE `behavior_monitor_summary_all` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `summary_day` char(8) COMMENT '事件汇总日期，yyyyMMdd',
  `event_count_smoke` int COMMENT '抽烟事件数量',
  `event_count_steal` int COMMENT '偷盗事件数量',
  `event_count_fall` int COMMENT '摔倒事件数量',
  `event_count_reserve_1` int COMMENT '预留事件1数量',
  `event_count_reserve_2` int COMMENT '预留事件2数量',
  `event_count_reserve_3` int COMMENT '预留事件3数量',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行为监控事件汇总总表';

alter table behavior_monitor_summary_all add UNIQUE bmsa_day_uni(customer_id,summary_day);
alter table behavior_monitor_summary_all add INDEX bme_customer_id_idx(customer_id);
alter table behavior_monitor_summary_all add INDEX bme_day_idx(summary_day);

CREATE TABLE `behavior_monitor_summary_car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `summary_day` char(8) COMMENT '事件汇总日期，yyyyMMdd',
  `carrier_id` bigint(20) COMMENT '车辆ID',
  `event_count_smoke` int COMMENT '抽烟事件数量',
  `event_count_steal` int COMMENT '偷盗事件数量',
  `event_count_fall` int COMMENT '摔倒事件数量',
  `event_count_reserve_1` int COMMENT '预留事件1数量',
  `event_count_reserve_2` int COMMENT '预留事件1数量',
  `event_count_reserve_3` int COMMENT '预留事件1数量',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行为监控事件汇总车辆表';

alter table behavior_monitor_summary_car add UNIQUE bmsa_day_car_uni(summary_day,carrier_id);
alter table behavior_monitor_summary_car add INDEX bme_customer_id_idx(customer_id);
alter table behavior_monitor_summary_car add INDEX bmsa_day_idx(summary_day);
alter table behavior_monitor_summary_car add INDEX bmsa_carrier_id_idx(carrier_id);

CREATE TABLE `city_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市信息表';

alter table city_info add INDEX ci_province_code_idx(province_code);
alter table city_info add INDEX ci_city_code_idx(city_code);

CREATE TABLE `customer_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `sso_id` bigint(20) COMMENT 'sso系统用户ID',
  `admin_flag` char(1) COMMENT '超级管理员：0不是，1是。超级管理员无法在用户界面删除',
  `mobile` varchar(32) COMMENT '手机号码',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户用户表';

alter table customer_user add INDEX cu_customer_id_idx(customer_id);
alter table customer_user add INDEX cu_sso_id_idx(sso_id);
alter table customer_user add UNIQUE cu_customer_sso_uni(customer_id,sso_id);

CREATE TABLE `customer_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户用户表';

alter table customer_user_role add INDEX cur_user_id_idx(user_id);
alter table customer_user_role add INDEX cur_customer_id_idx(customer_id);
alter table customer_user_role add INDEX cur_sso_id_idx(sso_id);

CREATE TABLE `position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `code` varchar(64) COMMENT '广告位编号',
  `name` varchar(64) COMMENT '广告位名称，例如720p',
  `category` char(1) COMMENT '广告位类别，0：视频，1，图片',
  `width` int COMMENT '广告尺寸，宽度',
  `height` int COMMENT '广告尺寸，长度',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位配置表';

alter table position add INDEX p_code_idx(code);

CREATE TABLE `position_format` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `position_id` bigint(20) COMMENT '广告位id',
  `format_code` varchar(64) COMMENT '格式编号',
  `format_name` varchar(64) COMMENT '格式名称，例如mp4',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `update_id` bigint(20) COMMENT '修改人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `update_name` varchar(80) COMMENT '修改人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  `update_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位格式表';

alter table position_format add INDEX pf_position_id_idx(position_id);

CREATE TABLE `tag_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告标签类别表';

CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告标签表';

alter table tag add INDEX t_category_id_idx(category_id);
alter table tag add INDEX t_code_idx(code);

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

alter table customer add INDEX c_code_idx(code);

CREATE TABLE `carrier_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='载体类别表';

CREATE TABLE `carrier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `name` varchar(64) COMMENT '载体名称',
  `code` varchar(64) COMMENT '载体编号deviceCode，和载体交互使用',
  `principal` varchar(64) COMMENT '辅助加密字段，IOT模块虚拟MAC地址',
  `carrier_category_id` bigint(20) COMMENT '广告载体类别id',
  `property1` varchar(128) COMMENT '广告载体属性1，公交车则为车牌号',
  `property2` varchar(128) COMMENT '广告载体属性2，公交车则为运营路线',
  `property3` varchar(128) COMMENT '广告载体属性3，公交车则为城市编码',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户载体表';

alter table carrier add INDEX c_customer_id_idx(customer_id);
alter table carrier add UNIQUE c_code_uni(code);
alter table carrier add UNIQUE c_property1_uni(property1);
alter table carrier add INDEX c_carrier_category_id_idx(carrier_category_id);

CREATE TABLE `carrier_alg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆算法工控机配置表';

alter table carrier_alg add INDEX ca_customer_id_idx(customer_id);
alter table carrier_alg add INDEX ca_carrier_id_idx(carrier_id);
alter table carrier_alg add INDEX ca_carrier_code_idx(carrier_code);
alter table carrier_alg add UNIQUE ca_alg_mac_uni(alg_mac);

CREATE TABLE `carrier_android` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `carrier_id` bigint(20) COMMENT '车辆id',
  `carrier_code` varchar(64) COMMENT '车辆的deviceCode编号',
  `android_mac` varchar(64) COMMENT '安卓MAC地址',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆安卓配置表';

alter table carrier_android add INDEX ca_customer_id_idx(customer_id);
alter table carrier_android add INDEX ca_carrier_id_idx(carrier_id);
alter table carrier_android add INDEX ca_carrier_code_idx(carrier_code);
alter table carrier_android add UNIQUE ca_android_mac_uni(android_mac);

CREATE TABLE `carrier_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户载体广告位表';

alter table carrier_position add INDEX cp_customer_id_idx(customer_id);
alter table carrier_position add INDEX cp_carrier_id_idx(carrier_id);
alter table carrier_position add INDEX cp_code_idx(code);
alter table carrier_position add INDEX cp_carrier_category_id_idx(carrier_category_id);

CREATE TABLE `material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  `exposure_count` bigint(20) COMMENT '曝光总数，播放次数',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告素材表';

alter table material add INDEX m_customer_id_idx(customer_id);
alter table material add INDEX m_code_idx(code);
alter table material add INDEX m_position_id_idx(position_id);

CREATE TABLE `material_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='素材标签关联表';

alter table material_tag add INDEX mt_customer_id_idx(customer_id);
alter table material_tag add INDEX mt_material_id_idx(material_id);
alter table material_tag add INDEX mt_tag_category_id_idx(tag_category_id);
alter table material_tag add INDEX mt_tag_id_idx(tag_id);

CREATE TABLE `ads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告内容表';

alter table ads add INDEX a_customer_id_idx(customer_id);
alter table ads add INDEX a_code_idx(code);
alter table ads add INDEX a_position_id_idx(position_id);

CREATE TABLE `ads_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告素材关联表';

alter table ads_material add INDEX am_customer_id_idx(customer_id);
alter table ads_material add INDEX am_ads_id_idx(ads_id);
alter table ads_material add INDEX am_material_id_idx(material_id);

CREATE TABLE `launch_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告播放计划表';

alter table launch_plan add INDEX lp_customer_id_idx(customer_id);
alter table launch_plan add INDEX lp_strategy_id_idx(strategy_id);
alter table launch_plan add INDEX lp_carrier_id_idx(carrier_id);

CREATE TABLE `launch_plan_exclude` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告播放计划排除表';

alter table launch_plan_exclude add INDEX lpe_launch_plan_id_idx(launch_plan_id);
alter table launch_plan_exclude add INDEX lpe_customer_id_idx(customer_id);
alter table launch_plan_exclude add INDEX lpe_strategy_id_idx(strategy_id);
alter table launch_plan_exclude add INDEX lpe_carrier_id_idx(carrier_id);

CREATE TABLE `launch_plan_monitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告播放计划监控表';

alter table launch_plan_monitor add INDEX lpm_launch_plan_id_idx(launch_plan_id);
alter table launch_plan_monitor add INDEX lpm_customer_id_idx(customer_id);

CREATE TABLE `material_counter_hour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告播放统计小时表';

alter table material_counter_hour add INDEX mch_customer_id_idx(customer_id);
alter table material_counter_hour add INDEX mch_launch_plan_id_idx(launch_plan_id);
alter table material_counter_hour add INDEX mch_carrier_category_id_idx(carrier_category_id);
alter table material_counter_hour add INDEX mch_material_id_idx(material_id);
alter table material_counter_hour add INDEX mch_counter_hour_idx(counter_hour);
alter table material_counter_hour add UNIQUE mch_plan_material_hour_uni(launch_plan_id,material_id,counter_hour);

CREATE TABLE `base_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` bigint(20) COMMENT '客户id',
  `config_group` varchar(64) COMMENT '预留字段1',
  `config_key` varchar(64) COMMENT '预留字段1',
  `config_value` varchar(512) COMMENT '预留字段1',
  `reserve_1` varchar(512) COMMENT '预留字段1',
  `reserve_2` varchar(512) COMMENT '预留字段2',
  `create_id` bigint(20) COMMENT '创建人userId，对应此表的id字段，非ssoId',
  `create_name` varchar(80) COMMENT '创建人',
  `create_time` datetime DEFAULT now() COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

alter table base_config add INDEX bc_customer_id_idx(customer_id);
alter table base_config add INDEX bc_config_group_idx(config_group);
alter table base_config add INDEX bc_config_key_idx(config_key);
