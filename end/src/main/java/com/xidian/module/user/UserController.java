package com.xidian.module.user;

import com.xidian.common.ResponseHelper;
import com.xidian.common.ValidHelper;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
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

    @RequestMapping(value = "/user/indentifyCode", method = {RequestMethod.POST})
    @ResponseBody
    public Object indentifyCode(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String type = (String) jsonObject.get("type");
        String account = (String) jsonObject.get("account");
        logger.info(String.format("%s|%s", type, account));
        if (!ValidHelper.isMobile(account)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "手机号格式不正确");
        }
        Map<String, Object> map = userService.indentifyCode(type, account);
        String msg = (String) map.get("msg");
        return StringUtils.isEmpty(msg) ? ResponseHelper.createResponse() : ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, msg);
    }

    @RequestMapping(value = "/user/register", method = {RequestMethod.POST})
    @ResponseBody
    public Object register(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String account = (String) jsonObject.get("account");
        String password = (String) jsonObject.get("password");
        String indentifyCode = (String) jsonObject.get("indentifyCode");
        logger.info(String.format("%s|%s|%s", account, password, indentifyCode));
        // 校验数据合法性 todo
        if (!ValidHelper.isMobile(account)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "手机号格式不正确");
        }

        return userService.register(account, password, indentifyCode);
    }

    @RequestMapping(value = "/user/find", method = {RequestMethod.POST})
    @ResponseBody
    public Object find(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String account = (String) jsonObject.get("account");
        String password = (String) jsonObject.get("password");
        String indentifyCode = (String) jsonObject.get("indentifyCode");
        logger.info(String.format("%s|%s|%s", account, password, indentifyCode));
        // 校验数据合法性 todo
        if (!ValidHelper.isMobile(account)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "手机号格式不正确");
        }

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.find(account, password, indentifyCode));
        return map;
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