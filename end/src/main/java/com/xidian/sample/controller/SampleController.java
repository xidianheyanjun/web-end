package com.xidian.sample.controller;

import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xidian.common.RsaHelper;
import com.xidian.sample.service.SampleService;

@Controller
public class SampleController {
	private Logger logger = Logger.getLogger(getClass());

	private String server_url = "http://localhost:8280/resource/upload/pic";

	private String token = "v@#$%^v";

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

	@RequestMapping(value = "/upload/image", method = { RequestMethod.POST })
	@ResponseBody
	public Object uploadImage(
			@RequestParam(value = "file", required = false) MultipartFile file)
			throws IOException, ClassNotFoundException, InvalidKeyException,
			NoSuchAlgorithmException, NoSuchPaddingException,
			IllegalBlockSizeException, BadPaddingException {
		logger.info("server_url:" + this.server_url);

		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(this.server_url);
		MultipartEntityBuilder builder = MultipartEntityBuilder.create();
		ObjectInputStream publicKeyOis = new ObjectInputStream(this.getClass()
				.getResourceAsStream(
						"/config/key/publickey-1497962670186.keystore"));
		Key publicKey = (Key) publicKeyOis.readObject();
		publicKeyOis.close();
		RsaHelper rsaHelper = new RsaHelper();
		String cryptData = rsaHelper.encrypt(this.token, publicKey);
		builder.addBinaryBody("file", file.getInputStream(),
				ContentType.MULTIPART_FORM_DATA, file.getOriginalFilename());// 文件流
		builder.addTextBody("filename", file.getOriginalFilename());// 类似浏览器表单提交，对应input的name和value
		builder.addTextBody("password", cryptData);
		HttpEntity entity = builder.build();
		httpPost.setEntity(entity);
		HttpResponse response = httpClient.execute(httpPost);// 执行提交
		HttpEntity responseEntity = response.getEntity();
		logger.info("responseEntity:" + responseEntity.toString());
		// 将响应内容转换为字符串
		String result = EntityUtils.toString(responseEntity,
				Charset.forName("UTF-8"));
		logger.info("result:" + result);
		JSONObject jsonBean = JSONObject.fromObject(result);
		httpClient.close();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", jsonBean.get("id"));
		return map;
	}
}