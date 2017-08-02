package com.xidian.module.credit;

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
import java.util.Map;

@Service("CreditService")
public class CreditService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[credit_url]}")
    private String credit_url;

    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> creaditQuery(Map<String, Object> map) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(this.credit_url);
        logger.info("creaditQuery|" + this.credit_url);
        HttpResponse response = httpClient.execute(httpPost);
        HttpEntity responseEntity = response.getEntity();
        logger.info("creaditQuery|" + responseEntity.toString());
        String result = EntityUtils.toString(responseEntity, Charset.forName("UTF-8"));
        logger.info("creaditQuery|" + result);
        JSONObject jsonBean = JSONObject.fromObject(result);
        httpClient.close();
        String success = jsonBean.getString("success");
        if ("e".equals(success)) {
            String message = jsonBean.getString("message");
            logger.error("creaditQuery|error|" + message);
            return map;
        }

        dao.executeUpdate("credit-insert", map);
        return map;
    }

}