package com.xidian.module.user;

import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;

@Service("UserService")
public class UserService implements SampleService {
	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	private Dao dao;

	@Override
	public Map<String, Object> executeSample(Map<String, Object> map) {
		int retCode = dao.executeUpdate("sample", map);
		logger.info("retCode:" + retCode);
		return map;
	}

	public Map<String, Object> register(String account, String password,
			String verifyCode) {
		// 查询是否存在账号 todo

		// 注册用户 todo
		return null;
	}

	public Map<String, Object> login(String account, String password) {
		// 查询用户是否存在 todo

		// 生成token存入数据库

		// 将身份信息存入缓存
		String token = DigestUtils.md5Hex(account);
		return null;
	}

	public Map<String, Object> logout(String account, String token) {
		// 清除缓存

		// 清除数据库
		return null;
	}

}