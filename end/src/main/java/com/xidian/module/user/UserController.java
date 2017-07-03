package com.xidian.module.user;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	@Qualifier("UserService")
	private UserService userService;

	@RequestMapping(value = "/user/register", method = { RequestMethod.POST })
	@ResponseBody
	public Object register(String account, String password, String verifyCode) {
		logger.info(String.format("%s|%s|%s", account, password, verifyCode));
		// 校验数据合法性 todo

		return userService.register(account, password, verifyCode);
	}

	@RequestMapping(value = "/user/login", method = { RequestMethod.POST })
	@ResponseBody
	public Object login(String account, String password) {
		logger.info(String.format("%s|%s", account, password));
		// 校验数据合法性 todo

		return userService.login(account, password);
	}

	@RequestMapping(value = "/user/logout", method = { RequestMethod.POST })
	@ResponseBody
	public Object logout(String account, String token) {
		logger.info(String.format("%s|%s", account, token));
		// 校验数据合法性 todo

		return userService.logout(account, token);
	}
}