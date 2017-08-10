package com.xidian.module.info;

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
public class InfoController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("InfoService")
    private InfoService infoService;

    @RequestMapping(value = "/info/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object infoList(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("pageIndex", jsonObject.get("pageIndex"));
        paramMap.put("pageSize", jsonObject.get("pageSize"));
        paramMap.put("kind", jsonObject.get("kind"));

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", infoService.infoList(paramMap));
        return map;
    }

    @RequestMapping(value = "/info/policy/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object infoPolicy(String data, String id) {
        logger.info(id);
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", infoService.infoPolicy(id));
        return map;
    }

    @RequestMapping(value = "/info/industry/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object infoIndustry(String data, String id) {
        logger.info(id);
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", infoService.infoIndustry(id));
        return map;
    }


    @RequestMapping(value = "/info/forum/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object infoForum(String data, String id) {
        logger.info(id);
        JSONObject jsonObject = JSONObject.fromObject(data);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", infoService.infoForum(id));
        return map;
    }
}