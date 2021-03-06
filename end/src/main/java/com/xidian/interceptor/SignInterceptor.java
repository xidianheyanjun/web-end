package com.xidian.interceptor;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignInterceptor implements HandlerInterceptor {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[env_mode]}")
    private String env_mode;

    public SignInterceptor() {
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler, ModelAndView arg3)
            throws Exception {
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        logger.info("this.env_mode|" + this.env_mode);
        logger.info("data|" + request.getParameter("data"));
        if ("dev".equals(this.env_mode)) {
            return true;
        }
        logger.info(String.format("%s", request.getParameter("data")));
        String data = request.getParameter("data");
        String sign = request.getParameter("sign");
        if (data == null || "".equals(data)) {
            return true;
        }

        if (sign == null || "".equals(sign)) {
            return false;
        }

        String signData = DigestUtils.shaHex(data);
        if (signData.equals(sign)) {
            return true;
        }
        return false;
    }

}
