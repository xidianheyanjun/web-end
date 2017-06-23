package com.xidian.module.gb;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xidian.dataAccess.Dao;
import com.xidian.sample.service.SampleService;

@Service("GbService")
public class GbService implements SampleService {
	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	private Dao dao;

	@Override
	public Map<String, Object> executeSample(Map<String, Object> map) {
		int retCode = dao.executeUpdate("sample", map);
		logger.info("retCode:" + retCode);
		return map;
	}

}