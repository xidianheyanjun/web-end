package com.xidian.module.user;

import com.xidian.common.CacheHelper;
import com.xidian.common.ResponseHelper;
import com.xidian.dataAccess.Dao;
import com.xidian.module.core.CoreService;
import com.xidian.sample.service.SampleService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("UserService")
public class UserService implements SampleService {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[sms_code_id]}")
    private int smsCodeId;

    @Autowired
    @Qualifier("CoreService")
    private CoreService coreService;

    @Autowired
    private Dao dao;

    @Override
    public Map<String, Object> executeSample(Map<String, Object> map) {
        int retCode = dao.executeUpdate("sample", map);
        logger.info("retCode:" + retCode);
        return map;
    }

    public Map<String, Object> register(String account, String password,
                                        String indentifyCode) {
        // 查询是否存在账号
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("acc", account);
        paramMap.put("psw", password);
        paramMap.put("indentifyCode", indentifyCode);
        paramMap.put("type", "register");

        List<Map<String, Object>> list = dao.query4List("user-query-by-acc", paramMap);
        if (list.size() > 0) {
            logger.info(String.format("%s|%s", account, list.size()));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "账号已存在");
        }

        List<Map<String, Object>> codeList = dao.query4List("user-query-code", paramMap);
        if (codeList.size() == 0) {
            logger.info(String.format("%s|%s", account, codeList.size()));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "验证码不存在或已经过期");
        }

        // 更新验证码状态
        dao.executeUpdate("user-update-code", paramMap);

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
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "账号不存在");
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

    public Map<String, Object> indentifyCode(String type, String account) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("type", "find".equals(type) ? "find" : "register");
        paramMap.put("account", account);

        List<Map<String, Object>> list = dao.query4List("user-query-indentify-code", paramMap);

        if (list.size() > 0) {
            logger.info(String.format("%s|%s|%s|验证码已发送过", account, type, list.size()));
            paramMap.put("msg", "验证码已发送过");
            return paramMap;
        }

        // 生成验证码
        // 插入数据库
        // 发送短信
        int code = (int) ((Math.random() * 9 + 1) * 1000);

        logger.info(String.format("code|%s|%s|%d", type, account, code));
        paramMap.put("code", code);
        dao.executeUpdate("user-indentify-code", paramMap);

        try {
            coreService.sendSms(smsCodeId, account, String.valueOf(code));
        } catch (Exception e) {
            logger.error(String.format("error|code|%s|%s|%d", type, account, code));
        }

        return paramMap;
    }

    public Map<String, Object> find(String account, String password, String indentifyCode) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("acc", account);
        paramMap.put("psw", password);
        paramMap.put("type", "find");
        paramMap.put("indentifyCode", indentifyCode);
        List<Map<String, Object>> list = dao.query4List("user-query-acc", paramMap);

        if (list.size() == 0) {
            logger.info(String.format("%s|%s", account, list.size()));
            paramMap.put("msg", "账号不存在");
            return paramMap;
        }

        List<Map<String, Object>> codeList = dao.query4List("user-query-code", paramMap);
        if (codeList.size() == 0) {
            logger.info(String.format("%s|%s", account, codeList.size()));
            paramMap.put("msg", "验证码不存在或已经过期");
            return paramMap;
        }

        // 更新验证码状态
        dao.executeUpdate("user-update-code", paramMap);

        dao.executeUpdate("user-set-password", paramMap);
        return paramMap;
    }
}