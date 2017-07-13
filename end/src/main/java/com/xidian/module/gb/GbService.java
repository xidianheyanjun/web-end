package com.xidian.module.gb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;

@Service("GbService")
public class GbService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> gbGbList(Map<String, Object> paramMap) {
        return dao.pageQuery("gb-gb-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> gbGb(String id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return dao.executeQuery("gb-gb", paramMap);
    }

    public Map<String, Object> gbSwapList(Map<String, Object> paramMap) {
        return dao.pageQuery("gb-swap-list", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> gbSwap(String id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return dao.executeQuery("gb-swap", paramMap);
    }

    public List<Map<String, Object>> gbGbBanner() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        return dao.query4List("gb-gb-banner", paramMap);
    }

    public List<Map<String, Object>> gbSwapBanner() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        return dao.query4List("gb-swap-banner", paramMap);
    }
}