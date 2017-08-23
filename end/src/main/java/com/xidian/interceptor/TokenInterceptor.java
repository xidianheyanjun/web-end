package com.xidian.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TokenInterceptor implements HandlerInterceptor {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[env_mode]}")
    private String env_mode;

    public TokenInterceptor() {
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
        if ("dev".equals(this.env_mode)) {
            return true;
        }

        /*JSONObject jsonObject = JSONObject.fromObject(data);
        int userId = (int) jsonObject.get("userId");
        String token = (String) jsonObject.get("token");
        if (userId < 1 || StringUtils.isEmpty(token) || !coreService.isLogin(String.valueOf(userId), token)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "用户未登录");
        }*/
        return true;
    }

}
