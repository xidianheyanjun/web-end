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

    public List<Map<String, Object>> productLoanList(Map<String, Object> paramMap) {
        return dao.query4List("product-loan-list", paramMap);
    }

    public List<Map<String, Object>> queryBank(Map<String, Object> paramMap) {
        return dao.query4List("product-query-bank", paramMap);
    }

    public List<Map<String, Object>> queryLoanType(Map<String, Object> paramMap) {
        return dao.query4List("product-query-loan-type", paramMap);
    }

    public Map<String, Object> productLoanDetail(Map<String, Object> paramMap) {
        return dao.executeQuery("product-loan-detail", paramMap);
    }

    public List<Map<String, Object>> productQueryBanks(Map<String, Object> paramMap) {
        return dao.query4List("product-query-banks", paramMap);
    }

    public List<Map<String, Object>> productCreditBanner(Map<String, Object> paramMap) {
        return dao.query4List("product-query-credit-banner", paramMap);
    }

    public List<Map<String, Object>> productTypeUseCard(Map<String, Object> paramMap) {
        return dao.query4List("product-type-use-card", paramMap);
    }

    public List<Map<String, Object>> productTypeHotCard(Map<String, Object> paramMap) {
        return dao.query4List("product-type-hot-card", paramMap);
    }

    public Map<String, Object> productCreditDetail(Map<String, Object> paramMap) {
        return dao.executeQuery("product-credit-detail", paramMap);
    }

    public List<Map<String, Object>> productQueryCreditCard(Map<String, Object> paramMap) {
        String bankId = (String) paramMap.get("bankId");
        String sql = "all".equals(bankId) ? "product-query-credit-card-all" : "product-query-credit-card";
        return dao.query4List(sql, paramMap);
    }

    public List<Map<String, Object>> productQueryTypeUse(Map<String, Object> paramMap) {
        return dao.query4List("product-query-type-use", paramMap);
    }

    public List<Map<String, Object>> productQueryCardLevel(Map<String, Object> paramMap) {
        return dao.query4List("product-query-card-level", paramMap);
    }

    public List<Map<String, Object>> productFinance(Map<String, Object> paramMap) {
        return dao.query4List("product-finance", paramMap);
    }

    public List<Map<String, Object>> productNotice(Map<String, Object> paramMap) {
        return dao.query4List("product-notice", paramMap);
    }

    public Map<String, Object> productFinanceDetail(Map<String, Object> paramMap) {
        return dao.executeQuery("product-finance-detail", paramMap);
    }

    public List<Map<String, Object>> productQueryFinance(Map<String, Object> paramMap) {
        return dao.query4List("product-query-finance", paramMap);
    }
}