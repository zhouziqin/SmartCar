
-- tag_category
-- insert into tag_category (id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time) values (1,'sex','性别','system init.','0',null,null,null,null,now(),now());

-- insert into tag_category (id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time) values (2,'age','年龄','system init.','0',null,null,null,null,now(),now());

-- tag
insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (1,1,'MALE','男','system init.','0',null,null,null,null,now(),now());

insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (2,1,'FEMALE','女','system init.','0',null,null,null,null,now(),now());


insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (3,2,'BABY','幼年','system init.','0',null,null,null,null,now(),now());

insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (4,2,'YOUNG','少年','system init.','0',null,null,null,null,now(),now());

insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (5,2,'MATURE','青年','system init.','0',null,null,null,null,now(),now());

insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (6,2,'MIDLIFE','中年','system init.','0',null,null,null,null,now(),now());

insert into tag (id,category_id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (7,2,'OLD','老年','system init.','0',null,null,null,null,now(),now());


-- customer
insert into customer (id,code,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (1,'PANDA_BUS','熊猫公交','system init.','0',null,null,null,null,now(),now());


-- carrier_category
insert into carrier_category (id,name,remarks,status,reserve_1,reserve_2,create_name,update_name,create_time,update_time)
values (1,'公交车','system init.','0',null,null,null,null,now(),now());

-- base_config
insert into base_config (id,customer_id,config_group,config_key,config_value,reserve_1,reserve_2,
create_id,create_name,create_time)
values (
null,null,'BEHAVIOR_TYPE_DESC','0','乘客您好，为了您和大家的健康，车内请勿吸烟',null,null,
null,null,now()
);

insert into base_config (id,customer_id,config_group,config_key,config_value,reserve_1,reserve_2,
create_id,create_name,create_time)
values (
null,null,'BEHAVIOR_TYPE_DESC','1','各位乘客，请注意看管好个人财物',null,null,
null,null,now()
);

insert into base_config (id,customer_id,config_group,config_key,config_value,reserve_1,reserve_2,
create_id,create_name,create_time)
values (
null,null,'BEHAVIOR_TYPE_DESC','2','请各位乘客扶好坐稳',null,null,
null,null,now()
);



-- city_info
INSERT INTO `city_info` VALUES ('1', '110000', '北京市', '110100', '北京市市辖区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('2', '110000', '北京市', '110200', '北京市辖县', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('3', '120000', '天津市', '120100', '天津市市辖区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('4', '120000', '天津市', '120200', '天津市辖县', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('5', '130000', '河北省', '130100', '石家庄市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('6', '130000', '河北省', '130200', '唐山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('7', '130000', '河北省', '130300', '秦皇岛市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('8', '130000', '河北省', '130400', '邯郸市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('9', '130000', '河北省', '130500', '邢台市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('10', '130000', '河北省', '130600', '保定市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('11', '130000', '河北省', '130700', '张家口市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('12', '130000', '河北省', '130800', '承德市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('13', '130000', '河北省', '130900', '沧州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('14', '130000', '河北省', '131000', '廊坊市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('15', '130000', '河北省', '131100', '衡水市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('16', '140000', '山西省', '140100', '太原市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('17', '140000', '山西省', '140200', '大同市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('18', '140000', '山西省', '140300', '阳泉市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('19', '140000', '山西省', '140400', '长治市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('20', '140000', '山西省', '140500', '晋城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('21', '140000', '山西省', '140600', '朔州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('22', '140000', '山西省', '140700', '晋中市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('23', '140000', '山西省', '140800', '运城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('24', '140000', '山西省', '140900', '忻州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('25', '140000', '山西省', '141000', '临汾市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('26', '140000', '山西省', '141100', '吕梁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('27', '150000', '内蒙古自治区', '150100', '内蒙古呼和浩特市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('28', '150000', '内蒙古自治区', '150200', '内蒙古包头市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('29', '150000', '内蒙古自治区', '150300', '内蒙古乌海市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('30', '150000', '内蒙古自治区', '150400', '内蒙古赤峰市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('31', '150000', '内蒙古自治区', '150500', '内蒙古通辽市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('32', '150000', '内蒙古自治区', '150600', '内蒙古鄂尔多斯市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('33', '150000', '内蒙古自治区', '150700', '内蒙古呼伦贝尔市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('34', '150000', '内蒙古自治区', '150800', '内蒙古巴彦淖尔市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('35', '150000', '内蒙古自治区', '150900', '内蒙古乌兰察布市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('36', '150000', '内蒙古自治区', '152200', '内蒙古兴安盟', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('37', '150000', '内蒙古自治区', '152500', '内蒙古锡林郭勒盟', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('38', '150000', '内蒙古自治区', '152900', '内蒙古阿拉善盟', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('39', '210000', '辽宁省', '210100', '沈阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('40', '210000', '辽宁省', '210200', '大连市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('41', '210000', '辽宁省', '210300', '鞍山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('42', '210000', '辽宁省', '210400', '抚顺市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('43', '210000', '辽宁省', '210500', '本溪市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('44', '210000', '辽宁省', '210600', '丹东市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('45', '210000', '辽宁省', '210700', '锦州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('46', '210000', '辽宁省', '210800', '营口市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('47', '210000', '辽宁省', '210900', '阜新市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('48', '210000', '辽宁省', '211000', '辽阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('49', '210000', '辽宁省', '211100', '盘锦市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('50', '210000', '辽宁省', '211200', '铁岭市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('51', '210000', '辽宁省', '211300', '朝阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('52', '210000', '辽宁省', '211400', '葫芦岛市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('53', '220000', '吉林省', '220100', '长春市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('54', '220000', '吉林省', '220200', '吉林市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('55', '220000', '吉林省', '220300', '四平市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('56', '220000', '吉林省', '220400', '辽源市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('57', '220000', '吉林省', '220500', '通化市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('58', '220000', '吉林省', '220600', '白山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('59', '220000', '吉林省', '220700', '松原市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('60', '220000', '吉林省', '220800', '白城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('61', '220000', '吉林省', '222400', '延边朝鲜族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('62', '230000', '黑龙江省', '230100', '哈尔滨市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('63', '230000', '黑龙江省', '230200', '齐齐哈尔市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('64', '230000', '黑龙江省', '230300', '鸡西市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('65', '230000', '黑龙江省', '230400', '鹤岗市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('66', '230000', '黑龙江省', '230500', '双鸭山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('67', '230000', '黑龙江省', '230600', '大庆市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('68', '230000', '黑龙江省', '230700', '伊春市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('69', '230000', '黑龙江省', '230800', '佳木斯市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('70', '230000', '黑龙江省', '230900', '七台河市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('71', '230000', '黑龙江省', '231000', '牡丹江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('72', '230000', '黑龙江省', '231100', '黑河市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('73', '230000', '黑龙江省', '231200', '绥化市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('74', '230000', '黑龙江省', '232700', '大兴安岭地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('75', '310000', '上海市', '310100', '上海市市辖区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('76', '310000', '上海市', '310200', '上海市辖县', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('77', '320000', '江苏省', '320100', '南京市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('78', '320000', '江苏省', '320200', '无锡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('79', '320000', '江苏省', '320300', '徐州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('80', '320000', '江苏省', '320400', '常州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('81', '320000', '江苏省', '320500', '苏州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('82', '320000', '江苏省', '320600', '南通市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('83', '320000', '江苏省', '320700', '连云港市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('84', '320000', '江苏省', '320800', '淮安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('85', '320000', '江苏省', '320900', '盐城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('86', '320000', '江苏省', '321000', '扬州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('87', '320000', '江苏省', '321100', '镇江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('88', '320000', '江苏省', '321200', '泰州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('89', '320000', '江苏省', '321300', '宿迁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('90', '330000', '浙江省', '330100', '杭州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('91', '330000', '浙江省', '330200', '宁波市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('92', '330000', '浙江省', '330300', '温州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('93', '330000', '浙江省', '330400', '嘉兴市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('94', '330000', '浙江省', '330500', '湖州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('95', '330000', '浙江省', '330600', '绍兴市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('96', '330000', '浙江省', '330700', '金华市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('97', '330000', '浙江省', '330800', '衢州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('98', '330000', '浙江省', '330900', '舟山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('99', '330000', '浙江省', '331000', '台州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('100', '330000', '浙江省', '331100', '丽水市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('101', '340000', '安徽省', '340100', '合肥市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('102', '340000', '安徽省', '340200', '芜湖市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('103', '340000', '安徽省', '340300', '蚌埠市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('104', '340000', '安徽省', '340400', '淮南市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('105', '340000', '安徽省', '340500', '马鞍山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('106', '340000', '安徽省', '340600', '淮北市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('107', '340000', '安徽省', '340700', '铜陵市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('108', '340000', '安徽省', '340800', '安庆市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('109', '340000', '安徽省', '341000', '黄山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('110', '340000', '安徽省', '341100', '滁州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('111', '340000', '安徽省', '341200', '阜阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('112', '340000', '安徽省', '341300', '宿州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('113', '340000', '安徽省', '341400', '巢湖市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('114', '340000', '安徽省', '341500', '六安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('115', '340000', '安徽省', '341600', '亳州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('116', '340000', '安徽省', '341700', '池州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('117', '340000', '安徽省', '341800', '宣城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('118', '350000', '福建省', '350100', '福州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('119', '350000', '福建省', '350200', '厦门市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('120', '350000', '福建省', '350300', '莆田市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('121', '350000', '福建省', '350400', '三明市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('122', '350000', '福建省', '350500', '泉州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('123', '350000', '福建省', '350600', '漳州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('124', '350000', '福建省', '350700', '南平市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('125', '350000', '福建省', '350800', '龙岩市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('126', '350000', '福建省', '350900', '宁德市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('127', '360000', '江西省', '360100', '南昌市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('128', '360000', '江西省', '360200', '景德镇市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('129', '360000', '江西省', '360300', '萍乡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('130', '360000', '江西省', '360400', '九江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('131', '360000', '江西省', '360500', '新余市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('132', '360000', '江西省', '360600', '鹰潭市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('133', '360000', '江西省', '360700', '赣州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('134', '360000', '江西省', '360800', '吉安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('135', '360000', '江西省', '360900', '宜春市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('136', '360000', '江西省', '361000', '抚州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('137', '360000', '江西省', '361100', '上饶市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('138', '370000', '山东省', '370100', '济南市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('139', '370000', '山东省', '370200', '青岛市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('140', '370000', '山东省', '370300', '淄博市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('141', '370000', '山东省', '370400', '枣庄市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('142', '370000', '山东省', '370500', '东营市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('143', '370000', '山东省', '370600', '烟台市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('144', '370000', '山东省', '370700', '潍坊市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('145', '370000', '山东省', '370800', '济宁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('146', '370000', '山东省', '370900', '泰安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('147', '370000', '山东省', '371000', '威海市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('148', '370000', '山东省', '371100', '日照市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('149', '370000', '山东省', '371200', '莱芜市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('150', '370000', '山东省', '371300', '临沂市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('151', '370000', '山东省', '371400', '德州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('152', '370000', '山东省', '371500', '聊城市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('153', '370000', '山东省', '371600', '滨州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('154', '370000', '山东省', '371700', '菏泽市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('155', '410000', '河南省', '410100', '郑州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('156', '410000', '河南省', '410200', '开封市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('157', '410000', '河南省', '410300', '洛阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('158', '410000', '河南省', '410400', '平顶山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('159', '410000', '河南省', '410500', '安阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('160', '410000', '河南省', '410600', '鹤壁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('161', '410000', '河南省', '410700', '新乡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('162', '410000', '河南省', '410800', '焦作市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('163', '410000', '河南省', '410900', '濮阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('164', '410000', '河南省', '411000', '许昌市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('165', '410000', '河南省', '411100', '漯河市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('166', '410000', '河南省', '411200', '三门峡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('167', '410000', '河南省', '411300', '南阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('168', '410000', '河南省', '411400', '商丘市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('169', '410000', '河南省', '411500', '信阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('170', '410000', '河南省', '411600', '周口市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('171', '410000', '河南省', '411700', '驻马店市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('172', '420000', '湖北省', '420100', '武汉市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('173', '420000', '湖北省', '420200', '黄石市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('174', '420000', '湖北省', '420300', '十堰市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('175', '420000', '湖北省', '420500', '宜昌市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('176', '420000', '湖北省', '420600', '襄樊市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('177', '420000', '湖北省', '420700', '鄂州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('178', '420000', '湖北省', '420800', '荆门市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('179', '420000', '湖北省', '420900', '孝感市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('180', '420000', '湖北省', '421000', '荆州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('181', '420000', '湖北省', '421100', '黄冈市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('182', '420000', '湖北省', '421200', '咸宁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('183', '420000', '湖北省', '421300', '随州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('184', '420000', '湖北省', '422800', '恩施土家族苗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('185', '420000', '湖北省', '429000', '湖北省省直辖县级行政单位', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('186', '430000', '湖南省', '430100', '长沙市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('187', '430000', '湖南省', '430200', '株洲市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('188', '430000', '湖南省', '430300', '湘潭市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('189', '430000', '湖南省', '430400', '衡阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('190', '430000', '湖南省', '430500', '邵阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('191', '430000', '湖南省', '430600', '岳阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('192', '430000', '湖南省', '430700', '常德市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('193', '430000', '湖南省', '430800', '张家界市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('194', '430000', '湖南省', '430900', '益阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('195', '430000', '湖南省', '431000', '郴州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('196', '430000', '湖南省', '431100', '永州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('197', '430000', '湖南省', '431200', '怀化市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('198', '430000', '湖南省', '431300', '娄底市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('199', '430000', '湖南省', '433100', '湘西土家族苗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('200', '440000', '广东省', '440100', '广州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('201', '440000', '广东省', '440200', '韶关市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('202', '440000', '广东省', '440300', '深圳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('203', '440000', '广东省', '440400', '珠海市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('204', '440000', '广东省', '440500', '汕头市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('205', '440000', '广东省', '440600', '佛山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('206', '440000', '广东省', '440700', '江门市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('207', '440000', '广东省', '440800', '湛江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('208', '440000', '广东省', '440900', '茂名市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('209', '440000', '广东省', '441200', '肇庆市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('210', '440000', '广东省', '441300', '惠州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('211', '440000', '广东省', '441400', '梅州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('212', '440000', '广东省', '441500', '汕尾市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('213', '440000', '广东省', '441600', '河源市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('214', '440000', '广东省', '441700', '阳江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('215', '440000', '广东省', '441800', '清远市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('216', '440000', '广东省', '445100', '潮州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('217', '440000', '广东省', '445200', '揭阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('218', '440000', '广东省', '445300', '云浮市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('219', '450000', '广西壮族自治区', '450100', '广西南宁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('220', '450000', '广西壮族自治区', '450200', '广西柳州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('221', '450000', '广西壮族自治区', '450300', '广西桂林市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('222', '450000', '广西壮族自治区', '450400', '广西梧州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('223', '450000', '广西壮族自治区', '450500', '广西北海市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('224', '450000', '广西壮族自治区', '450600', '广西防城港市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('225', '450000', '广西壮族自治区', '450700', '广西钦州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('226', '450000', '广西壮族自治区', '450800', '广西贵港市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('227', '450000', '广西壮族自治区', '450900', '广西玉林市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('228', '450000', '广西壮族自治区', '451000', '广西百色市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('229', '450000', '广西壮族自治区', '451100', '广西贺州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('230', '450000', '广西壮族自治区', '451200', '广西河池市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('231', '450000', '广西壮族自治区', '451300', '广西来宾市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('232', '450000', '广西壮族自治区', '451400', '广西崇左市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('233', '460000', '海南省', '460100', '海口市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('234', '460000', '海南省', '469000', '海南省省直辖县级行政单位', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('235', '500000', '重庆市', '500100', '重庆市市辖区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('236', '500000', '重庆市', '500200', '重庆市辖县', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('237', '510000', '四川省', '510100', '成都市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('238', '510000', '四川省', '510300', '自贡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('239', '510000', '四川省', '510400', '攀枝花市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('240', '510000', '四川省', '510500', '泸州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('241', '510000', '四川省', '510600', '德阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('242', '510000', '四川省', '510700', '绵阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('243', '510000', '四川省', '510800', '广元市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('244', '510000', '四川省', '510900', '遂宁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('245', '510000', '四川省', '511000', '内江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('246', '510000', '四川省', '511100', '乐山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('247', '510000', '四川省', '511300', '南充市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('248', '510000', '四川省', '511400', '眉山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('249', '510000', '四川省', '511500', '宜宾市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('250', '510000', '四川省', '511600', '广安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('251', '510000', '四川省', '511700', '达州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('252', '510000', '四川省', '511800', '雅安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('253', '510000', '四川省', '511900', '巴中市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('254', '510000', '四川省', '512000', '资阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('255', '510000', '四川省', '513200', '阿坝藏族羌族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('256', '510000', '四川省', '513300', '甘孜藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('257', '510000', '四川省', '513400', '凉山彝族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('258', '520000', '贵州省', '520100', '贵阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('259', '520000', '贵州省', '520200', '六盘水市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('260', '520000', '贵州省', '520300', '遵义市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('261', '520000', '贵州省', '520400', '安顺市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('262', '520000', '贵州省', '522200', '铜仁地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('263', '520000', '贵州省', '522300', '黔西南布依族苗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('264', '520000', '贵州省', '522400', '毕节地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('265', '520000', '贵州省', '522600', '黔东南苗族侗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('266', '520000', '贵州省', '522700', '黔南布依族苗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('267', '530000', '云南省', '530100', '昆明市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('268', '530000', '云南省', '530300', '曲靖市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('269', '530000', '云南省', '530400', '玉溪市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('270', '530000', '云南省', '530500', '保山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('271', '530000', '云南省', '530600', '昭通市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('272', '530000', '云南省', '530700', '丽江市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('273', '530000', '云南省', '530800', '普洱市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('274', '530000', '云南省', '530900', '临沧市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('275', '530000', '云南省', '532300', '楚雄彝族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('276', '530000', '云南省', '532500', '红河哈尼族彝族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('277', '530000', '云南省', '532600', '文山壮族苗族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('278', '530000', '云南省', '532800', '西双版纳傣族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('279', '530000', '云南省', '532900', '大理白族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('280', '530000', '云南省', '533100', '德宏傣族景颇族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('281', '530000', '云南省', '533300', '怒江傈僳族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('282', '530000', '云南省', '533400', '迪庆藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('283', '540000', '西藏自治区', '540100', '西藏拉萨市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('284', '540000', '西藏自治区', '542100', '西藏昌都地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('285', '540000', '西藏自治区', '542200', '西藏山南地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('286', '540000', '西藏自治区', '542300', '西藏日喀则地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('287', '540000', '西藏自治区', '542400', '西藏那曲地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('288', '540000', '西藏自治区', '542500', '西藏阿里地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('289', '540000', '西藏自治区', '542600', '西藏林芝地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('290', '610000', '陕西省', '610100', '西安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('291', '610000', '陕西省', '610200', '铜川市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('292', '610000', '陕西省', '610300', '宝鸡市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('293', '610000', '陕西省', '610400', '咸阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('294', '610000', '陕西省', '610500', '渭南市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('295', '610000', '陕西省', '610600', '延安市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('296', '610000', '陕西省', '610700', '汉中市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('297', '610000', '陕西省', '610800', '榆林市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('298', '610000', '陕西省', '610900', '安康市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('299', '610000', '陕西省', '611000', '商洛市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('300', '620000', '甘肃省', '620100', '兰州市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('301', '620000', '甘肃省', '620300', '金昌市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('302', '620000', '甘肃省', '620400', '白银市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('303', '620000', '甘肃省', '620500', '天水市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('304', '620000', '甘肃省', '620600', '武威市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('305', '620000', '甘肃省', '620700', '张掖市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('306', '620000', '甘肃省', '620800', '平凉市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('307', '620000', '甘肃省', '620900', '酒泉市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('308', '620000', '甘肃省', '621000', '庆阳市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('309', '620000', '甘肃省', '621100', '定西市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('310', '620000', '甘肃省', '621200', '陇南市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('311', '620000', '甘肃省', '622900', '临夏回族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('312', '620000', '甘肃省', '623000', '甘南藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('313', '630000', '青海省', '630100', '西宁市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('314', '630000', '青海省', '632100', '海东地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('315', '630000', '青海省', '632200', '海北藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('316', '630000', '青海省', '632300', '黄南藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('317', '630000', '青海省', '632500', '海南藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('318', '630000', '青海省', '632600', '果洛藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('319', '630000', '青海省', '632700', '玉树藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('320', '630000', '青海省', '632800', '海西蒙古族藏族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('321', '640000', '宁夏回族自治区', '640100', '宁夏银川市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('322', '640000', '宁夏回族自治区', '640200', '宁夏石嘴山市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('323', '640000', '宁夏回族自治区', '640300', '宁夏吴忠市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('324', '640000', '宁夏回族自治区', '640400', '宁夏固原市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('325', '640000', '宁夏回族自治区', '640500', '宁夏中卫市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('326', '650000', '新疆维吾尔自治区', '650100', '新疆乌鲁木齐市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('327', '650000', '新疆维吾尔自治区', '650200', '新疆克拉玛依市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('328', '650000', '新疆维吾尔自治区', '652100', '新疆吐鲁番地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('329', '650000', '新疆维吾尔自治区', '652200', '新疆哈密地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('330', '650000', '新疆维吾尔自治区', '652300', '新疆昌吉回族自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('331', '650000', '新疆维吾尔自治区', '652700', '新疆博尔塔拉蒙古自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('332', '650000', '新疆维吾尔自治区', '652800', '新疆巴音郭楞蒙古自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('333', '650000', '新疆维吾尔自治区', '652900', '新疆阿克苏地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('334', '650000', '新疆维吾尔自治区', '653000', '新疆克孜勒苏柯尔克孜自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('335', '650000', '新疆维吾尔自治区', '653100', '新疆喀什地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('336', '650000', '新疆维吾尔自治区', '653200', '新疆和田地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('337', '650000', '新疆维吾尔自治区', '654000', '新疆伊犁哈萨克自治州', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('338', '650000', '新疆维吾尔自治区', '654200', '新疆塔城地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('339', '650000', '新疆维吾尔自治区', '654300', '新疆阿勒泰地区', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('340', '650000', '新疆维吾尔自治区', '659000', '新疆自治区直辖县级行政单位', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('341', '710000', '台湾省', '710100', '台北市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('342', '710000', '台湾省', '710200', '高雄市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('343', '710000', '台湾省', '710300', '台南市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('344', '710000', '台湾省', '710400', '台中市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('345', '710000', '台湾省', '710700', '基隆市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('346', '710000', '台湾省', '710800', '新竹市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('347', '710000', '台湾省', '710900', '嘉义市', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('348', '810000', '香港特别行政区', '810100', '香港岛', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('349', '810000', '香港特别行政区', '810200', '九龙', null, null, null, null, now(), now());
INSERT INTO `city_info` VALUES ('350', '810000', '香港特别行政区', '810300', '新界', null, null, null, null, now(), now());









