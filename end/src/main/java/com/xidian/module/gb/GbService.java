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

    public Map<String, Object> gbPublish(Map<String, Object> paramMap) {
        return dao.pageQuery("gb-publish", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }

    public Map<String, Object> gbInfo(Map<String, Object> paramMap) {
        return dao.executeQuery("gb-info", paramMap);
    }

    public List<Map<String, Object>> gbMeet(Map<String, Object> paramMap) {
        logger.info(paramMap.get("ts"));
        String ts = (String) paramMap.get("ts");
        String sql = dao.getSqlById("gb-meet");
        if (ts != null && !"".equals(ts)) {
            sql += " and unix_timestamp(chat.create_time) > :tsLong";
            long tsLong = Long.valueOf(ts);
            paramMap.put("tsLong", tsLong);
        }
        sql += " order by chat.create_time";
        return dao.query4ListBySql(sql, paramMap);
    }

    public List<Map<String, Object>> gbForum(Map<String, Object> paramMap) {
        return dao.query4List("gb-forum", paramMap);
    }

    public Map<String, Object> gbComment(Map<String, Object> paramMap) {
        Map<String, Object> swap = dao.executeQuery("gb-comment", paramMap);
        swap.put("message", dao.query4List("gb-comment-message", paramMap));
        return swap;
    }

    public Object gbMessage(Map<String, Object> paramMap) {
        return dao.executeUpdate("gb-message", paramMap);
    }

    public boolean gbMeetSend(Map<String, Object> paramMap) {
        dao.executeUpdate("gb-meet-send", paramMap);
        return true;
    }
}