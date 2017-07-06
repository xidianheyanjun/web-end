package com.xidian.module.core;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CoreController {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	@Qualifier("CoreService")
	private CoreService coreService;

	@RequestMapping(value = "/core/sample", method = { RequestMethod.POST })
	@ResponseBody
	public Object sample(String name) {
		logger.info("name:" + name);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
}