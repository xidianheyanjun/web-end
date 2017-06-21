package com.xidian.sample.controller;

import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// sampleService.executeSample(map);
		return map;
	}

	@RequestMapping(value = "/image", method = { RequestMethod.POST,
			RequestMethod.GET })
	public void image(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String path = request.getSession().getServletContext()
				.getRealPath("image/hawk.png");
		logger.info("image..." + path.toString());
		InputStream is = new FileInputStream(path);
		BufferedImage bi = ImageIO.read(is);
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		ImageIO.write(bi, "png", os);
	}
}