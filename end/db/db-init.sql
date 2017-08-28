/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/6/22 星期四 下午 11:41:33                    */
/*==============================================================*/


DROP TABLE IF EXISTS t_bank;

DROP TABLE IF EXISTS t_config;

DROP TABLE IF EXISTS t_credit_activity;

DROP TABLE IF EXISTS t_credit_apply;

DROP TABLE IF EXISTS t_type_use;

DROP TABLE IF EXISTS t_card_level;

DROP TABLE IF EXISTS t_credit_card;

DROP TABLE IF EXISTS t_credit_banner;

DROP TABLE IF EXISTS t_credit_query;

DROP TABLE IF EXISTS t_credit_coupon;

DROP TABLE IF EXISTS t_coupon_kind;

DROP TABLE IF EXISTS t_data_info;

DROP TABLE IF EXISTS t_finance;

DROP TABLE IF EXISTS t_finance_popular;

DROP TABLE IF EXISTS t_notice;

DROP TABLE IF EXISTS t_forum;

DROP TABLE IF EXISTS t_forum_msg;

DROP TABLE IF EXISTS t_gb;

DROP TABLE IF EXISTS t_gb_banner;

DROP TABLE IF EXISTS t_gb_swap;

DROP TABLE IF EXISTS t_gb_chat;

DROP TABLE IF EXISTS t_gb_swap_detail;

DROP TABLE IF EXISTS t_gb_swap_banner;

DROP TABLE IF EXISTS t_industry;

DROP TABLE IF EXISTS t_industry_banner;

DROP TABLE IF EXISTS t_code_loan;

DROP TABLE IF EXISTS t_loan_product;

DROP TABLE IF EXISTS t_login;

DROP TABLE IF EXISTS t_my_finance;

DROP TABLE IF EXISTS t_policy;

DROP TABLE IF EXISTS t_policy_banner;

DROP TABLE IF EXISTS t_store;

DROP TABLE IF EXISTS t_user;

DROP TABLE IF EXISTS t_indentify_code;

DROP TABLE IF EXISTS t_hots_kind;

DROP TABLE IF EXISTS t_hots;

/*==============================================================*/
/* Table: t_bank                                                */
/*==============================================================*/
CREATE TABLE t_bank
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  code        VARCHAR(127),
  name        VARCHAR(255),
  icon        VARCHAR(255),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_bank
  COMMENT '银行信息表';

/*==============================================================*/
/* Table: t_config                                              */
/*==============================================================*/
CREATE TABLE t_config
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  code        VARCHAR(32),
  name        VARCHAR(127),
  val         VARCHAR(255),
  create_time DATETIME,
  update_time DATETIME,
  status      TINYINT(4) COMMENT '0：启用
            1：禁用',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_config
  COMMENT '系统配置表';

/*==============================================================*/
/* Table: t_credit_activity                                     */
/*==============================================================*/
CREATE TABLE t_credit_activity
(
  id            INTEGER NOT NULL AUTO_INCREMENT,
  name          VARCHAR(127),
  activity_kind VARCHAR(127),
  create_time   DATETIME,
  create_user   INTEGER,
  update_time   DATETIME,
  update_user   INTEGER,
  status        TINYINT(4),
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_credit_activity
  COMMENT '信用卡优惠活动表';

/*==============================================================*/
/* Table: t_credit_apply                                        */
/*==============================================================*/
CREATE TABLE t_credit_apply
(
  id            INTEGER NOT NULL AUTO_INCREMENT,
  card_id       INTEGER,
  user_name     VARCHAR(127),
  card_no       VARCHAR(32),
  card_expire   DATETIME,
  card_office   VARCHAR(255),
  belong_city   VARCHAR(16),
  edu           VARCHAR(16),
  marriage      VARCHAR(16),
  mobile        VARCHAR(16),
  phone         VARCHAR(32),
  house         VARCHAR(32),
  address       VARCHAR(127),
  zip_code      VARCHAR(7),
  email         VARCHAR(127),
  emp_name      VARCHAR(127),
  work_age      VARCHAR(32),
  annual_salary VARCHAR(32),
  emp_industry  VARCHAR(127),
  emp_address   VARCHAR(255),
  emp_zip_code  VARCHAR(7),
  emp_phone     VARCHAR(32),
  emp_phone_ext VARCHAR(15),
  emp_kind      VARCHAR(32),
  emp_position  VARCHAR(64),
  create_time   DATETIME,
  create_user   INTEGER,
  update_time   DATETIME,
  update_user   INTEGER,
  status        TINYINT(4),
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_credit_apply
  COMMENT '信用卡申请表';

/*==============================================================*/
/* Table: t_type_use                                            */
/*==============================================================*/
CREATE TABLE t_type_use
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_type_use
  COMMENT '信用卡用途表';

/*==============================================================*/
/* Table: t_card_level                                          */
/*==============================================================*/
CREATE TABLE t_card_level
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_card_level
  COMMENT '信用卡等级表';

/*==============================================================*/
/* Table: t_credit_card                                         */
/*==============================================================*/
CREATE TABLE t_credit_card
(
  id            INTEGER NOT NULL AUTO_INCREMENT,
  bank_id       INTEGER,
  work_kind     VARCHAR(127),
  month_income  VARCHAR(127),
  type_use_id   INTEGER,
  card_level_id INTEGER,
  funds         INTEGER,
  name          VARCHAR(127),
  info          VARCHAR(127),
  image         VARCHAR(255),
  product_desc  VARCHAR(255),
  type_use      TINYINT(4) COMMENT '0：非用途卡,1：用途卡',
  type_hot      TINYINT(4) COMMENT '0：非热卡,1：热卡',
  create_time   DATETIME,
  create_user   INTEGER,
  update_time   DATETIME,
  update_user   INTEGER,
  status        TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

/*==============================================================*/
/* Table: t_credit_banner                                       */
/*==============================================================*/
CREATE TABLE t_credit_banner
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(127),
  img         VARCHAR(255),
  url         VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_credit_banner
  COMMENT '信用卡banner表';

/*==============================================================*/
/* Table: t_coupon_kind                                         */
/*==============================================================*/
CREATE TABLE t_coupon_kind
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(127),
  icon        VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_coupon_kind
  COMMENT '信用卡分类表';

/*==============================================================*/
/* Table: t_credit_coupon                                       */
/*==============================================================*/
CREATE TABLE t_credit_coupon
(
  id             INTEGER NOT NULL AUTO_INCREMENT,
  bank_id        INTEGER,
  activity_id    INTEGER,
  name           VARCHAR(127),
  home_kind      VARCHAR(31),
  info           VARCHAR(127),
  txt            VARCHAR(255),
  image          VARCHAR(255),
  belong_kind_id INTEGER,
  popular_star   INTEGER,
  coupon_desc    VARCHAR(255),
  create_time    DATETIME,
  create_user    INTEGER,
  update_time    DATETIME,
  update_user    INTEGER,
  status         TINYINT(4),
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_credit_coupon
  COMMENT '信用卡优惠券表';

/*==============================================================*/
/* Table: t_data_info                                           */
/*==============================================================*/
CREATE TABLE t_data_info
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  data_name   VARCHAR(255),
  data_type   VARCHAR(255),
  belong_type TINYINT(4) COMMENT '0：个人
            1：企业',
  create_time DATETIME,
  update_time DATETIME,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_data_info
  COMMENT '大数据风控信息表';

/*==============================================================*/
/* Table: t_finance                                             */
/*==============================================================*/
CREATE TABLE t_finance
(
  id                 INTEGER NOT NULL AUTO_INCREMENT,
  bank_id            INTEGER,
  name               VARCHAR(127),
  purchase_condition VARCHAR(255),
  purchase_period    INTEGER,
  purchase_point     INTEGER,
  purchase_phone     VARCHAR(32),
  income_rate        INTEGER,
  num                INTEGER,
  tag                VARCHAR(32),
  product_desc       VARCHAR(255),
  create_time        DATETIME,
  create_user        INTEGER,
  update_time        DATETIME,
  update_user        INTEGER,
  status             TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_finance
  COMMENT '理财产品表';

/*==============================================================*/
/* Table: t_finance_popular                                     */
/*==============================================================*/
CREATE TABLE t_finance_popular
(
  id           INTEGER NOT NULL AUTO_INCREMENT,
  finance_id   INTEGER,
  popular_type VARCHAR(4),
  start_time   DATETIME,
  end_time     DATETIME,
  create_time  DATETIME,
  create_user  INTEGER,
  update_time  DATETIME,
  update_user  INTEGER,
  status       TINYINT(4),
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_finance_popular
  COMMENT '热销及推荐产品，用于运营配置';

/*==============================================================*/
/* Table: t_notice                                              */
/*==============================================================*/
CREATE TABLE t_notice
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(127),
  url         VARCHAR(255),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_notice
  COMMENT '理财轮播表';

/*==============================================================*/
/* Table: t_forum                                               */
/*==============================================================*/
CREATE TABLE t_forum
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_forum
  COMMENT '金融论坛表';

/*==============================================================*/
/* Table: t_forum_msg                                           */
/*==============================================================*/
CREATE TABLE t_forum_msg
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  msg         VARCHAR(255),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_forum_msg
  COMMENT '金融论坛留言表';

/*==============================================================*/
/* Table: t_gb                                                  */
/*==============================================================*/
CREATE TABLE t_gb
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb
  COMMENT '政银信息表';

/*==============================================================*/
/* Table: t_gb_banner                                           */
/*==============================================================*/
CREATE TABLE t_gb_banner
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128),
  url         VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb_banner
  COMMENT '政银信息banner';

/*==============================================================*/
/* Table: t_gb_chat                                             */
/*==============================================================*/
CREATE TABLE t_gb_chat
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb_chat
  COMMENT '政银信息群聊表';

/*==============================================================*/
/* Table: t_gb_swap                                             */
/*==============================================================*/
CREATE TABLE t_gb_swap
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb_swap
  COMMENT '政银信息交流表';

/*==============================================================*/
/* Table: t_gb_swap_detail                                      */
/*==============================================================*/
CREATE TABLE t_gb_swap_detail
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  swap_id     INTEGER,
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb_swap
  COMMENT '政银论坛交流表';

/*==============================================================*/
/* Table: t_gb_swap_banner                                      */
/*==============================================================*/
CREATE TABLE t_gb_swap_banner
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128),
  url         VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_gb_swap_banner
  COMMENT '政银信息交流banner';

/*==============================================================*/
/* Table: t_industry                                            */
/*==============================================================*/
CREATE TABLE t_industry
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_industry
  COMMENT '行业动态表';

/*==============================================================*/
/* Table: t_industry_banner                                     */
/*==============================================================*/
CREATE TABLE t_industry_banner
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_industry_banner
  COMMENT '行业动态banner';

/*==============================================================*/
/* Table: t_code_loan                                           */
/*==============================================================*/
CREATE TABLE t_code_loan
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(128),
  loan_kind   VARCHAR(128) COMMENT 'company:企业, personal:个人',
  icon        VARCHAR(256),
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_code_loan
  COMMENT '贷款形式表';

/*==============================================================*/
/* Table: t_loan_product                                        */
/*==============================================================*/
CREATE TABLE t_loan_product
(
  id             INTEGER NOT NULL AUTO_INCREMENT,
  name           VARCHAR(127),
  icon           VARCHAR(256),
  com_kind       VARCHAR(64),
  register_funds INTEGER,
  loan_funds     INTEGER,
  loan_kind_id   INTEGER,
  loan_deadline  INTEGER,
  bank_id        INTEGER,
  loan_desc      TEXT,
  loan_condition TEXT,
  create_time    DATETIME,
  create_user    INTEGER,
  update_time    DATETIME,
  update_user    INTEGER,
  status         TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_loan_product
  COMMENT '贷款产品表';

/*==============================================================*/
/* Table: t_login                                               */
/*==============================================================*/
CREATE TABLE t_login
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER,
  token       VARCHAR(32),
  create_time DATETIME,
  status      TINYINT(4) COMMENT '0：可用
            1：不可用',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_login
  COMMENT '用户登录记录表';

/*==============================================================*/
/* Table: t_my_finance                                          */
/*==============================================================*/
CREATE TABLE t_my_finance
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER,
  finance_id  INTEGER,
  create_time DATETIME,
  update_time DATETIME,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_my_finance
  COMMENT '我的理财';

/*==============================================================*/
/* Table: t_policy                                              */
/*==============================================================*/
CREATE TABLE t_policy
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(255),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_policy
  COMMENT '政策表';

/*==============================================================*/
/* Table: t_policy_banner                                       */
/*==============================================================*/
CREATE TABLE t_policy_banner
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  title       VARCHAR(128),
  url         VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_policy_banner
  COMMENT '政策宣传banner';

/*==============================================================*/
/* Table: t_store                                               */
/*==============================================================*/
CREATE TABLE t_store
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER,
  name        VARCHAR(64),
  kind        VARCHAR(16),
  path        VARCHAR(255),
  create_time DATETIME,
  status      TINYINT(4) COMMENT '0：已收藏
            1：已删除',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_store
  COMMENT '我的收藏';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
CREATE TABLE t_user
(
  id          INT NOT NULL AUTO_INCREMENT,
  acc         VARCHAR(32),
  psw         VARCHAR(64),
  create_time DATETIME,
  update_time DATETIME,
  status      TINYINT(4) COMMENT '0：未删除
            1：已删除',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_user
  COMMENT '用户信息表';

/*==============================================================*/
/* Table: t_credit_query                                                */
/*==============================================================*/
CREATE TABLE t_credit_query
(
  id          INT NOT NULL AUTO_INCREMENT,
  stype       TINYINT(4) COMMENT '1:个人,2:企业',
  user_name   VARCHAR(256),
  card_id     VARCHAR(32),
  content     TEXT,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_credit_query
  COMMENT '征信信息表';

/*==============================================================*/
/* Table: t_indentify_code                                      */
/*==============================================================*/
CREATE TABLE t_indentify_code
(
  id          INT NOT NULL AUTO_INCREMENT,
  acc         VARCHAR(32),
  type        VARCHAR(32) COMMENT 'find:找回密码,register:注册',
  code        INTEGER,
  create_time DATETIME,
  update_time DATETIME,
  status      TINYINT(4) COMMENT '0：未删除
            1：已删除',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_indentify_code
  COMMENT '验证码表';

/*==============================================================*/
/* Table: t_hots_kind                                           */
/*==============================================================*/
CREATE TABLE t_hots_kind
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255),
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_hots_kind
  COMMENT '热点分类表';

/*==============================================================*/
/* Table: t_hots                                                */
/*==============================================================*/
CREATE TABLE t_hots
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  kind_id     INTEGER,
  name        VARCHAR(255),
  content     TEXT,
  position    INTEGER,
  create_time DATETIME,
  create_user INTEGER,
  update_time DATETIME,
  update_user INTEGER,
  status      TINYINT(4) COMMENT '0：生效
            1：无效',
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

ALTER TABLE t_hots
  COMMENT '热点表';