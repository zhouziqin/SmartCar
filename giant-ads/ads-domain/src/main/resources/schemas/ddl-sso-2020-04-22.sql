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
  `version` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '版本号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记',
  `is_corp_admin` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否企业管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_SSO_ID_DELETED` (`sso_id`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4;