package com.xidian.module.gb;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;
import com.xidian.common.ResponseHelper;
import com.xidian.common.ValidHelper;
import com.xidian.module.core.CoreService;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class GbController {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[sms_app_id]}")
    private int sms_app_id;

    @Value("#{config[sms_app_key]}")
    private String sms_app_key;

    @Autowired
    @Qualifier("GbService")
    private GbService gbService;

    @Autowired
    @Qualifier("CoreService")
    private CoreService coreService;

    @RequestMapping(value = "/gb/gb/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbGbList(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbGbList(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/gb/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbGb(String data, String id) {
        logger.info(id);
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbGb(id));
        return map;
    }

    @RequestMapping(value = "/gb/gb/banner", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbGbBanner(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbGbBanner());
        return map;
    }

    @RequestMapping(value = "/gb/swap/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbSwapList(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbSwapList(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/swap/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbSwap(String data, String id) {
        logger.info(id);
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbSwap(id));
        return map;
    }

    @RequestMapping(value = "/gb/swap/banner", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbSwapBanner(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbSwapBanner());
        return map;
    }

    @RequestMapping(value = "/gb/publish", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbPublish(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        String pageIndex = (String) jsonObject.get("pageIndex");
        String pageSize = (String) jsonObject.get("pageSize");
        paramMap.put("pageIndex", ValidHelper.isNumber(pageIndex) ? Integer.valueOf(pageIndex) : 1);
        paramMap.put("pageSize", ValidHelper.isNumber(pageSize) ? Integer.valueOf(pageSize) : 20);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbPublish(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/info/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbInfo(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbInfo(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/meet", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbMeet(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("list", gbService.gbMeet(paramMap));
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/gb/forum", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbForum(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("list", gbService.gbForum(paramMap));
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/gb/comment/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbComment(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbComment(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/message", method = {RequestMethod.POST})
    @ResponseBody
    public Object gbMessage(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String userId = (String) jsonObject.get("userId");
        String token = (String) jsonObject.get("token");
        if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(token) || !coreService.isLogin(userId, token)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "用户未登录");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", Integer.valueOf(userId));
        paramMap.put("commontId", jsonObject.get("commontId"));
        paramMap.put("message", jsonObject.get("message"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", gbService.gbMessage(paramMap));
        return map;
    }

    @RequestMapping(value = "/gb/send/email", method = {RequestMethod.POST})
    @ResponseBody
    public Object sendEmail(String name) {
        logger.info("name:" + name);
        boolean sendFlag = coreService.sendEmail("1538302885@qq.com",
                "这里是title", "这里是正文");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("send-flag", sendFlag);
        return map;
    }

    @RequestMapping(value = "/gb/send/sms", method = {RequestMethod.POST})
    @ResponseBody
    public Object sendSms(String name) {
        logger.info("name:" + name);
        try {
            SmsSingleSender singleSender = new SmsSingleSender(this.sms_app_id,
                    this.sms_app_key);
            SmsSingleSenderResult singleSenderResult = singleSender.send(0,
                    "86", "13692141127", "测试短信，普通单发，深圳，小明，上学。", "", "");
            logger.info(singleSenderResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        return map;
    }
}