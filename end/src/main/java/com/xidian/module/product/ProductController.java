package com.xidian.module.product;

import com.xidian.common.ResponseHelper;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("ProductService")
    private ProductService productService;

    @RequestMapping(value = "/product/bank/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object productBankList(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productBankList(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/credit/apply", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditApply(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        int userId = (int) jsonObject.get("userId");
        if (userId < 1) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请先登录");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("cardId", jsonObject.get("cardId"));// 姓名
        paramMap.put("userName", jsonObject.get("name"));// 姓名
        paramMap.put("cardNo", jsonObject.get("cardNo"));// 身份证号
        paramMap.put("cardExpire", jsonObject.get("cardExpiredDate"));// 证件到期日
        paramMap.put("belongCity", jsonObject.get("cardCity"));// 户籍所在城市
        paramMap.put("edu", jsonObject.get("degree"));// 教育程度
        paramMap.put("marriage", jsonObject.get("maritalStatus"));// 婚姻状况
        paramMap.put("mobile", jsonObject.get("mobile"));// 手机号
        paramMap.put("phone", jsonObject.get("homeTel"));// 住宅电话
        paramMap.put("house", jsonObject.get("houseProperty"));// 住宅性质
        paramMap.put("address", jsonObject.get("hoseAddress"));// 住房地址
        paramMap.put("email", jsonObject.get("email"));// 电子邮箱
        paramMap.put("empName", jsonObject.get("workCompany"));// 单位全称
        paramMap.put("workAge", jsonObject.get("workYears"));// 现工作单位年限
        paramMap.put("annualSalary", jsonObject.get("yearSalary"));// 年薪
        paramMap.put("empIndustry", jsonObject.get("workCompanyNature"));// 单位所属行业
        paramMap.put("empAddress", jsonObject.get("workCompanyAddress"));// 单位地址
        paramMap.put("empPhone", jsonObject.get("workCompanyTel"));// 单位电话
        paramMap.put("empPosition", jsonObject.get("job"));// 职务
        paramMap.put("create_user", userId);// 创建人

        paramMap.put("cardOffice", "");
        paramMap.put("zipCode", "");
        paramMap.put("empZipCode", "");
        paramMap.put("empPhoneExt", "");
        paramMap.put("empKind", "");

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productCreditApply(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/credit/card", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditCard(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productCreditCard(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/credit/coupon", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditCoupon(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productCreditCoupon(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/loan/search", method = {RequestMethod.POST})
    @ResponseBody
    public Object productLoanSearch(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        String pageType = (String) jsonObject.get("type");
        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        if ("company".equals(pageType)) {
            paramMap.put("companyNature", jsonObject.get("companyNature"));
            paramMap.put("registeredCapital", jsonObject.get("registeredCapital"));
            paramMap.put("loanAmount", jsonObject.get("loanAmount"));
            paramMap.put("loanType", jsonObject.get("loanType"));
            paramMap.put("loanPeriod", jsonObject.get("loanPeriod"));
            retMap.put("banks", productService.productLoanSearchCompany(paramMap));
        } else {
            retMap.put("banks", productService.productLoanSearchPersonal(paramMap));
        }
        map.put("data", retMap);

        return map;
    }

    @RequestMapping(value = "/product/loan/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object productLoanList(String data, String query) {
        logger.info(query);
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("type", jsonObject.get("loan_kind"));
        paramMap.put("query", query);

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("list", productService.productLoanList(paramMap));

        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        Map<String, Object> loanTypeMap = new HashMap<String, Object>();
        loanTypeMap.put("list", productService.queryLoanType(paramMap));
        retList.add(loanTypeMap);

        Map<String, Object> bankMap = new HashMap<String, Object>();
        bankMap.put("list", productService.queryBank(paramMap));
        retList.add(bankMap);
        retMap.put("pickList", retList);

        map.put("data", retMap);

        return map;
    }

    @RequestMapping(value = "/product/loan/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object productLoanDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productLoanDetail(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/loan/store/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object productLoanStore(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        int userId = (int) jsonObject.get("userId");
        if (userId < 1) {
            logger.info(String.format("%s|%d|请先登录", userId, id));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请先登录");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        paramMap.put("userId", userId);
        paramMap.put("kind", "loan");
        paramMap.put("path", "#/product/loan/detail/" + id);
        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productLoanStore(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/finance/store/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object productFinanceStore(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        int userId = (int) jsonObject.get("userId");
        if (userId < 1) {
            logger.info(String.format("%s|%d|请先登录", userId, id));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请先登录");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        paramMap.put("userId", userId);
        paramMap.put("kind", "finance");
        paramMap.put("path", "#/product/finance/detail/" + id);
        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productFinanceStore(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/credit/index", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditIndex(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();

        retMap.put("banks", productService.productQueryBanks(paramMap));
        retMap.put("banners", productService.productCreditBanner(paramMap));
        retMap.put("list", productService.productTypeUseCard(paramMap));
        retMap.put("list2", productService.productTypeHotCard(paramMap));

        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/product/credit/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productCreditDetail(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/credit/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object productCreditList(String data, String query) {
        logger.info("query|" + query);
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("query", query);

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();

        retMap.put("list", productService.productQueryCreditCard(paramMap));

        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        Map<String, Object> bankMap = new HashMap<String, Object>();
        bankMap.put("list", productService.productQueryBanks(paramMap));
        retList.add(bankMap);

        Map<String, Object> typeUseMap = new HashMap<String, Object>();
        typeUseMap.put("list", productService.productQueryTypeUse(paramMap));
        retList.add(typeUseMap);

        Map<String, Object> cardLevelMap = new HashMap<String, Object>();
        cardLevelMap.put("list", productService.productQueryCardLevel(paramMap));
        retList.add(cardLevelMap);
        retMap.put("pickList", retList);

        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/product/finance/index", method = {RequestMethod.POST})
    @ResponseBody
    public Object productFinanceIndex(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();

        retMap.put("banks", productService.productQueryBanks(paramMap));
        retMap.put("list", productService.productFinance(paramMap));
        retMap.put("notice", productService.productNotice(paramMap));

        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/product/finance/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object productFinanceDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", productService.productFinanceDetail(paramMap));
        return map;
    }

    @RequestMapping(value = "/product/finance/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object productFinanceList(String data, String query) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("query", query);

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();

        retMap.put("list", productService.productQueryFinance(paramMap));

        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        Map<String, Object> bankMap = new HashMap<String, Object>();
        bankMap.put("list", productService.productQueryBankList(paramMap));
        retList.add(bankMap);

        Map<String, Object> incomeMap = new HashMap<String, Object>();
        incomeMap.put("list", new ArrayList<Map<String, Object>>());
        retList.add(incomeMap);

        Map<String, Object> periodMap = new HashMap<String, Object>();
        periodMap.put("list", new ArrayList<Map<String, Object>>());
        retList.add(periodMap);

        Map<String, Object> pointMap = new HashMap<String, Object>();
        pointMap.put("list", new ArrayList<Map<String, Object>>());
        retList.add(pointMap);
        retMap.put("pickList", retList);

        map.put("data", retMap);
        return map;
    }
}