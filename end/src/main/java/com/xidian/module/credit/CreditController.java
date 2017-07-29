package com.xidian.module.credit;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;
import com.xidian.common.ResponseHelper;
import com.xidian.module.core.CoreService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CreditController {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[credit_url]}")
    private String credit_url;

    @Autowired
    @Qualifier("CreditService")
    private CreditService creditService;

    @RequestMapping(value = "/credit/receive", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Object creditReceive(String content) {
        logger.info("creditReceive|" + content);
        return ResponseHelper.createResponse();
    }
}