package com.xidian.module.product;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import org.apache.commons.lang3.StringUtils;
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
        String query = (String) paramMap.get("query");
        String sql = dao.getSqlById("product-loan-list");
        if (StringUtils.isNotEmpty(query)) {
            String[] queryArr = query.split(",");
            logger.info(queryArr);
            if (StringUtils.isNotEmpty(queryArr[0]) && !"0".equals(queryArr[0])) {
                sql += " and loan_kind_id = :loan_kind_id";
                paramMap.put("loan_kind_id", queryArr[0]);
            }

            if (queryArr.length == 2 && StringUtils.isNotEmpty(queryArr[1]) && !"0".equals(queryArr[1])) {
                sql += " and bank_id = :bank_id";
                paramMap.put("bank_id", queryArr[1]);
            }
        }
        return dao.query4ListBySql(sql, paramMap);
    }

    public List<Map<String, Object>> queryBank(Map<String, Object> paramMap) {
        return dao.query4List("product-list-query-bank", paramMap);
    }

    public List<Map<String, Object>> queryLoanType(Map<String, Object> paramMap) {
        return dao.query4List("product-list-query-loan-type", paramMap);
    }

    public Map<String, Object> productLoanDetail(Map<String, Object> paramMap) {
        return dao.executeQuery("product-loan-detail", paramMap);
    }

    public List<Map<String, Object>> productQueryBanks(Map<String, Object> paramMap) {
        return dao.query4List("product-query-banks-index", paramMap);
    }

    public List<Map<String, Object>> productQueryBankList(Map<String, Object> paramMap) {
        return dao.query4List("product-query-banks-list", paramMap);
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
        String query = (String) paramMap.get("query");
        String sql = dao.getSqlById("product-query-credit-card");
        if (StringUtils.isNotEmpty(query)) {
            String[] queryArr = query.split(",");
            logger.info(queryArr);
            if (StringUtils.isNotEmpty(queryArr[0]) && (!"0".equals(queryArr[0]) || !"all".equals(queryArr[0]))) {
                sql += " and bank_id = :bank_id";
                paramMap.put("bank_id", queryArr[0]);
            }

            if (queryArr.length == 2 && StringUtils.isNotEmpty(queryArr[1]) && (!"0".equals(queryArr[1]) || !"all".equals(queryArr[1]))) {
                sql += " and type_use_id = :type_use_id";
                paramMap.put("type_use_id", queryArr[1]);
            }

            if (queryArr.length == 3 && StringUtils.isNotEmpty(queryArr[2]) && (!"0".equals(queryArr[2]) || !"all".equals(queryArr[2]))) {
                sql += " and card_level_id = :card_level_id";
                paramMap.put("card_level_id", queryArr[2]);
            }
        }
        return dao.query4ListBySql(sql, paramMap);
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
        String query = (String) paramMap.get("query");
        String sql = dao.getSqlById("product-query-finance");
        if (StringUtils.isNotEmpty(query)) {
            String[] queryArr = query.split(",");
            logger.info(queryArr);
            if (StringUtils.isNotEmpty(queryArr[0]) && (!"0".equals(queryArr[0]) || !"all".equals(queryArr[0]))) {
                sql += " and bank_id = :bank_id";
                paramMap.put("bank_id", queryArr[0]);
            }
        }
        return dao.query4ListBySql(sql, paramMap);
    }

    public Object productLoanStore(Map<String, Object> paramMap) {
        List<Map<String, Object>> list = dao.query4List("product-loan-store-list", paramMap);
        if (list.size() == 0) {
            return dao.executeUpdate("product-loan-store", paramMap);
        } else {
            return dao.executeUpdate("product-loan-store-delete", paramMap);
        }
    }

    public Object productFinanceStore(Map<String, Object> paramMap) {
        List<Map<String, Object>> list = dao.query4List("product-finance-store-list", paramMap);
        if (list.size() == 0) {
            return dao.executeUpdate("product-finance-store", paramMap);
        } else {
            return dao.executeUpdate("product-finance-store-delete", paramMap);
        }
    }
}