package com.sjgh.controller;

import com.sjgh.services.AdvertisementServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller("advertisement")
@RequestMapping("/advertisement")
public class AdvertisementController {

    @Autowired
    AdvertisementServices advertisementServices;

    @RequestMapping("/list")    //设置此控制器的访问路径
    public String list(Map<String, Object> map){
        map.put("list",advertisementServices.getAll());
        return "/backstage/advertisement_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }
}
