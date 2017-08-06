package com.xidian.module.product;

import com.xidian.common.ResponseHelper;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
        Map<String, Object> paramMap = new HashMap<String, Object>();

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
        String pageType = jsonObject.getString("pageType");
        Map<String, Object> map = ResponseHelper.createResponse();
        if ("company".equals(pageType)) {
            paramMap.put("companyNature", jsonObject.get("companyNature"));
            paramMap.put("registeredCapital", jsonObject.get("registeredCapital"));
            paramMap.put("loanAmount", jsonObject.get("loanAmount"));
            paramMap.put("loanType", jsonObject.get("loanType"));
            paramMap.put("loanPeriod", jsonObject.get("loanPeriod"));
            map.put("data", productService.productLoanSearchCompany(paramMap));
        } else {
            map.put("data", productService.productLoanSearchPersonal(paramMap));
        }

        return map;
    }
}