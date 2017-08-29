package com.xidian.module.service;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ServiceService")
public class ServiceService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[credit_url]}")
    private String creditUrl;

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

    public Map<String, Object> serviceZx(Map<String, Object> paramMap) throws IOException {
        int userId = (int) paramMap.get("userId");
        String name = (String) paramMap.get("name");
        String cardNo = (String) paramMap.get("cardNo");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("stype", 1);
        map.put("user_name", name);
        map.put("card_id", cardNo);
        map.put("create_user", userId);

        // 判断用户是否已经查询过
        List<Map<String, Object>> list = dao.query4List("credit-query", map);
        logger.info(String.format("creaditQuery|%d|%s|%s|%d", userId, name, cardNo, list.size()));
        if (list.size() > 1) {
            logger.error(String.format("creaditQuery|已经查询过|%d|%s|%s", userId, name, cardNo));
            return list.get(0);
        }

        String url = String.format(this.creditUrl, cardNo, name);
        logger.info("creaditQuery|" + url);
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        HttpResponse response = httpClient.execute(httpPost);
        HttpEntity responseEntity = response.getEntity();
        logger.info("creaditQuery|" + responseEntity.toString());
        String result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
        logger.info("creaditQuery|" + result);
        JSONObject jsonBean = JSONObject.fromObject(result);
        httpClient.close();
        String success = (String) jsonBean.get("success");
        if ("e".equals(success)) {
            String message = (String) jsonBean.get("message");
            logger.error("creaditQuery|error|" + message);
            map.put("msg", "查询失败");
            return map;
        }

        map.put("content", result);
        dao.executeUpdate("credit-insert", map);
        return map;
    }

    public Object serviceSpecialsStore(Map<String, Object> paramMap) {
        List<Map<String, Object>> list = dao.query4List("service-specials-store-list", paramMap);
        if (list.size() == 0) {
            return dao.executeUpdate("service-specials-store", paramMap);
        } else {
            return dao.executeUpdate("service-specials-store-delete", paramMap);
        }
    }
}