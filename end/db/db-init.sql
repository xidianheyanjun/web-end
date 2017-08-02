/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/6/22 星期四 下午 11:41:33                    */
/*==============================================================*/


drop table if exists t_bank;

drop table if exists t_config;

drop table if exists t_credit_activity;

drop table if exists t_credit_apply;

drop table if exists t_credit_card;

drop table if exists t_credit_coupon;

drop table if exists t_data_info;

drop table if exists t_finance;

drop table if exists t_finance_popular;

drop table if exists t_forum;

drop table if exists t_forum_msg;

drop table if exists t_gb;

drop table if exists t_gb_banner;

drop table if exists t_gb_swap;

drop table if exists t_gb_swap_banner;

drop table if exists t_industry;

drop table if exists t_industry_banner;

drop table if exists t_loan_product;

drop table if exists t_login;

drop table if exists t_my_finance;

drop table if exists t_policy;

drop table if exists t_policy_banner;

drop table if exists t_store;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_bank                                                */
/*==============================================================*/
create table t_bank
(
   id                   integer not null auto_increment,
   code                 varchar(127),
   name                 varchar(255),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_bank comment '银行信息表';

/*==============================================================*/
/* Table: t_config                                              */
/*==============================================================*/
create table t_config
(
   id                   integer not null auto_increment,
   code                 varchar(32),
   name                 varchar(127),
   val                  varchar(255),
   create_time          datetime,
   update_time          datetime,
   status               tinyint(4) comment '0：启用
            1：禁用',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_config comment '系统配置表';

/*==============================================================*/
/* Table: t_credit_activity                                     */
/*==============================================================*/
create table t_credit_activity
(
   id                   integer not null auto_increment,
   name                 varchar(127),
   activity_kind        varchar(127),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_credit_activity comment '信用卡优惠活动表';

/*==============================================================*/
/* Table: t_credit_apply                                        */
/*==============================================================*/
create table t_credit_apply
(
   id                   integer not null auto_increment,
   card_id              integer,
   user_name            varchar(127),
   card_no              varchar(32),
   card_expire          datetime,
   card_office          varchar(255),
   belong_city          varchar(16),
   edu                  varchar(16),
   marriage             varchar(16),
   mobile               varchar(16),
   phone                varchar(32),
   house                varchar(32),
   address              varchar(127),
   zip_code             varchar(7),
   email                varchar(127),
   emp_name             varchar(127),
   work_age             varchar(32),
   annual_salary        varchar(32),
   emp_industry         varchar(127),
   emp_address          varchar(255),
   emp_zip_code         varchar(7),
   emp_phone            varchar(32),
   emp_phone_ext        varchar(15),
   emp_kind             varchar(32),
   emp_position         varchar(64),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_credit_apply comment '信用卡申请表';

/*==============================================================*/
/* Table: t_credit_card                                         */
/*==============================================================*/
create table t_credit_card
(
   id                   integer not null auto_increment,
   bank_id              integer,
   work_kind            varchar(127),
   month_income         varchar(127),
   funds                integer,
   name                 varchar(127),
   product_desc         varchar(255),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_credit_card comment '信用卡表';

/*==============================================================*/
/* Table: t_credit_coupon                                       */
/*==============================================================*/
create table t_credit_coupon
(
   id                   integer not null auto_increment,
   bank_id              integer,
   activity_id          integer,
   name                 varchar(127),
   belong_kind_id       integer,
   popular_star         integer,
   coupon_desc          varchar(255),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_credit_coupon comment '信用卡优惠券表';

/*==============================================================*/
/* Table: t_data_info                                           */
/*==============================================================*/
create table t_data_info
(
   id                   integer not null auto_increment,
   data_name            varchar(255),
   data_type            varchar(255),
   belong_type          tinyint(4) comment '0：个人
            1：企业',
   create_time          datetime,
   update_time          datetime,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_data_info comment '大数据风控信息表';

/*==============================================================*/
/* Table: t_finance                                             */
/*==============================================================*/
create table t_finance
(
   id                   integer not null auto_increment,
   bank_id              integer,
   name                 varchar(127),
   purchase_condition   varchar(255),
   purchase_period      integer,
   purchase_point       integer,
   purchase_phone       varchar(32),
   income_rate          integer,
   product_desc         varchar(255),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_finance comment '理财产品表';

/*==============================================================*/
/* Table: t_finance_popular                                     */
/*==============================================================*/
create table t_finance_popular
(
   id                   integer not null auto_increment,
   finance_id           integer,
   popular_type         varchar(4),
   start_time           datetime,
   end_time             datetime,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_finance_popular comment '热销及推荐产品，用于运营配置';

/*==============================================================*/
/* Table: t_forum                                               */
/*==============================================================*/
create table t_forum
(
   id                   integer not null auto_increment,
   title                varchar(255),
   content              text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_forum comment '金融论坛表';

/*==============================================================*/
/* Table: t_forum_msg                                           */
/*==============================================================*/
create table t_forum_msg
(
   id                   integer not null auto_increment,
   msg                  varchar(255),
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_forum_msg comment '金融论坛留言表';

/*==============================================================*/
/* Table: t_gb                                                  */
/*==============================================================*/
create table t_gb
(
   id                   integer not null auto_increment,
   title                varchar(255),
   content              text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_gb comment '政银信息表';

/*==============================================================*/
/* Table: t_gb_banner                                           */
/*==============================================================*/
create table t_gb_banner
(
   id                   integer not null auto_increment,
   title                varchar(128),
   url                  varchar(255),
   position             integer,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_gb_banner comment '政银信息banner';

/*==============================================================*/
/* Table: t_gb_swap                                             */
/*==============================================================*/
create table t_gb_swap
(
   id                   integer not null auto_increment,
   title                varchar(255),
   content              text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_gb_swap comment '政银信息交流表';

/*==============================================================*/
/* Table: t_gb_swap_banner                                      */
/*==============================================================*/
create table t_gb_swap_banner
(
   id                   integer not null auto_increment,
   title                varchar(128),
   url                  varchar(255),
   position             integer,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_gb_swap_banner comment '政银信息交流banner';

/*==============================================================*/
/* Table: t_industry                                            */
/*==============================================================*/
create table t_industry
(
   id                   integer not null auto_increment,
   title                varchar(255),
   content              text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_industry comment '行业动态表';

/*==============================================================*/
/* Table: t_industry_banner                                     */
/*==============================================================*/
create table t_industry_banner
(
   id                   integer not null auto_increment,
   title                varchar(128),
   position             integer,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_industry_banner comment '行业动态banner';

/*==============================================================*/
/* Table: t_loan_product                                        */
/*==============================================================*/
create table t_loan_product
(
   id                   integer not null auto_increment,
   name                 varchar(127),
   com_kind             varchar(64),
   register_funds       integer,
   loan_funds           integer,
   loan_kind            varchar(64),
   loan_deadline        integer,
   bank_id              integer,
   loan_desc            text,
   loan_condition       text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_loan_product comment '贷款产品表';

/*==============================================================*/
/* Table: t_login                                               */
/*==============================================================*/
create table t_login
(
   id                   integer not null auto_increment,
   user_id              integer,
   token                varchar(32),
   create_time          datetime,
   status               tinyint(4) comment '0：可用
            1：不可用',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_login comment '用户登录记录表';

/*==============================================================*/
/* Table: t_my_finance                                          */
/*==============================================================*/
create table t_my_finance
(
   id                   integer not null auto_increment,
   user_id              integer,
   finance_id           integer,
   create_time          datetime,
   update_time          datetime,
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_my_finance comment '我的理财';

/*==============================================================*/
/* Table: t_policy                                              */
/*==============================================================*/
create table t_policy
(
   id                   integer not null auto_increment,
   title                varchar(255),
   content              text,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_policy comment '政策表';

/*==============================================================*/
/* Table: t_policy_banner                                       */
/*==============================================================*/
create table t_policy_banner
(
   id                   integer not null auto_increment,
   title                varchar(128),
   url                  varchar(255),
   position             integer,
   create_time          datetime,
   create_user          integer,
   update_time          datetime,
   update_user          integer,
   status               tinyint(4) comment '0：生效
            1：无效',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_policy_banner comment '政策宣传banner';

/*==============================================================*/
/* Table: t_store                                               */
/*==============================================================*/
create table t_store
(
   id                   integer not null auto_increment,
   user_id              integer,
   name                 varchar(64),
   kind                 varchar(16),
   path                 varchar(255),
   create_time          datetime,
   status               tinyint(4) comment '0：已收藏
            1：已删除',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_store comment '我的收藏';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int not null auto_increment,
   acc                  varchar(32),
   psw                  varchar(64),
   create_time          datetime,
   update_time          datetime,
   status               tinyint(4) comment '0：未删除
            1：已删除',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_user comment '用户信息表';

/*==============================================================*/
/* Table: t_credit_query                                                */
/*==============================================================*/
create table t_credit_query
(
   id                   int not null auto_increment,
   stype                tinyint(4) comment '1:个人,2:企业',
   user_name            varchar(256),
   card_id              varchar(32),
   content              text,
   create_time          datetime,
   update_time          datetime,
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

alter table t_credit_query comment '征信信息表';