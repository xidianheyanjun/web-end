package com.xidian.module.service;

import com.xidian.common.ResponseHelper;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
        map.put("data", serviceService.serviceSpecialsDetail(paramMap));
        return map;
    }
}