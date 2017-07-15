package com.xidian.module.user;

import com.xidian.common.ResponseHelper;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("UserService")
    private UserService userService;

    @RequestMapping(value = "/user/register", method = {RequestMethod.POST})
    @ResponseBody
    public Object register(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String account = (String) jsonObject.get("account");
        String password = (String) jsonObject.get("password");
        // String verifyCode = (String) jsonObject.get("verifyCode");
        String verifyCode = "";
        logger.info(String.format("%s|%s|%s", account, password, verifyCode));
        // 校验数据合法性 todo

        return userService.register(account, password, verifyCode);
    }

    @RequestMapping(value = "/user/login", method = {RequestMethod.POST})
    @ResponseBody
    public Object login(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String account = (String) jsonObject.get("account");
        String password = (String) jsonObject.get("password");
        logger.info(String.format("%s|%s", account, password));
        // 校验数据合法性 todo

        return userService.login(account, password);
    }

    @RequestMapping(value = "/user/logout", method = {RequestMethod.POST})
    @ResponseBody
    public Object logout(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String userId = String.valueOf(jsonObject.get("userId"));
        String token = (String) jsonObject.get("token");
        logger.info(String.format("%s|%s", userId, token));
        // 校验数据合法性 todo

        return userService.logout(userId, token);
    }

    @RequestMapping(value = "/user/collect", method = {RequestMethod.POST})
    @ResponseBody
    public Object userCollect(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", jsonObject.get("userId"));
        paramMap.put("storeKind", jsonObject.get("storeKind"));
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.userCollect(paramMap));
        return map;
    }
}