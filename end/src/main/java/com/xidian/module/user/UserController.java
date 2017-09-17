package com.xidian.module.user;

import com.xidian.common.ResponseHelper;
import com.xidian.common.ValidHelper;
import com.xidian.module.core.CoreService;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("UserService")
    private UserService userService;

    @Autowired
    @Qualifier("CoreService")
    private CoreService coreService;

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

    @RequestMapping(value = "/user/register/prepare", method = {RequestMethod.POST})
    @ResponseBody
    public Object registerPrepare() {
        try {
            JSONObject generateIdObj = coreService.sendMsg2Jdwx("reportregistergenerateUserId", null);
            if (!ValidHelper.validJdwxResponse(generateIdObj)) {
                logger.info("valid|generateIdObj|failure");
                return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
            }

            JSONObject resultGenerateId = generateIdObj.getJSONObject("result");
            String userId = resultGenerateId.getString("msg");
        } catch (IOException e) {
            logger.error(e);
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "获取唯一标识异常");
        }
        return ResponseHelper.createResponse();
    }

    @RequestMapping(value = "/user/register", method = {RequestMethod.POST})
    @ResponseBody
    public Object register(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String account = (String) jsonObject.get("account");
        String password = (String) jsonObject.get("password");
        String indentifyCode = (String) jsonObject.get("indentifyCode");
        logger.info(String.format("%s|%s|%s", account, password, indentifyCode));
        // 校验数据合法性
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

    @RequestMapping(value = "/user/hots/kind", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHotsKind(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.userHotsKind(paramMap));
        return map;
    }

    @RequestMapping(value = "/user/hotsList", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHotsList(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        int kindId = (int) jsonObject.get("hotsKind");
        int pageIndex = (int) jsonObject.get("pageIndex");
        int pageSize = (int) jsonObject.get("pageSize");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("kindId", kindId);
        paramMap.put("pageIndex", pageIndex);
        paramMap.put("pageSize", pageSize);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.userHotsList(paramMap));
        return map;
    }

    @RequestMapping(value = "/user/hotsDetail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHotsDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.userHotsDetail(paramMap));
        return map;
    }

    @RequestMapping(value = "/user/help", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHelp(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("types", userService.userHelpTypes(paramMap));
        retMap.put("list", userService.userHelpKindList(paramMap));
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/user/helpList/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHelpList(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        List<Map<String, Object>> list = userService.userHelpList(paramMap);
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        int curKindId = -1;
        Map<String, Object> pushMap = null;
        for (int m = 0; m < list.size(); ++m) {
            Map<String, Object> tmpMap = list.get(m);
            int kindId = (int) tmpMap.get("kindId");
            if (curKindId == kindId) {
                continue;
            }

            curKindId = kindId;
            pushMap = new HashMap<String, Object>();
            pushMap.put("id", kindId);
            pushMap.put("title", tmpMap.get("kindTitle"));
            retList.add(pushMap);
        }
        for (int m = 0; m < retList.size(); ++m) {
            Map<String, Object> tmpMap = retList.get(m);
            int kindId = (int) tmpMap.get("id");
            List<Map<String, Object>> pushList = new ArrayList<Map<String, Object>>();
            for (int n = 0; n < list.size(); ++n) {
                Map<String, Object> detailMap = list.get(n);
                int detailKindId = (int) detailMap.get("kindId");
                if (detailKindId != kindId) {
                    continue;
                }
                pushList.add(detailMap);
            }
            tmpMap.put("list", pushList);
        }
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("list", retList);
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/user/helpDetail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object userHelpDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", userService.userHelpDetail(paramMap));
        return map;
    }
}