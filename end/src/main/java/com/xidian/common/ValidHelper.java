package com.xidian.common;

import net.sf.json.JSONObject;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidHelper {
    public static boolean isNumber(String str) {
        if (str == null || "".equals(str)) {
            return false;
        }
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        return isNum.matches();
    }

    public static boolean isMobile(String mobile) {
        if (mobile == null || "".equals(mobile)) {
            return false;
        }
        Pattern p = Pattern.compile("^(1)\\d{10}$");
        Matcher m = p.matcher(mobile);
        return m.matches();
    }

    public static boolean validJdwxResponse(JSONObject jsonObj) {
        String code = jsonObj.getString("code");
        if (!"10000".equals(code)) {
            return false;
        }

        JSONObject result = jsonObj.getJSONObject("result");
        if (!result.getBoolean("result")) {
            return false;
        }

        return true;
    }

    public static boolean validReportResponse(JSONObject jsonObj) {
        String code = jsonObj.getString("code");
        if (!"10000".equals(code)) {
            return false;
        }

        JSONObject result = jsonObj.getJSONObject("result");
        int appCode = result.getInt("code");
        if (appCode != 0) {
            return false;
        }

        return true;
    }
}
