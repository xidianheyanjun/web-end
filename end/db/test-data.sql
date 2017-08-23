insert into t_user(id, acc, psw, create_time, status)
values(1, "13974680000", password("123456"), now(), 0),
(2, "13974680001", password("123456"), now(), 0),
(3, "13974680002", password("123456"), now(), 0);


insert into t_gb(title, content, create_time, create_user, status)
values("t_gb测试标题1", "t_gb测试的内容1", now(), 0, 0),
("t_gb测试标题2", "t_gb测试的内容2", now(), 0, 0),
("t_gb测试标题3", "t_gb测试的内容3", now(), 0, 0),
("t_gb测试标题4", "t_gb测试的内容4", now(), 0, 0),
("t_gb测试标题5", "t_gb测试的内容5", now(), 0, 0),
("t_gb测试标题6", "t_gb测试的内容6", now(), 0, 0),
("t_gb测试标题7", "t_gb测试的内容7", now(), 0, 0),
("t_gb测试标题8", "t_gb测试的内容8", now(), 0, 0),
("t_gb测试标题9", "t_gb测试的内容9", now(), 0, 0),
("t_gb测试标题10", "t_gb测试的内容10", now(), 0, 0),
("t_gb测试标题11", "t_gb测试的内容11", now(), 0, 0);


insert into t_gb_banner(title, url, position, create_time, create_user, status)
values("t_gb_banner测试标题1", "http://119.23.41.237:8180/end/image/hawk.png", 1, now(), 0, 0),
("t_gb_banner测试标题2", "http://119.23.41.237:8180/end/image/hawk.png", 2, now(), 0, 0),
("t_gb_banner测试标题3", "http://119.23.41.237:8180/end/image/hawk.png", 3, now(), 0, 0),
("t_gb_banner测试标题4", "http://119.23.41.237:8180/end/image/hawk.png", 4, now(), 0, 0),
("t_gb_banner测试标题5", "http://119.23.41.237:8180/end/image/hawk.png", 5, now(), 0, 0),
("t_gb_banner测试标题6", "http://119.23.41.237:8180/end/image/hawk.png", 6, now(), 0, 0),
("t_gb_banner测试标题7", "http://119.23.41.237:8180/end/image/hawk.png", 7, now(), 0, 0),
("t_gb_banner测试标题8", "http://119.23.41.237:8180/end/image/hawk.png", 8, now(), 0, 0),
("t_gb_banner测试标题9", "http://119.23.41.237:8180/end/image/hawk.png", 9, now(), 0, 0),
("t_gb_banner测试标题10", "http://119.23.41.237:8180/end/image/hawk.png", 10, now(), 0, 0),
("t_gb_banner测试标题11", "http://119.23.41.237:8180/end/image/hawk.png", 11, now(), 0, 0);

insert into t_gb_chat(title, content, create_time, create_user, status)
values("t_gb_chat测试标题1", "t_gb_chat测试的内容1", now(), 1, 0),
("t_gb_chat测试标题2", "t_gb_chat测试的内容2", now(), 1, 0),
("t_gb_chat测试标题3", "t_gb_chat测试的内容3", now(), 2, 0),
("t_gb_chat测试标题4", "t_gb_chat测试的内容4", now(), 3, 0),
("t_gb_chat测试标题5", "t_gb_chat测试的内容5", now(), 2, 0),
("t_gb_chat测试标题6", "t_gb_chat测试的内容6", now(), 2, 0),
("t_gb_chat测试标题7", "t_gb_chat测试的内容7", now(), 3, 0),
("t_gb_chat测试标题8", "t_gb_chat测试的内容8", now(), 3, 0),
("t_gb_chat测试标题9", "t_gb_chat测试的内容9", now(), 1, 0),
("t_gb_chat测试标题10", "t_gb_chat测试的内容10", now(), 3, 0),
("t_gb_chat测试标题11", "t_gb_chat测试的内容11", now(), 2, 0);

insert into t_gb_swap(title, content, create_time, create_user, status)
values("t_gb_swap测试标题1", "t_gb_swap测试的内容1", now(), 0, 0),
("t_gb_swap测试标题2", "t_gb_swap测试的内容2", now(), 0, 0),
("t_gb_swap测试标题3", "t_gb_swap测试的内容3", now(), 0, 0),
("t_gb_swap测试标题4", "t_gb_swap测试的内容4", now(), 0, 0),
("t_gb_swap测试标题5", "t_gb_swap测试的内容5", now(), 0, 0),
("t_gb_swap测试标题6", "t_gb_swap测试的内容6", now(), 0, 0),
("t_gb_swap测试标题7", "t_gb_swap测试的内容7", now(), 0, 0),
("t_gb_swap测试标题8", "t_gb_swap测试的内容8", now(), 0, 0),
("t_gb_swap测试标题9", "t_gb_swap测试的内容9", now(), 0, 0),
("t_gb_swap测试标题10", "t_gb_swap测试的内容10", now(), 0, 0),
("t_gb_swap测试标题11", "t_gb_swap测试的内容11", now(), 0, 0);

insert into t_gb_swap_detail(swap_id, content, create_time, create_user, status)
values(1, "t_gb_swap_detail测试的内容1", now(), 0, 0),
(1, "t_gb_swap_detail测试的内容2", now(), 1, 0),
(1, "t_gb_swap_detail测试的内容3", now(), 1, 0),
(1, "t_gb_swap_detail测试的内容4", now(), 1, 0),
(2, "t_gb_swap_detail测试的内容5", now(), 1, 0),
(2, "t_gb_swap_detail测试的内容6", now(), 2, 0),
(3, "t_gb_swap_detail测试的内容7", now(), 3, 0),
(2, "t_gb_swap_detail测试的内容8", now(), 3, 0),
(2, "t_gb_swap_detail测试的内容9", now(), 2, 0),
(1, "t_gb_swap_detail测试的内容10", now(), 2, 0),
(1, "t_gb_swap_detail测试的内容11", now(), 3, 0);

insert into t_gb_swap_banner(title, url, position, create_time, create_user, status)
values("t_gb_swap_banner测试标题1", "http://119.23.41.237:8180/end/image/hawk.png", 1, now(), 0, 0),
("t_gb_swap_banner测试标题2", "http://119.23.41.237:8180/end/image/hawk.png", 2, now(), 0, 0),
("t_gb_swap_banner测试标题3", "http://119.23.41.237:8180/end/image/hawk.png", 3, now(), 0, 0),
("t_gb_swap_banner测试标题4", "http://119.23.41.237:8180/end/image/hawk.png", 4, now(), 0, 0),
("t_gb_swap_banner测试标题5", "http://119.23.41.237:8180/end/image/hawk.png", 5, now(), 0, 0),
("t_gb_swap_banner测试标题6", "http://119.23.41.237:8180/end/image/hawk.png", 6, now(), 0, 0),
("t_gb_swap_banner测试标题7", "http://119.23.41.237:8180/end/image/hawk.png", 7, now(), 0, 0),
("t_gb_swap_banner测试标题8", "http://119.23.41.237:8180/end/image/hawk.png", 8, now(), 0, 0),
("t_gb_swap_banner测试标题9", "http://119.23.41.237:8180/end/image/hawk.png", 9, now(), 0, 0),
("t_gb_swap_banner测试标题10", "http://119.23.41.237:8180/end/image/hawk.png", 10, now(), 0, 0),
("t_gb_swap_banner测试标题11", "http://119.23.41.237:8180/end/image/hawk.png", 11, now(), 0, 0);

insert into t_policy(title, content, create_time, create_user, status)
values("t_policy测试标题1", "t_policy测试的内容1", now(), 0, 0),
("t_policy测试标题2", "t_policy测试的内容2", now(), 0, 0),
("t_policy测试标题3", "t_policy测试的内容3", now(), 0, 0),
("t_policy测试标题4", "t_policy测试的内容4", now(), 0, 0),
("t_policy测试标题5", "t_policy测试的内容5", now(), 0, 0),
("t_policy测试标题6", "t_policy测试的内容6", now(), 0, 0),
("t_policy测试标题7", "t_policy测试的内容7", now(), 0, 0),
("t_policy测试标题8", "t_policy测试的内容8", now(), 0, 0),
("t_policy测试标题9", "t_policy测试的内容9", now(), 0, 0),
("t_policy测试标题10", "t_policy测试的内容10", now(), 0, 0),
("t_policy测试标题11", "t_policy测试的内容11", now(), 0, 0);

insert into t_industry(title, content, create_time, create_user, status)
values("t_industry测试标题1", "t_industry测试的内容1", now(), 0, 0),
("t_industry测试标题2", "t_industry测试的内容2", now(), 0, 0),
("t_industry测试标题3", "t_industry测试的内容3", now(), 0, 0),
("t_industry测试标题4", "t_industry测试的内容4", now(), 0, 0),
("t_industry测试标题5", "t_industry测试的内容5", now(), 0, 0),
("t_industry测试标题6", "t_industry测试的内容6", now(), 0, 0),
("t_industry测试标题7", "t_industry测试的内容7", now(), 0, 0),
("t_industry测试标题8", "t_industry测试的内容8", now(), 0, 0),
("t_industry测试标题9", "t_industry测试的内容9", now(), 0, 0),
("t_industry测试标题10", "t_industry测试的内容10", now(), 0, 0),
("t_industry测试标题11", "t_industry测试的内容11", now(), 0, 0);

insert into t_forum(title, content, create_time, create_user, status)
values("t_forum测试标题1", "t_forum测试的内容1", now(), 0, 0),
("t_forum测试标题2", "t_forum测试的内容2", now(), 0, 0),
("t_forum测试标题3", "t_forum测试的内容3", now(), 0, 0),
("t_forum测试标题4", "t_forum测试的内容4", now(), 0, 0),
("t_forum测试标题5", "t_forum测试的内容5", now(), 0, 0),
("t_forum测试标题6", "t_forum测试的内容6", now(), 0, 0),
("t_forum测试标题7", "t_forum测试的内容7", now(), 0, 0),
("t_forum测试标题8", "t_forum测试的内容8", now(), 0, 0),
("t_forum测试标题9", "t_forum测试的内容9", now(), 0, 0),
("t_forum测试标题10", "t_forum测试的内容10", now(), 0, 0),
("t_forum测试标题11", "t_forum测试的内容11", now(), 0, 0);

insert into t_bank(code, name, icon, create_time, create_user, status)
values("zhaoshang", "招商银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("jianshe", "建设银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("minsheng", "民生银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("nongye", "农业银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("huaxia", "华夏银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("shanghai", "上海银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("zhongguo", "中国银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("ningbo", "宁波银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("zheshang", "浙商银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
("nongshang", "农商银行", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0);

insert into t_type_use(name, create_time, create_user, status)
values("用途1", now(), 0, 0),
("用途2", now(), 0, 0),
("用途3", now(), 0, 0),
("用途4", now(), 0, 0),
("用途5", now(), 0, 0),
("用途6", now(), 0, 0),
("用途7", now(), 0, 0),
("用途8", now(), 0, 0);

insert into t_card_level(name, create_time, create_user, status)
values("等级1", now(), 0, 0),
("等级2", now(), 0, 0),
("等级3", now(), 0, 0),
("等级4", now(), 0, 0),
("等级5", now(), 0, 0),
("等级6", now(), 0, 0),
("等级7", now(), 0, 0),
("等级8", now(), 0, 0);

insert into t_credit_card(bank_id, work_kind, month_income, type_use_id, card_level_id, funds, name, info, image, product_desc, type_use, type_hot, create_time, create_user, status)
values(1, "kind1", "5-10", 100000, 1, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡1说明", 1, 1, now(), 0, 0),
(1, "kind2", "5-10", 110000, 1, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡2说明", 1, 1, now(), 0, 0),
(1, "kind3", "5-10", 120000, 2, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡3说明", 1, 1, now(), 0, 0),
(1, "kind4", "5-10", 130000, 3, 1, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡4说明", 1, 1, now(), 0, 0),
(1, "kind5", "5-10", 140000, 2, 1, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡5说明", 1, 1, now(), 0, 0),
(1, "kind6", "5-10", 150000, 1, 1, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡6说明", 1, 1, now(), 0, 0),
(1, "kind7", "5-10", 160000, 3, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡7说明", 1, 1, now(), 0, 0),
(1, "kind8", "5-10", 170000, 3, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡8说明", 1, 1, now(), 0, 0),
(1, "kind9", "5-10", 180000, 3, 1, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡9说明", 1, 1, now(), 0, 0),
(1, "kind10", "5-10", 1900000, 1, 2, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡10说明", 1, 1, now(), 0, 0),
(1, "kind11", "5-10", 200000, 1, 1, "招商信用卡", "给高颜值的你", "http://119.23.41.237:8180/front/static/images/credit.jpg", "招商信用卡铂金卡11说明", 1, 1, now(), 0, 0);

insert into t_code_loan(id, name, loan_kind, icon, create_time, create_user, status)
values(1, "贷款形式1", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(2, "贷款形式2", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(3, "贷款形式3", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(4, "贷款形式4", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(5, "贷款形式5", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(6, "贷款形式6", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(7, "贷款形式7", "company", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(8, "贷款形式8", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(9, "贷款形式9", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(10, "贷款形式10", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(11, "贷款形式11", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(12, "贷款形式12", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(13, "贷款形式13", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(14, "贷款形式14", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(15, "贷款形式15", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0),
(16, "贷款形式16", "personal", "http://119.23.41.237:8180/front/static/images/bank.png", now(), 0, 0);

insert into t_loan_product(name, loan_kind_id, bank_id, icon, loan_desc, create_time, create_user, status)
values("loan_product_1", 1, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_2", 1, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_3", 1, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_4", 2, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_5", 2, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_6", 2, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_7", 3, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_8", 8, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_9", 8, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_10", 8, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_11", 9, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_12", 9, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0),
("loan_product_13", 10, 1, "http://119.23.41.237:8180/front/static/images/bank.png", "贷款产品详细介绍", now(), 0, 0);


insert into t_notice(title, url, create_time, create_user, status)
values("[快银通推送]江西银行高资产净值客户理财产品火热发售", "#/info/policy/1", now(), 0, 0),
("[快银通推送]浦发银行信用卡新开户好礼相送", "#/info/policy/1", now(), 0, 0),
("[快银通推送]赣州银行xx区开张迎宾贺大礼", "#/info/policy/1", now(), 0, 0);


insert into t_finance(bank_id, name, purchase_condition, purchase_period, purchase_point,
purchase_phone, income_rate, num, tag, product_desc, create_time, create_user, status)
values(1, "江西银行优盛理财财-创鑫16366A", "条件1", 87, 6,
        "13974680000", 1, 34, "人气", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 1, 6,
        "13974680000", 3, 13, "", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 234, 6,
        "13974680000", 3, 45, "推荐", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 534, 6,
        "13974680000", 8, 56, "人气", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 43, 6,
        "13974680000", 9, 23, "推荐", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 67, 6,
        "13974680000", 13, 32, "人气", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 8, 6,
        "13974680000", 34, 33, "", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 567, 6,
        "13974680000", 23, 30, "推荐", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 456, 6,
        "13974680000", 32, 1, "", "产品简介1", now(), 0, 0),
(1, "江西银行优盛理财财-创鑫16366A", "条件1", 76, 6,
        "13974680000", 23, 89, "人气", "产品简介1", now(), 0, 0);


insert into t_coupon_kind(name, icon, position, create_time, create_user, status)
values("美食", "http://119.23.41.237:8180/front/static/images/bank.png", 1, now(), 0, 0),
("电影", "http://119.23.41.237:8180/front/static/images/bank.png", 1, now(), 0, 0),
("酒店", "http://119.23.41.237:8180/front/static/images/bank.png", 1, now(), 0, 0);


insert into t_credit_coupon(bank_id, name, home_kind, info, txt, image, belong_kind_id, popular_star, coupon_desc, create_time, create_user, status)
values(1, "麦当劳", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳1", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 2 , 4, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(2, "麦当劳2", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 2 , 4, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(3, "麦当劳3", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 3 , 5, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳4", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳5", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 2, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(3, "麦当劳6", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 3 , 1, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(3, "麦当劳7", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(2, "麦当劳8", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 2 , 1, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳9", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(2, "麦当劳0", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 2, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳10", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 2 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(2, "麦当劳11", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 4, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳12", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(3, "麦当劳13", "巨无霸小巨人", "coupons", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg",3 , 5, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0),
(1, "麦当劳14", "巨无霸小巨人", "markets", "九江市快乐城4楼", "http://119.23.41.237:8180/front/static/images/sun.jpg", 1 , 3, "活动期间，刷浦发银行信用卡可享9折优惠（酒水、特价菜除外），不与浦发其他优惠同享。", now(), 0, 0);











