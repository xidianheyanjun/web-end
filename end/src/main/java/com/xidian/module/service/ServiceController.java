package com.xidian.module.service;

import com.xidian.common.ResponseHelper;
import com.xidian.common.ValidHelper;
import com.xidian.module.core.CoreService;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ServiceController {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    @Qualifier("ServiceService")
    private ServiceService serviceService;

    @Autowired
    @Qualifier("CoreService")
    private CoreService coreService;

    @RequestMapping(value = "/service/specials/index", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceSpecialsIndex(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("types", serviceService.serviceSpecialsType(paramMap));
        retMap.put("couponsId", "coupons");
        retMap.put("coupons", serviceService.serviceSpecialsCoupons(paramMap));
        retMap.put("marketsId", "markets");
        retMap.put("markets", serviceService.serviceSpecialsMargets(paramMap));
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/service/specials/list", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceSpecialsList(HttpServletRequest request, String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("query", request.getParameter("query"));

        Map<String, Object> map = ResponseHelper.createResponse();
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("list", serviceService.serviceCreditCouponList(paramMap));

        List<Map<String, Object>> pickList = new ArrayList<Map<String, Object>>();
        Map<String, Object> bankMap = new HashMap<String, Object>();
        bankMap.put("list", serviceService.serviceQueryBank(paramMap));
        pickList.add(bankMap);

        Map<String, Object> kindMap = new HashMap<String, Object>();
        kindMap.put("list", serviceService.serviceQueryKind(paramMap));
        pickList.add(kindMap);
        retMap.put("pickList", pickList);
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/service/specials/detail/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceSpecialsDetail(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);

        Map<String, Object> map = ResponseHelper.createResponse();
        int userId = (int) jsonObject.get("userId");
        Map<String, Object> retMap = serviceService.serviceSpecialsDetail(paramMap);
        if (userId < 1) {
            retMap.put("isStar", 0);
        }
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/service/specials/store/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceSpecialsStore(String data, @PathVariable int id) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        int userId = (int) jsonObject.get("userId");
        if (userId < 1) {
            logger.info(String.format("%s|%d|请先登录", userId, id));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请先登录");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        paramMap.put("userId", userId);
        paramMap.put("kind", "credit");
        paramMap.put("path", "#/service/specials/detail/" + id);
        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", serviceService.serviceSpecialsStore(paramMap));
        return map;
    }

    @RequestMapping(value = "/service/zx", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceZx(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        int userId = (int) jsonObject.get("userId");
        String name = (String) jsonObject.get("name");
        String cardNo = (String) jsonObject.get("cardNo");
        if (userId < 1) {
            logger.info(String.format("%s|%s|%s|请先登录", userId, name, cardNo));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请先登录");
        }
        if (StringUtils.isEmpty(name)) {
            logger.info(String.format("%s|%s|%s|请填写姓名", userId, name, cardNo));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请填写姓名");
        }
        if (StringUtils.isEmpty(cardNo)) {
            logger.info(String.format("%s|%s|%s|请填写身份证号", userId, name, cardNo));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请填写身份证号");
        }
        paramMap.put("userId", userId);
        paramMap.put("name", name);
        paramMap.put("cardNo", cardNo);

        Map<String, Object> retMap = null;
        try {
            retMap = serviceService.serviceZx(paramMap);
        } catch (IOException e) {
            logger.info(String.format("%s|%s|%s|error", userId, name, cardNo), e);
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "服务器繁忙");
        }
        String msg = (String) retMap.get("msg");
        if (msg != null && !"".equals(msg)) {
            logger.info(String.format("%s|%s|%s|%s", userId, name, cardNo, msg));
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, msg);
        }

        String content = (String) retMap.get("content");
        JSONObject jsonBean = content == null || "".equals(content) ? new JSONObject() : JSONObject.fromObject(content);
        retMap.put("content", jsonBean);

        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", retMap);
        return map;
    }

    @RequestMapping(value = "/service/zx/checkStatus", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceZxCheckStatus(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String name = (String) jsonObject.get("name");
        String cardNo = (String) jsonObject.get("cardNo");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("name", name);
        paramMap.put("cardNo", cardNo);
        paramMap.put("idType", "0");

        Map<String, Object> map = ResponseHelper.createResponse();
        List<Map<String, Object>> list = serviceService.listUserReport(paramMap);
        if (list.size() == 0) {
            // 注册逻辑
            try {
                JSONObject generateIdObj = coreService.sendMsg2Jdwx("reportregistergenerateUserId", null);
                if (!ValidHelper.validJdwxResponse(generateIdObj)) {
                    logger.info("valid|generateIdObj|failure");
                    return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
                }

                JSONObject resultGenerateId = generateIdObj.getJSONObject("result");
                String userid = resultGenerateId.getString("msg");
                paramMap.put("userid", userid);
                JSONObject captchaObj = coreService.sendMsg2Jdwx("reportRegisterCaptcha", paramMap);
                if (!ValidHelper.validJdwxResponse(captchaObj)) {
                    logger.info("valid|captchaObj|failure");
                    return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
                }
                JSONObject resultCaptchaObj = captchaObj.getJSONObject("result");
                String captchaImg = resultCaptchaObj.getString("msg");
                paramMap.put("captchaImg", captchaImg);
            } catch (IOException e) {
                logger.error(e);
                return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "获取数据异常");
            }
        } else {
            // 登陆和查询过的
        }
        map.put("data", paramMap);
        return map;
    }

    @RequestMapping(value = "/service/zx/captchaCode", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceZxCaptchaCode(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String name = (String) jsonObject.get("name");
        String userid = (String) jsonObject.get("userid");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("name", name);
        paramMap.put("userid", userid);
        Map<String, Object> map = ResponseHelper.createResponse();
        try {
            JSONObject captchaObj = coreService.sendMsg2Jdwx("reportRegisterCaptcha", paramMap);
            if (!ValidHelper.validJdwxResponse(captchaObj)) {
                logger.info("valid|generateIdObj|failure");
                return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
            }

            JSONObject result = captchaObj.getJSONObject("result");
            map.put("data", result);
        } catch (IOException e) {
            logger.error(e);
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "获取唯一标识异常");
        }
        return map;
    }

    @RequestMapping(value = "/service/zx/mobileCode", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceZxMobileCode(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String name = (String) jsonObject.get("name");
        String userid = (String) jsonObject.get("userid");
        String mobileTel = (String) jsonObject.get("mobileTel");
        if (!ValidHelper.isMobile(mobileTel)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "手机号格式不正确");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("name", name);
        paramMap.put("userid", userid);
        paramMap.put("mobileTel", mobileTel);
        try {
            JSONObject mobileObj = coreService.sendMsg2Jdwx("ReportgetMobileVerifyCode", paramMap);
            if (!ValidHelper.validJdwxResponse(mobileObj)) {
                logger.info("valid|generateIdObj|failure");
                return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
            }

            JSONObject resultGenerateId = mobileObj.getJSONObject("result");
            JSONObject msg = resultGenerateId.getJSONObject("msg");
            String tcId = msg.getString("tcId");
            paramMap.put("tcId", tcId);
        } catch (IOException e) {
            logger.error(e);
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "获取唯一标识异常");
        }
        Map<String, Object> map = ResponseHelper.createResponse();
        map.put("data", paramMap);
        return map;
    }

    @RequestMapping(value = "/service/jdwx/register", method = {RequestMethod.POST})
    @ResponseBody
    public Object serviceJdwxRegister(String data) {
        JSONObject jsonObject = JSONObject.fromObject(data);
        String name = (String) jsonObject.get("name");
        String userid = (String) jsonObject.get("userid");
        String mobileTel = (String) jsonObject.get("mobileTel");
        if (!ValidHelper.isMobile(mobileTel)) {
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "手机号格式不正确");
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        try {
            JSONObject generateIdObj = coreService.sendMsg2Jdwx("reportregistergenerateUserId", null);
            if (!ValidHelper.validJdwxResponse(generateIdObj)) {
                logger.info("valid|generateIdObj|failure");
                return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "请求数据异常");
            }

            JSONObject resultGenerateId = generateIdObj.getJSONObject("result");
            String userId = resultGenerateId.getString("msg");
        } catch (IOException e) {
            logger.error(e);
            return ResponseHelper.createResponse(ResponseHelper.CODE_FAILURE, "获取唯一标识异常");
        }
        return ResponseHelper.createResponse();
    }
}