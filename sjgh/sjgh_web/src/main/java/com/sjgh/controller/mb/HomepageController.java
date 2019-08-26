package com.sjgh.controller.mb;

/**
 *
 * 手机端主页控制器
 *
 * */

import com.sjgh.global.Content;
import com.sjgh.services.AgentEventServices;
import com.sjgh.services.LostAndFoundServices;
import com.sjgh.services.OfficialPictureServices;
import com.sjgh.services.TransactionOfThingsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller("mbHomepageController")
@RequestMapping("/mb_home")
public class HomepageController {
    @Autowired
    AgentEventServices agentEventServices;

    @Autowired
    LostAndFoundServices lostAndFoundServices;

    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;
    @Autowired
    OfficialPictureServices officialPictureServices;

    @RequestMapping("/list")
    public String  list(Map<String, Object> map, HttpSession session){
        //设置学校默认值是9
        Integer school_id = Content.SCHOOL_ID;
        map.put("agentEventList",agentEventServices.getAPartBySchool(school_id));
        map.put("lostAndFoundList", lostAndFoundServices.getAPartBySchool(school_id));
        map.put("transactionOfThingsList", transactionOfThingsServices.getAPartBySchool(school_id));
        //session中放入首页官方图片路径
        session.setAttribute("officialPicture", officialPictureServices.getAllBySchool(school_id));
        return "/reception/mb/mindex";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

}
