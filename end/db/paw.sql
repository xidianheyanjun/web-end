/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : paw

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-10-23 15:42:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bank
-- ----------------------------
DROP TABLE IF EXISTS `t_bank`;
CREATE TABLE `t_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(127) DEFAULT NULL COMMENT '银行编码',
  `name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '银行图标',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='银行信息表';

-- ----------------------------
-- Records of t_bank
-- ----------------------------
INSERT INTO `t_bank` VALUES ('1', 'zhaoshang', '招商银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('2', 'jianshe', '建设银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('3', 'minsheng', '民生银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('4', 'nongye', '农业银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('5', 'huaxia', '华夏银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('6', 'shanghai', '上海银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('7', 'zhongguo', '中国银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('8', 'ningbo', '宁波银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('9', 'zheshang', '浙商银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_bank` VALUES ('10', 'nongshang', '农商银行', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_card_level
-- ----------------------------
DROP TABLE IF EXISTS `t_card_level`;
CREATE TABLE `t_card_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '银行卡等级',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='信用卡等级表';

-- ----------------------------
-- Records of t_card_level
-- ----------------------------
INSERT INTO `t_card_level` VALUES ('1', '等级1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('2', '等级2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('3', '等级3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('4', '等级4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('5', '等级5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('6', '等级6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('7', '等级7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_card_level` VALUES ('8', '等级8', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_code_loan
-- ----------------------------
DROP TABLE IF EXISTS `t_code_loan`;
CREATE TABLE `t_code_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `loan_kind` varchar(128) DEFAULT NULL COMMENT 'company:企业, personal:个人',
  `icon` varchar(256) DEFAULT NULL COMMENT '贷款类型图标',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='贷款形式表';

-- ----------------------------
-- Records of t_code_loan
-- ----------------------------
INSERT INTO `t_code_loan` VALUES ('1', '贷款形式1', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('2', '贷款形式2', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('3', '贷款形式3', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('4', '贷款形式4', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('5', '贷款形式5', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('6', '贷款形式6', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('7', '贷款形式7', 'company', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('8', '贷款形式8', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('9', '贷款形式9', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('10', '贷款形式10', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('11', '贷款形式11', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('12', '贷款形式12', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('13', '贷款形式13', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('14', '贷款形式14', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('15', '贷款形式15', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_code_loan` VALUES ('16', '贷款形式16', 'personal', 'http://119.23.41.237:8180/front/static/images/bank.png', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：启用\r\n            1：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', 'imageStartUrl', '应用启动闪屏', 'http://119.23.41.237:8180/end/image/hawk.png', '2017-10-23 15:41:53', null, '0');

-- ----------------------------
-- Table structure for t_coupon_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_kind`;
CREATE TABLE `t_coupon_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL COMMENT '优惠券类型名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '优惠券图标',
  `position` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信用卡分类表';

-- ----------------------------
-- Records of t_coupon_kind
-- ----------------------------
INSERT INTO `t_coupon_kind` VALUES ('1', '美食', 'http://119.23.41.237:8180/front/static/images/bank.png', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_coupon_kind` VALUES ('2', '电影', 'http://119.23.41.237:8180/front/static/images/bank.png', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_coupon_kind` VALUES ('3', '酒店', 'http://119.23.41.237:8180/front/static/images/bank.png', '1', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_credit_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_activity`;
CREATE TABLE `t_credit_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `activity_kind` varchar(127) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信用卡优惠活动表';

-- ----------------------------
-- Records of t_credit_activity
-- ----------------------------

-- ----------------------------
-- Table structure for t_credit_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_apply`;
CREATE TABLE `t_credit_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL COMMENT '信用卡标识',
  `user_name` varchar(127) DEFAULT NULL COMMENT '用户名称',
  `card_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `card_expire` datetime DEFAULT NULL COMMENT '证件到期日期',
  `card_office` varchar(255) DEFAULT NULL COMMENT '',
  `belong_city` varchar(16) DEFAULT NULL COMMENT '所属城市',
  `edu` varchar(16) DEFAULT NULL COMMENT '教育程度',
  `marriage` varchar(16) DEFAULT NULL COMMENT '婚姻状况',
  `mobile` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `house` varchar(32) DEFAULT NULL,
  `address` varchar(127) DEFAULT NULL,
  `zip_code` varchar(7) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `emp_name` varchar(127) DEFAULT NULL,
  `work_age` varchar(32) DEFAULT NULL,
  `annual_salary` varchar(32) DEFAULT NULL,
  `emp_industry` varchar(127) DEFAULT NULL,
  `emp_address` varchar(255) DEFAULT NULL,
  `emp_zip_code` varchar(7) DEFAULT NULL,
  `emp_phone` varchar(32) DEFAULT NULL,
  `emp_phone_ext` varchar(15) DEFAULT NULL,
  `emp_kind` varchar(32) DEFAULT NULL,
  `emp_position` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信用卡申请表';

-- ----------------------------
-- Records of t_credit_apply
-- ----------------------------

-- ----------------------------
-- Table structure for t_credit_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_banner`;
CREATE TABLE `t_credit_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信用卡banner表';

-- ----------------------------
-- Records of t_credit_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_credit_card
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_card`;
CREATE TABLE `t_credit_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL COMMENT '银行标识',
  `work_kind` varchar(127) DEFAULT NULL COMMENT '工作性质',
  `month_income` varchar(127) DEFAULT NULL COMMENT '月收入,单位万元',
  `type_use_id` int(11) DEFAULT NULL COMMENT '',
  `card_level_id` int(11) DEFAULT NULL COMMENT '银行卡等级标识',
  `funds` int(11) DEFAULT NULL COMMENT '收益',
  `name` varchar(127) DEFAULT NULL COMMENT '信用卡名称',
  `info` varchar(127) DEFAULT NULL COMMENT '描述',
  `image` varchar(255) DEFAULT NULL COMMENT '信用卡图标',
  `product_desc` varchar(255) DEFAULT NULL COMMENT '产品说明',
  `type_use` tinyint(4) DEFAULT NULL COMMENT '0：非用途卡,1：用途卡',
  `type_hot` tinyint(4) DEFAULT NULL COMMENT '0：非热卡,1：热卡',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credit_card
-- ----------------------------
INSERT INTO `t_credit_card` VALUES ('1', '1', 'kind1', '5-10', '100000', '1', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡1说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('2', '1', 'kind2', '5-10', '110000', '1', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡2说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('3', '1', 'kind3', '5-10', '120000', '2', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡3说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('4', '1', 'kind4', '5-10', '130000', '3', '1', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡4说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('5', '1', 'kind5', '5-10', '140000', '2', '1', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡5说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('6', '1', 'kind6', '5-10', '150000', '1', '1', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡6说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('7', '1', 'kind7', '5-10', '160000', '3', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡7说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('8', '1', 'kind8', '5-10', '170000', '3', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡8说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('9', '1', 'kind9', '5-10', '180000', '3', '1', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡9说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('10', '1', 'kind10', '5-10', '1900000', '1', '2', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡10说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_card` VALUES ('11', '1', 'kind11', '5-10', '200000', '1', '1', '招商信用卡', '给高颜值的你', 'http://119.23.41.237:8180/front/static/images/credit.jpg', '招商信用卡铂金卡11说明', '1', '1', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_credit_coupon
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_coupon`;
CREATE TABLE `t_credit_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL COMMENT '银行标识',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动标识',
  `name` varchar(127) DEFAULT NULL COMMENT '优惠券名称',
  `home_kind` varchar(31) DEFAULT NULL COMMENT '类型分组,coupons表示优惠券分组,markets表示超市分组',
  `info` varchar(127) DEFAULT NULL COMMENT '简介',
  `txt` varchar(255) DEFAULT NULL COMMENT '描述',
  `image` varchar(255) DEFAULT NULL COMMENT '优惠券图标',
  `belong_kind_id` int(11) DEFAULT NULL COMMENT '所属分类表示',
  `popular_star` int(11) DEFAULT NULL COMMENT '热门星数',
  `coupon_desc` varchar(255) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='信用卡优惠券表';

-- ----------------------------
-- Records of t_credit_coupon
-- ----------------------------
INSERT INTO `t_credit_coupon` VALUES ('1', '1', null, '麦当劳', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('2', '1', null, '麦当劳1', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '2', '4', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('3', '2', null, '麦当劳2', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '2', '4', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('4', '3', null, '麦当劳3', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '3', '5', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('5', '1', null, '麦当劳4', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('6', '1', null, '麦当劳5', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '2', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('7', '3', null, '麦当劳6', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '3', '1', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('8', '3', null, '麦当劳7', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('9', '2', null, '麦当劳8', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '2', '1', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('10', '1', null, '麦当劳9', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('11', '2', null, '麦当劳0', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '2', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('12', '1', null, '麦当劳10', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '2', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('13', '2', null, '麦当劳11', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '4', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('14', '1', null, '麦当劳12', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('15', '3', null, '麦当劳13', 'coupons', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '3', '5', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_credit_coupon` VALUES ('16', '1', null, '麦当劳14', 'markets', '巨无霸小巨人', '九江市快乐城4楼', 'http://119.23.41.237:8180/front/static/images/sun.jpg', '1', '3', '活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_credit_query
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_query`;
CREATE TABLE `t_credit_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stype` tinyint(4) DEFAULT NULL COMMENT '1:个人,2:企业',
  `user_name` varchar(256) DEFAULT NULL,
  `card_id` varchar(32) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='征信信息表';

-- ----------------------------
-- Records of t_credit_query
-- ----------------------------

-- ----------------------------
-- Table structure for t_data_info
-- ----------------------------
DROP TABLE IF EXISTS `t_data_info`;
CREATE TABLE `t_data_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_name` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `belong_type` tinyint(4) DEFAULT NULL COMMENT '0：个人\r\n            1：企业',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='大数据风控信息表';

-- ----------------------------
-- Records of t_data_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_finance`;
CREATE TABLE `t_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL COMMENT '银行标识',
  `name` varchar(127) DEFAULT NULL COMMENT '名称',
  `purchase_condition` varchar(255) DEFAULT NULL COMMENT '条件',
  `purchase_period` int(11) DEFAULT NULL COMMENT '购买期限,单位天',
  `purchase_point` int(11) DEFAULT NULL COMMENT '购买起点',
  `purchase_phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `income_rate` int(11) DEFAULT NULL COMMENT '收益率',
  `num` int(11) DEFAULT NULL COMMENT '进度',
  `tag` varchar(32) DEFAULT NULL COMMENT '标签',
  `product_desc` varchar(255) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='理财产品表';

-- ----------------------------
-- Records of t_finance
-- ----------------------------
INSERT INTO `t_finance` VALUES ('1', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '87', '6', '13974680000', '1', '34', '人气', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('2', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '1', '6', '13974680000', '3', '13', '', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('3', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '234', '6', '13974680000', '3', '45', '推荐', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('4', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '534', '6', '13974680000', '8', '56', '人气', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('5', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '43', '6', '13974680000', '9', '23', '推荐', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('6', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '67', '6', '13974680000', '13', '32', '人气', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('7', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '8', '6', '13974680000', '34', '33', '', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('8', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '567', '6', '13974680000', '23', '30', '推荐', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('9', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '456', '6', '13974680000', '32', '1', '', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_finance` VALUES ('10', '1', '江西银行优盛理财财-创鑫16366A', '条件1', '76', '6', '13974680000', '23', '89', '人气', '产品简介1', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_finance_popular
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_popular`;
CREATE TABLE `t_finance_popular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_id` int(11) DEFAULT NULL,
  `popular_type` varchar(4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热销及推荐产品，用于运营配置';

-- ----------------------------
-- Records of t_finance_popular
-- ----------------------------

-- ----------------------------
-- Table structure for t_forum
-- ----------------------------
DROP TABLE IF EXISTS `t_forum`;
CREATE TABLE `t_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='金融论坛表';

-- ----------------------------
-- Records of t_forum
-- ----------------------------
INSERT INTO `t_forum` VALUES ('1', 't_forum测试标题1', 't_forum测试的内容1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('2', 't_forum测试标题2', 't_forum测试的内容2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('3', 't_forum测试标题3', 't_forum测试的内容3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('4', 't_forum测试标题4', 't_forum测试的内容4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('5', 't_forum测试标题5', 't_forum测试的内容5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('6', 't_forum测试标题6', 't_forum测试的内容6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('7', 't_forum测试标题7', 't_forum测试的内容7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('8', 't_forum测试标题8', 't_forum测试的内容8', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('9', 't_forum测试标题9', 't_forum测试的内容9', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('10', 't_forum测试标题10', 't_forum测试的内容10', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_forum` VALUES ('11', 't_forum测试标题11', 't_forum测试的内容11', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_forum_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_forum_msg`;
CREATE TABLE `t_forum_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金融论坛留言表';

-- ----------------------------
-- Records of t_forum_msg
-- ----------------------------

-- ----------------------------
-- Table structure for t_gb
-- ----------------------------
DROP TABLE IF EXISTS `t_gb`;
CREATE TABLE `t_gb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政银信息表';

-- ----------------------------
-- Records of t_gb
-- ----------------------------
INSERT INTO `t_gb` VALUES ('1', 't_gb测试标题1', 't_gb测试的内容1', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('2', 't_gb测试标题2', 't_gb测试的内容2', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('3', 't_gb测试标题3', 't_gb测试的内容3', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('4', 't_gb测试标题4', 't_gb测试的内容4', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('5', 't_gb测试标题5', 't_gb测试的内容5', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('6', 't_gb测试标题6', 't_gb测试的内容6', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('7', 't_gb测试标题7', 't_gb测试的内容7', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('8', 't_gb测试标题8', 't_gb测试的内容8', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('9', 't_gb测试标题9', 't_gb测试的内容9', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('10', 't_gb测试标题10', 't_gb测试的内容10', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb` VALUES ('11', 't_gb测试标题11', 't_gb测试的内容11', '2017-09-20 10:06:12', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_gb_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_gb_banner`;
CREATE TABLE `t_gb_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政银信息banner';

-- ----------------------------
-- Records of t_gb_banner
-- ----------------------------
INSERT INTO `t_gb_banner` VALUES ('1', 't_gb_banner测试标题1', 'http://119.23.41.237:8180/end/image/hawk.png', '1', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('2', 't_gb_banner测试标题2', 'http://119.23.41.237:8180/end/image/hawk.png', '2', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('3', 't_gb_banner测试标题3', 'http://119.23.41.237:8180/end/image/hawk.png', '3', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('4', 't_gb_banner测试标题4', 'http://119.23.41.237:8180/end/image/hawk.png', '4', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('5', 't_gb_banner测试标题5', 'http://119.23.41.237:8180/end/image/hawk.png', '5', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('6', 't_gb_banner测试标题6', 'http://119.23.41.237:8180/end/image/hawk.png', '6', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('7', 't_gb_banner测试标题7', 'http://119.23.41.237:8180/end/image/hawk.png', '7', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('8', 't_gb_banner测试标题8', 'http://119.23.41.237:8180/end/image/hawk.png', '8', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('9', 't_gb_banner测试标题9', 'http://119.23.41.237:8180/end/image/hawk.png', '9', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('10', 't_gb_banner测试标题10', 'http://119.23.41.237:8180/end/image/hawk.png', '10', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_banner` VALUES ('11', 't_gb_banner测试标题11', 'http://119.23.41.237:8180/end/image/hawk.png', '11', '2017-09-20 10:06:12', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_gb_chat
-- ----------------------------
DROP TABLE IF EXISTS `t_gb_chat`;
CREATE TABLE `t_gb_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政银信息群聊表';

-- ----------------------------
-- Records of t_gb_chat
-- ----------------------------
INSERT INTO `t_gb_chat` VALUES ('1', 't_gb_chat测试标题1', 't_gb_chat测试的内容1', '2017-09-20 10:06:12', '1', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('2', 't_gb_chat测试标题2', 't_gb_chat测试的内容2', '2017-09-20 10:06:12', '1', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('3', 't_gb_chat测试标题3', 't_gb_chat测试的内容3', '2017-09-20 10:06:12', '2', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('4', 't_gb_chat测试标题4', 't_gb_chat测试的内容4', '2017-09-20 10:06:12', '3', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('5', 't_gb_chat测试标题5', 't_gb_chat测试的内容5', '2017-09-20 10:06:12', '2', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('6', 't_gb_chat测试标题6', 't_gb_chat测试的内容6', '2017-09-20 10:06:12', '2', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('7', 't_gb_chat测试标题7', 't_gb_chat测试的内容7', '2017-09-20 10:06:12', '3', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('8', 't_gb_chat测试标题8', 't_gb_chat测试的内容8', '2017-09-20 10:06:12', '3', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('9', 't_gb_chat测试标题9', 't_gb_chat测试的内容9', '2017-09-20 10:06:12', '1', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('10', 't_gb_chat测试标题10', 't_gb_chat测试的内容10', '2017-09-20 10:06:12', '3', null, null, '0');
INSERT INTO `t_gb_chat` VALUES ('11', 't_gb_chat测试标题11', 't_gb_chat测试的内容11', '2017-09-20 10:06:12', '2', null, null, '0');

-- ----------------------------
-- Table structure for t_gb_swap
-- ----------------------------
DROP TABLE IF EXISTS `t_gb_swap`;
CREATE TABLE `t_gb_swap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政银论坛交流表';

-- ----------------------------
-- Records of t_gb_swap
-- ----------------------------
INSERT INTO `t_gb_swap` VALUES ('1', 't_gb_swap测试标题1', 't_gb_swap测试的内容1', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('2', 't_gb_swap测试标题2', 't_gb_swap测试的内容2', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('3', 't_gb_swap测试标题3', 't_gb_swap测试的内容3', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('4', 't_gb_swap测试标题4', 't_gb_swap测试的内容4', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('5', 't_gb_swap测试标题5', 't_gb_swap测试的内容5', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('6', 't_gb_swap测试标题6', 't_gb_swap测试的内容6', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('7', 't_gb_swap测试标题7', 't_gb_swap测试的内容7', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('8', 't_gb_swap测试标题8', 't_gb_swap测试的内容8', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('9', 't_gb_swap测试标题9', 't_gb_swap测试的内容9', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('10', 't_gb_swap测试标题10', 't_gb_swap测试的内容10', '2017-09-20 10:06:12', '0', null, null, '0');
INSERT INTO `t_gb_swap` VALUES ('11', 't_gb_swap测试标题11', 't_gb_swap测试的内容11', '2017-09-20 10:06:12', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_gb_swap_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_gb_swap_banner`;
CREATE TABLE `t_gb_swap_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政银信息交流banner';

-- ----------------------------
-- Records of t_gb_swap_banner
-- ----------------------------
INSERT INTO `t_gb_swap_banner` VALUES ('1', 't_gb_swap_banner测试标题1', 'http://119.23.41.237:8180/end/image/hawk.png', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('2', 't_gb_swap_banner测试标题2', 'http://119.23.41.237:8180/end/image/hawk.png', '2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('3', 't_gb_swap_banner测试标题3', 'http://119.23.41.237:8180/end/image/hawk.png', '3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('4', 't_gb_swap_banner测试标题4', 'http://119.23.41.237:8180/end/image/hawk.png', '4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('5', 't_gb_swap_banner测试标题5', 'http://119.23.41.237:8180/end/image/hawk.png', '5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('6', 't_gb_swap_banner测试标题6', 'http://119.23.41.237:8180/end/image/hawk.png', '6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('7', 't_gb_swap_banner测试标题7', 'http://119.23.41.237:8180/end/image/hawk.png', '7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('8', 't_gb_swap_banner测试标题8', 'http://119.23.41.237:8180/end/image/hawk.png', '8', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('9', 't_gb_swap_banner测试标题9', 'http://119.23.41.237:8180/end/image/hawk.png', '9', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('10', 't_gb_swap_banner测试标题10', 'http://119.23.41.237:8180/end/image/hawk.png', '10', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_banner` VALUES ('11', 't_gb_swap_banner测试标题11', 'http://119.23.41.237:8180/end/image/hawk.png', '11', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_gb_swap_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_gb_swap_detail`;
CREATE TABLE `t_gb_swap_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swap_id` int(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gb_swap_detail
-- ----------------------------
INSERT INTO `t_gb_swap_detail` VALUES ('1', '1', 't_gb_swap_detail测试的内容1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('2', '1', 't_gb_swap_detail测试的内容2', '2017-09-20 10:06:13', '1', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('3', '1', 't_gb_swap_detail测试的内容3', '2017-09-20 10:06:13', '1', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('4', '1', 't_gb_swap_detail测试的内容4', '2017-09-20 10:06:13', '1', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('5', '2', 't_gb_swap_detail测试的内容5', '2017-09-20 10:06:13', '1', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('6', '2', 't_gb_swap_detail测试的内容6', '2017-09-20 10:06:13', '2', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('7', '3', 't_gb_swap_detail测试的内容7', '2017-09-20 10:06:13', '3', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('8', '2', 't_gb_swap_detail测试的内容8', '2017-09-20 10:06:13', '3', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('9', '2', 't_gb_swap_detail测试的内容9', '2017-09-20 10:06:13', '2', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('10', '1', 't_gb_swap_detail测试的内容10', '2017-09-20 10:06:13', '2', null, null, '0');
INSERT INTO `t_gb_swap_detail` VALUES ('11', '1', 't_gb_swap_detail测试的内容11', '2017-09-20 10:06:13', '3', null, null, '0');

-- ----------------------------
-- Table structure for t_help
-- ----------------------------
DROP TABLE IF EXISTS `t_help`;
CREATE TABLE `t_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `flag` varchar(32) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='帮助与反馈表';

-- ----------------------------
-- Records of t_help
-- ----------------------------
INSERT INTO `t_help` VALUES ('1', '1', '帮助与反馈问题1标题', '帮助与反馈问题1内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('2', '1', '帮助与反馈问题2标题', '帮助与反馈问题2内容', '', '2', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('3', '1', '帮助与反馈问题3标题', '帮助与反馈问题3内容', 'hot', '3', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('4', '1', '帮助与反馈问题4标题', '帮助与反馈问题4内容', '', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('5', '1', '帮助与反馈问题5标题', '帮助与反馈问题5内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('6', '1', '帮助与反馈问题6标题', '帮助与反馈问题6内容', '', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('7', '1', '帮助与反馈问题7标题', '帮助与反馈问题7内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('8', '1', '帮助与反馈问题8标题', '帮助与反馈问题8内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('9', '1', '帮助与反馈问题9标题', '帮助与反馈问题9内容', '', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('10', '1', '帮助与反馈问题10标题', '帮助与反馈问题10内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('11', '1', '帮助与反馈问题11标题', '帮助与反馈问题11内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('12', '2', '帮助与反馈问题5标题', '帮助与反馈问题5内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('13', '3', '帮助与反馈问题6标题', '帮助与反馈问题6内容', '', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('14', '4', '帮助与反馈问题7标题', '帮助与反馈问题7内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('15', '5', '帮助与反馈问题8标题', '帮助与反馈问题8内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('16', '3', '帮助与反馈问题9标题', '帮助与反馈问题9内容', '', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('17', '5', '帮助与反馈问题10标题', '帮助与反馈问题10内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help` VALUES ('18', '9', '帮助与反馈问题11标题', '帮助与反馈问题11内容', 'hot', '1', '2017-09-20 10:06:14', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_help_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_help_kind`;
CREATE TABLE `t_help_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='帮助与反馈分类表';

-- ----------------------------
-- Records of t_help_kind
-- ----------------------------
INSERT INTO `t_help_kind` VALUES ('1', '帮助与反馈问题1', 'http://119.23.41.237:8180/front/static/images/bank.png', '1', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help_kind` VALUES ('2', '帮助与反馈问题1', 'http://119.23.41.237:8180/front/static/images/bank.png', '2', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help_kind` VALUES ('3', '帮助与反馈问题3', 'http://119.23.41.237:8180/front/static/images/bank.png', '3', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help_kind` VALUES ('4', '帮助与反馈问题4', 'http://119.23.41.237:8180/front/static/images/bank.png', '4', '2017-09-20 10:06:14', '0', null, null, '0');
INSERT INTO `t_help_kind` VALUES ('5', '帮助与反馈问题5', 'http://119.23.41.237:8180/front/static/images/bank.png', '5', '2017-09-20 10:06:14', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_hots
-- ----------------------------
DROP TABLE IF EXISTS `t_hots`;
CREATE TABLE `t_hots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) DEFAULT NULL COMMENT '分类标识',
  `name` varchar(255) DEFAULT NULL COMMENT '热点名称',
  `content` text COMMENT '热点内容',
  `position` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='热点表';

-- ----------------------------
-- Records of t_hots
-- ----------------------------
INSERT INTO `t_hots` VALUES ('1', '1', '最新信用卡资讯1', '最新信用卡资讯1内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('2', '1', '最新信用卡资讯2', '最新信用卡资讯2内容', '2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('3', '1', '最新信用卡资讯3', '最新信用卡资讯3内容', '3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('4', '1', '最热理财资讯1', '最热理财资讯1内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('5', '1', '最热理财资讯2', '最热理财资讯2内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('6', '1', '最热理财资讯3', '最热理财资讯3内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('7', '1', '最热理财资讯4', '最热理财资讯4内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('8', '1', '最新政策1', '最新政策1内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('9', '1', '最新政策2', '最新政策2内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('10', '1', '最新信用卡优惠1', '最新信用卡优惠1内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots` VALUES ('11', '1', '最新贷款政策1', '最新贷款政策1内容', '1', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_hots_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_hots_kind`;
CREATE TABLE `t_hots_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '热点分类名称',
  `position` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='热点分类表';

-- ----------------------------
-- Records of t_hots_kind
-- ----------------------------
INSERT INTO `t_hots_kind` VALUES ('1', '最新信用卡资讯', '1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots_kind` VALUES ('2', '最热理财资讯', '2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots_kind` VALUES ('3', '最新政策', '3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots_kind` VALUES ('4', '最新信用卡优惠', '4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_hots_kind` VALUES ('5', '最新贷款政策', '5', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_indentify_code
-- ----------------------------
DROP TABLE IF EXISTS `t_indentify_code`;
CREATE TABLE `t_indentify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc` varchar(32) DEFAULT NULL COMMENT '账号,手机号',
  `type` varchar(32) DEFAULT NULL COMMENT 'find:找回密码,register:注册',
  `code` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：未删除\r\n            1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='验证码表';

-- ----------------------------
-- Records of t_indentify_code
-- ----------------------------
INSERT INTO `t_indentify_code` VALUES ('1', '13692141127', 'register', '6775', '2017-10-13 16:35:10', null, '1');

-- ----------------------------
-- Table structure for t_industry
-- ----------------------------
DROP TABLE IF EXISTS `t_industry`;
CREATE TABLE `t_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='行业动态表';

-- ----------------------------
-- Records of t_industry
-- ----------------------------
INSERT INTO `t_industry` VALUES ('1', 't_industry测试标题1', 't_industry测试的内容1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('2', 't_industry测试标题2', 't_industry测试的内容2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('3', 't_industry测试标题3', 't_industry测试的内容3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('4', 't_industry测试标题4', 't_industry测试的内容4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('5', 't_industry测试标题5', 't_industry测试的内容5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('6', 't_industry测试标题6', 't_industry测试的内容6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('7', 't_industry测试标题7', 't_industry测试的内容7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('8', 't_industry测试标题8', 't_industry测试的内容8', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('9', 't_industry测试标题9', 't_industry测试的内容9', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('10', 't_industry测试标题10', 't_industry测试的内容10', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_industry` VALUES ('11', 't_industry测试标题11', 't_industry测试的内容11', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_industry_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_industry_banner`;
CREATE TABLE `t_industry_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业动态banner';

-- ----------------------------
-- Records of t_industry_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_loan_product
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_product`;
CREATE TABLE `t_loan_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL COMMENT '贷款产品名称',
  `icon` varchar(256) DEFAULT NULL COMMENT '图标地址',
  `com_kind` varchar(64) DEFAULT NULL COMMENT '',
  `register_funds` int(11) DEFAULT NULL,
  `loan_funds` int(11) DEFAULT NULL,
  `loan_kind_id` int(11) DEFAULT NULL COMMENT '贷款分类表示',
  `loan_deadline` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL COMMENT '银行标识',
  `loan_desc` text COMMENT '说明',
  `loan_condition` text COMMENT '条件',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='贷款产品表';

-- ----------------------------
-- Records of t_loan_product
-- ----------------------------
INSERT INTO `t_loan_product` VALUES ('1', 'loan_product_1', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '1', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('2', 'loan_product_2', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '1', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('3', 'loan_product_3', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '1', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('4', 'loan_product_4', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '2', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('5', 'loan_product_5', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '2', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('6', 'loan_product_6', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '2', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('7', 'loan_product_7', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '3', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('8', 'loan_product_8', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '8', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('9', 'loan_product_9', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '8', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('10', 'loan_product_10', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '8', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('11', 'loan_product_11', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '9', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('12', 'loan_product_12', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '9', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_loan_product` VALUES ('13', 'loan_product_13', 'http://119.23.41.237:8180/front/static/images/bank.png', null, null, null, '10', null, '1', '贷款产品详细介绍', null, '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_login
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：可用\r\n            1：不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登录记录表';

-- ----------------------------
-- Records of t_login
-- ----------------------------
INSERT INTO `t_login` VALUES ('1', '4', 'cb040d43450593b1631574e571e48ddf', '2017-10-13 16:35:32', '0');

-- ----------------------------
-- Table structure for t_my_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_my_finance`;
CREATE TABLE `t_my_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `finance_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的理财';

-- ----------------------------
-- Records of t_my_finance
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='理财轮播表';

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '[快银通推送]江西银行高资产净值客户理财产品火热发售', '#/info/policy/1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_notice` VALUES ('2', '[快银通推送]浦发银行信用卡新开户好礼相送', '#/info/policy/1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_notice` VALUES ('3', '[快银通推送]赣州银行xx区开张迎宾贺大礼', '#/info/policy/1', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_policy
-- ----------------------------
DROP TABLE IF EXISTS `t_policy`;
CREATE TABLE `t_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='政策表';

-- ----------------------------
-- Records of t_policy
-- ----------------------------
INSERT INTO `t_policy` VALUES ('1', 't_policy测试标题1', 't_policy测试的内容1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('2', 't_policy测试标题2', 't_policy测试的内容2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('3', 't_policy测试标题3', 't_policy测试的内容3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('4', 't_policy测试标题4', 't_policy测试的内容4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('5', 't_policy测试标题5', 't_policy测试的内容5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('6', 't_policy测试标题6', 't_policy测试的内容6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('7', 't_policy测试标题7', 't_policy测试的内容7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('8', 't_policy测试标题8', 't_policy测试的内容8', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('9', 't_policy测试标题9', 't_policy测试的内容9', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('10', 't_policy测试标题10', 't_policy测试的内容10', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_policy` VALUES ('11', 't_policy测试标题11', 't_policy测试的内容11', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_policy_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_policy_banner`;
CREATE TABLE `t_policy_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='政策宣传banner';

-- ----------------------------
-- Records of t_policy_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_store
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `kind` varchar(16) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：已收藏\r\n            1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';

-- ----------------------------
-- Records of t_store
-- ----------------------------

-- ----------------------------
-- Table structure for t_type_use
-- ----------------------------
DROP TABLE IF EXISTS `t_type_use`;
CREATE TABLE `t_type_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '信用卡用途名称',
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：生效\r\n            1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='信用卡用途表';

-- ----------------------------
-- Records of t_type_use
-- ----------------------------
INSERT INTO `t_type_use` VALUES ('1', '用途1', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('2', '用途2', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('3', '用途3', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('4', '用途4', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('5', '用途5', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('6', '用途6', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('7', '用途7', '2017-09-20 10:06:13', '0', null, null, '0');
INSERT INTO `t_type_use` VALUES ('8', '用途8', '2017-09-20 10:06:13', '0', null, null, '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc` varchar(32) DEFAULT NULL,
  `psw` varchar(64) DEFAULT NULL COMMENT '密码,经过password函数加密储存',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0：未删除\r\n            1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '13974680000', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2017-09-20 10:06:12', null, '0');
INSERT INTO `t_user` VALUES ('2', '13974680001', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2017-09-20 10:06:12', null, '0');
INSERT INTO `t_user` VALUES ('3', '13974680002', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2017-09-20 10:06:12', null, '0');
INSERT INTO `t_user` VALUES ('4', '13692141127', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2017-10-13 16:35:24', null, '0');

-- ----------------------------
-- Table structure for t_zx
-- ----------------------------
DROP TABLE IF EXISTS `t_zx`;
CREATE TABLE `t_zx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `idNo` varchar(32) DEFAULT NULL,
  `idType` varchar(16) DEFAULT NULL,
  `loginName` varchar(32) DEFAULT NULL,
  `passWord` varchar(32) DEFAULT NULL,
  `mobileTel` varchar(32) DEFAULT NULL,
  `tcId` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `report` text,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='京东万象征信信息表';

-- ----------------------------
-- Records of t_zx
-- ----------------------------
