package com.sjgh.controller;

import com.sjgh.entity.StudentCertification;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 电脑端之
 * 用户个人中心控制器
 */

@Controller("personalCenterController")
@RequestMapping("/center")
public class PersonalCenterController {
    @Autowired
    UserServices userServices;

    @Autowired
    CommentSJDBServices commentSJDBServices;

    @Autowired
    CommentSWZLServices commentSWZLServices;

    @Autowired
    CommentSWJYServices commentSWJYServices;

    @Autowired
    OfficialNewsServices officialNewsServices;

    @Autowired
    AgentEventServices agentEventServices;

    @Autowired
    LostAndFoundServices lostAndFoundServices;

    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;
    @Autowired
    StudentCertificationServices studentCertificationServices;

    //个人中心首页
    @RequestMapping("/list")
    public String list(Map<String, Object> map, HttpSession session) {

        //User user = (User)session.getAttribute("user");
        //map.put("user",userServices.get(user.getUser_name()));
        //map.put("lostAndFoundList", lostAndFoundServices.getAPartBySchool(school_id));
        //map.put("transactionOfThingsList", transactionOfThingsServices.getAPartBySchool(school_id));
        //session中放入首页官方图片路径
        //session.setAttribute("officialPicture", officialPictureServices.getAllBySchool(school_id));
        return "/reception/personal_center";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

    //用户信息页面  查询用户的相关信息
    @RequestMapping(value = "/get_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> getInfo(HttpSession session, @RequestParam(value = "username") String username) {
        //User user = (User) session.getAttribute("user");
        User user = userServices.get(username);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        return map;
    }


    //判断用户是否以学生认证，如果已认证，则回显学生认证的资料
    @RequestMapping(value = "/authentication", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> authentication(HttpSession session, @RequestParam(value = "username") String username) {
        //User user = (User) session.getAttribute("user");
        User user = userServices.get(username);

        Map<String, Object> map = new HashMap<String, Object>();
        //获取已认证的信息
        StudentCertification certification = studentCertificationServices.getAuthentication(user.getUser_id(), Content.getStudentCertification().get(1));
        map.put("flag", certification);
        return map;
    }


    //获取所有的未删除的消息
    @RequestMapping(value = "/get_news", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> getNews(@RequestParam(value = "user_id", required = false) Integer user_id) {
        //User user = (User) session.getAttribute("user");
        //System.out.println("9845454654515");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("official_news", officialNewsServices.getAllByUser_id(user_id));
        map.put("sjdb_news", commentSJDBServices.getAllByUser_id(user_id));
        map.put("swzl_news", commentSWZLServices.getAllByUser_id(user_id));
        map.put("swjy_news", commentSWJYServices.getAllByUser_id(user_id));

        //此处还有执行一项功能，就是修改官方消息的状态码，用户只要打开我的消息页面，则表示官方消息已读，
        //官方消息修改状态码和，其他三个消息不一样，需要传入的是user_id，并且，将此用户下的官方消息都设置为已读
        officialNewsServices.setState(user_id, Content.getCommentState().get(1));

        return map;
    }

    //获取用户发布的任务
    @RequestMapping(value = "/re_get_event", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> getEvent(@RequestParam(value = "state", required = false) Integer state,
                                        HttpSession session) {

        User user =  (User)session.getAttribute("user");

        Map<String, Object> map = new HashMap<String, Object>();
        //System.out.println("************************");
        map.put("sjdb_event", agentEventServices.getUserEvent(user.getUser_id(), state));
        map.put("swzl_event", lostAndFoundServices.getUserEvent(user.getUser_id(), state));
        map.put("swjy_event", transactionOfThingsServices.getUserEvent(user.getUser_id(), state));
        return map;
    }

    //用户点击回复时，修改消息的状态码,然后跳转到对应的详情页面
    @RequestMapping(value = "/reply")
    public String reply(Map<String, Object> map, HttpSession session,
                        @RequestParam(value = "type", required = false) String type,
                        @RequestParam(value = "event_id", required = false) Integer event_id,
                        @RequestParam(value = "comment_id", required = false) Integer comment_id
                        ) {

        if (type.equals("sjdb")) {
           //修改消息状态码
            commentSJDBServices.setState(comment_id, Content.getCommentState().get(1)); //已读
           //去到对应的任务的详情页面
            //System.out.println(comment_id + "-------------" + Content.getCommentState().get(1));
            return "redirect:/re_detail/sjdb?event_id=" + event_id;
        }else if(type.equals("swjy")){
            ////修改消息状态码
            commentSWJYServices.setState(comment_id, Content.getCommentState().get(1)); //已读
            //去到对应的任务的详情页面
            return "redirect:/re_detail/swjy?id=" + event_id;
            //
        }else{
            ////修改消息状态码
            commentSWZLServices.setState(comment_id, Content.getCommentState().get(1)); //已读
            //去到对应的任务的详情页面
            return "redirect:/re_detail/swzl?id=" + event_id;
        }

    }




    //用户获取他接单的任务列表接收
    @RequestMapping(value = "/re_get_receive_event", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> getReceiveEvent(@RequestParam(value = "state", required = false) Integer state,
                                        HttpSession session) {
        User user =  (User)session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        //表示查找状态码为3 的列表，因为3表示已删除
        map.put("sjdb_event", agentEventServices.getReceiveUserEvent(user.getUser_id(), 3));
        map.put("swzl_event", lostAndFoundServices.getReceiveUserEvent(user.getUser_id(), 3));
        map.put("swjy_event", transactionOfThingsServices.getReceiveUserEvent(user.getUser_id(), 3));
        return map;
    }




}
