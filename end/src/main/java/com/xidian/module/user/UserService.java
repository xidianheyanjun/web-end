package com.xidian.module.user;

import com.xidian.common.CacheHelper;
import com.xidian.common.ResponseHelper;
import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("UserService")
public class UserService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> register(String account, String password,
                                        String verifyCode) {
        // 查询是否存在账号
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("acc", account);
        paramMap.put("psw", password);
        List<Map<String, Object>> list = dao.query4List("user-query-by-acc", paramMap);

        if (list.size() > 0) {
            logger.info(String.format("%s|%s", account, list.size()));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "账号已存在");
        }

        // 注册用户
        dao.executeUpdate("user-register", paramMap);
        return ResponseHelper.createResponse();
    }

    public Map<String, Object> login(String account, String password) {
        // 查询用户是否存在
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("acc", account);
        paramMap.put("psw", password);
        List<Map<String, Object>> list = dao.query4List("user-query", paramMap);

        if (list.size() == 0) {
            logger.info(String.format("%s|%s", account, list.size()));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "帳號不存在");
        }

        // 生成token
        long curTime = System.currentTimeMillis();
        String token = DigestUtils.md5Hex(String.format("%s-%d", account, curTime));
        logger.info(String.format("%s|%d|%s", account, curTime, token));

        // 存入数据库
        Map<String, Object> user = list.get(0);
        user.put("token", token);
        dao.executeUpdate("user-login", user);

        // 将身份信息存入缓存
        CacheHelper.set(user.get("userId").toString(), token);
        Map<String, Object> retMap = ResponseHelper.createResponse();
        retMap.put("data", user);
        return retMap;
    }

    public Map<String, Object> logout(String userId, String token) {
        // 清除缓存
        CacheHelper.remove(userId);

        // 清除数据库
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("token", token);
        dao.executeUpdate("user-logout", paramMap);
        return ResponseHelper.createResponse();
    }

    public Map<String, Object> userCollect(Map<String, Object> paramMap) {
        return dao.pageQuery("user-collect", paramMap, (int) paramMap.get("pageIndex"), (int) paramMap.get("pageSize"));
    }
}