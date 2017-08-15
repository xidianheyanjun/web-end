package com.xidian.module.service;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ServiceService")
public class ServiceService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public List<Map<String, Object>> serviceSpecialsType(Map<String, Object> paramMap) {
        return dao.query4List("service-specials-type", paramMap);
    }

    public List<Map<String, Object>> serviceSpecialsCoupons(Map<String, Object> paramMap) {
        return dao.query4List("service-specials-coupons", paramMap);
    }

    public List<Map<String, Object>> serviceSpecialsMargets(Map<String, Object> paramMap) {
        return dao.query4List("service-specials-margets", paramMap);
    }

    public Map<String, Object> serviceSpecialsDetail(Map<String, Object> paramMap) {
        return dao.executeQuery("service-specials-detail", paramMap);
    }

    public List<Map<String, Object>> serviceQueryKind(Map<String, Object> paramMap) {
        return dao.query4List("service-query-kind", paramMap);
    }

    public List<Map<String, Object>> serviceQueryBank(Map<String, Object> paramMap) {
        return dao.query4List("service-query-bank", paramMap);
    }

    public List<Map<String, Object>> serviceCreditCouponList(Map<String, Object> paramMap) {
        String query = (String) paramMap.get("query");
        String[] queryArr = query.split(",");
        String sql = dao.getSqlById("service-credit-coupon-list");
        if (queryArr[0] != null && !"".equals(queryArr[0]) && !"all".equals(queryArr[0])) {
            sql += " and bank_id = :bankId";
            paramMap.put("bankId", Integer.valueOf(queryArr[0]));
        }

        if (queryArr[1] != null && !"".equals(queryArr[1]) && !"all".equals(queryArr[1])) {
            sql += " and (home_kind = :kind || belong_kind_id = :kind)";
            paramMap.put("kind", Integer.valueOf(queryArr[1]));
        }

        return dao.query4ListBySql(sql, paramMap);
    }
}