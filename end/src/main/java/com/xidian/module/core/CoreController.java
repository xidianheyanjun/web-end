package com.xidian.module.core;

import com.xidian.common.ResponseHelper;
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
public class CoreController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("CoreService")
    private CoreService coreService;

    @RequestMapping(value = "/core/sample", method = {RequestMethod.POST})
    @ResponseBody
    public Object sample(String name) {
        logger.info("name:" + name);
        Map<String, Object> map = new HashMap<String, Object>();
        return map;
    }

    @RequestMapping(value = "/core/image/start", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Object coreImageStart() {
        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> imageMap = coreService.queryImageStartUrl();
        map.put("imageStartUrl", imageMap.get("val"));
        return map;
    }
}