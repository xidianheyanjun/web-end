package com.xidian.module.product;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ProductService")
public class ProductService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> productBankList(Map<String, Object> paramMap) {
        return dao.pageQuery("product-bank-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Object productCreditApply(Map<String, Object> paramMap) {
        return dao.executeUpdate("product-insert-credit-apply", paramMap);
    }

    public Object productCreditCard(Map<String, Object> paramMap) {
        return dao.query4List("product-credit-card", paramMap);
    }

    public Object productCreditCoupon(Map<String, Object> paramMap) {
        return dao.query4List("product-credit-coupon", paramMap);
    }

    public List<Map<String, Object>> productLoanSearchCompany(Map<String, Object> paramMap) {
        return dao.query4List("product-loan-search-company", paramMap);
    }

    public List<Map<String, Object>> productLoanSearchPersonal(Map<String, Object> paramMap) {
        return dao.query4List("product-loan-search-personal", paramMap);
    }
}