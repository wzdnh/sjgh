package com.sjgh.controller.mb;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjgh.entity.AgentEvent;
import com.sjgh.entity.LostAndFound;
import com.sjgh.entity.TransactionOfThings;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.AgentEventServices;
import com.sjgh.services.LostAndFoundServices;
import com.sjgh.services.TransactionOfThingsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 手机端二级页面控制器
 *
 * 每个方法都加上了ifelse判断，为了让没有登录的用户也可以进入二级界面
 * 如果用户没有登录，默认进入天津商业大学的信息板块
 */

@Controller("mbReceptionSecondLevelController")
@RequestMapping("/mb_seconds")
public class ReceptionSecondLevelController {

    @Autowired
    AgentEventServices agentEventServices;
    @Autowired
    LostAndFoundServices lostAndFoundServices;
    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;

    //默认学校id为9，进去添加商业大学信息模块
    private Integer school_id = Content.SCHOOL_ID;

    //第一次进入事件代办二级页面
    @RequestMapping("/sjdb_page")
    public String sjdbPage(HttpSession session) {
        //获取分页的信息，传递给页面
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        } else {
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        }
        return "/reception/mb/msjdb";
    }

    //事件代办之上滑进行翻页
    @RequestMapping(value = "/sjdb", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> sjdbList(@RequestParam(value = "currentPage") int currentPage, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("agentEvent", list);
            return map;
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("agentEvent", list);
            return map;
        }

    }


    //第一次进入失物招领二级页面
    @RequestMapping("/swzl_page")
    public String swzlPage(HttpSession session) {
        //获取分页的信息，传递给页面
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<LostAndFound> list = lostAndFoundServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<LostAndFound> list = lostAndFoundServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        }

        return "/reception/mb/mswzl";
    }

    //失物招领之点击加载更多，传入页码，返回想干内容
    @RequestMapping(value = "/swzl", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swzlList(@RequestParam(value = "currentPage") int currentPage, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List<LostAndFound> list = lostAndFoundServices.getAllBySchool(school_id);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("lostAndFound", list);
            return map;
        }else{
            Integer school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List<LostAndFound> list = lostAndFoundServices.getAllBySchool(school_id);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("lostAndFound", list);
            return map;
        }

    }

    //第一次进入事物交易二级页面
    @RequestMapping("/swjy_page")
    public String swjyPage(HttpSession session) {
        //获取分页的信息，传递给页面
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.getAllBySchool(school_id);
            PageInfo pageInfo = new PageInfo(list);
            session.setAttribute("pageInfo", pageInfo);
        }

        return "/reception/mb/mswjy";
    }

    //事物交易之点击加载更多，传入页码，返回想干内容
    @RequestMapping(value = "/swjy", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swjyList(@RequestParam(value = "currentPage") int currentPage, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.getAllBySchool(school_id);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("transactionOfThings", list);
            return map;
        }else {
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.getAllBySchool(school_id);

            Map<String, Object> map = new HashMap<String, Object>();

            map.put("transactionOfThings", list);
            return map;
        }

    }


}
