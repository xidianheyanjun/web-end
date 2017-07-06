package com.xidian.common;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by heyanjun on 17-7-6.
 */
public class ResponseHelper {
    public static String CODE_SUCCESS = "success";
    public static String CODE_FAILURE = "failure";
    public static String MSG_SUCCESS = "成功";
    public static String MSG_FAILURE = "失败";

    public static Map<String, Object> createResponse() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", CODE_SUCCESS);
        map.put("msg", MSG_SUCCESS);
        return map;
    }

    public static Map<String, Object> createResponse(String code, String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", code);
        map.put("msg", msg);
        return map;
    }
}
