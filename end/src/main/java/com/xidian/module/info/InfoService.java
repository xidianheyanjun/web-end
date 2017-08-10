package com.xidian.module.info;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("InfoService")
public class InfoService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> infoPolicyList(Map<String, Object> paramMap) {
        return dao.pageQuery("info-policy-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> infoPolicy(int id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return dao.executeQuery("info-policy", paramMap);
    }

    public Map<String, Object> infoIndustryList(Map<String, Object> paramMap) {
        return dao.pageQuery("info-industry-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> infoIndustry(int id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return dao.executeQuery("info-industry", paramMap);
    }

    public Map<String, Object> infoForumList(Map<String, Object> paramMap) {
        return dao.pageQuery("info-forum-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> infoForum(int id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return dao.executeQuery("info-forum", paramMap);
    }

    public Map<String, Object> infoList(Map<String, Object> paramMap) {
        String kind = (String) paramMap.get("kind");
        if ("industry".equals(kind)) {
            return dao.pageQuery("info-industry-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
        } else if ("forum".equals(kind)) {
            return dao.pageQuery("info-forum-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
        }

        return dao.pageQuery("info-policy-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }
}