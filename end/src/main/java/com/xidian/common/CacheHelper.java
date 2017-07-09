package com.xidian.common;

import java.util.HashMap;
import java.util.Map;

public class CacheHelper {

    private static Map<String, String> map = new HashMap<String, String>();

    public CacheHelper() {
    }

    public static String get(String key) {
        return map.get(key);
    }

    public static void set(String key, String value) {
        map.put(key, value);
    }

    public static void remove(String key) {
        map.remove(key);
    }

}
