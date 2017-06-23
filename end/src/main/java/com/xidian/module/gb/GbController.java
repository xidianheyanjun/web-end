package com.xidian.module.gb;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;

@Controller
public class GbController {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	@Qualifier("GbService")
	private GbService gbService;

	@RequestMapping(value = "/sample", method = { RequestMethod.POST })
	@ResponseBody
	public Object sample(String name) {
		logger.info("name:" + name);
		int appid = 123456;
		String appkey = "1234567890abcdef1234567890abcdef";
		try {
			SmsSingleSender singleSender = new SmsSingleSender(appid, appkey);
			SmsSingleSenderResult singleSenderResult = singleSender.send(0,
					"86", "12345678902", "测试短信，普通单发，深圳，小明，上学。", "", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
}