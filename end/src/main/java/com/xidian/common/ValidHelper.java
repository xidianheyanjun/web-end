package com.xidian.common;

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
}
