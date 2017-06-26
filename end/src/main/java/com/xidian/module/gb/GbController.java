package com.xidian.module.gb;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;
import com.xidian.module.core.CoreService;

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

	@RequestMapping(value = "/gb/send/email", method = { RequestMethod.POST })
	@ResponseBody
	public Object sendEmail(String name) {
		logger.info("name:" + name);
		boolean sendFlag = coreService.sendEmail("1538302885@qq.com",
				"这里是title", "这里是正文");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("send-flag", sendFlag);
		return map;
	}

	@RequestMapping(value = "/gb/send/sms", method = { RequestMethod.POST })
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