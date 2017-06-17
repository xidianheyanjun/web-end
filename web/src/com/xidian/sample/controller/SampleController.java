package com.xidian.sample.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xidian.sample.service.SampleService;

@Controller
public class SampleController {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	@Qualifier("SampleService")
	private SampleService sampleService;

	@RequestMapping(value = "/sample", method = { RequestMethod.POST })
	@ResponseBody
	public Object sample(String name) {
		logger.info("name:" + name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
//		sampleService.executeSample(map);
		return map;
	}
}