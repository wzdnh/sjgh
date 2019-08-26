package com.sjgh.controller;

import com.sjgh.entity.SignIn;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.*;
import com.sjgh.util.RandomVerificationCode;
import com.sjgh.util.ShortMessageServicesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 * 前台页面之
 * 登录-注册控制器
 *
 * 此控制还包括查询用户的消息总数
 */

@Controller("globalReceptionController")
public class GlobalReceptionController {

    @Autowired
    private GlobalReceptionServices globalReceptionServices;
    @Autowired
    private SchoolServices schoolServices;
    @Autowired
    private SignInServices signInServices;

    @Autowired
    private UserServices userServices;

    @Autowired
    private InvitationCodeServices invitationCodeServices;

    @Autowired
    OfficialPictureServices officialPictureServices;

    @Autowired
    CommentSJDBServices commentSJDBServices;
    @Autowired
    CommentSWJYServices commentSWJYServices;
    @Autowired
    CommentSWZLServices commentSWZLServices;
    @Autowired
    OfficialNewsServices officialNewsServices;


    // 这里有多个参数，得用注解，表明这两个参数都是用来接收用户信息的
    //此处直接声明session对象，然后springmvc会自动注入，然后就可以使用session对象了
    //登录控制器
    @RequestMapping(value = "/re_login", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map login(HttpSession session,
                     @RequestParam("username") String user_name,
                     @RequestParam("phone_number") String phone_number,
                     @RequestParam("password") String password) {
        User userByname = globalReceptionServices.login(user_name, password);
        User userByPhone = globalReceptionServices.loginByPhone(phone_number, password);
        User user = null;
        //如果为空，则登录失败
        Map map = new HashMap();
        if (userByname == null & userByPhone == null) {
            //0表示登录失败
            map.put("flag", "0");
            //System.out.println("-------------------------------------------");
            return map;
        } else {

            //修改用户状态码为已登录(1: 表示已登录)
            //userServices.editState(user_name, 1);
            //判断用户是通过何种方式登录的，将相应的user对象传递给前台
            if (userByname == null) {
                //此处放入用户名传递给前台
                map.put("user", userByPhone);
                //session中放置user对象
                session.setAttribute("user", userByPhone);
                //将用户对象传递到下面，进行签到处理
                user = userByPhone;
                //此处消息数总数
                Integer sum = commentSJDBServices.getSum(0, user.getUser_id()) + commentSWJYServices.getSum(0, user.getUser_id()) + commentSWZLServices.getSum(0, user.getUser_id()) + officialNewsServices.getSum(0, user.getUser_id());
                map.put("sum", sum);
            } else {
                //此处放入用户名传递给前台
                map.put("user", userByname);
                //session中放置user对象
                //先清空,防止刷新不及时
                session.removeAttribute("user");
                session.setAttribute("user", userByname);
                //将用户对象传递到下面，进行签到处理
                user = userByname;
                //此处消息数总数
                Integer sum = commentSJDBServices.getSum(0, user.getUser_id()) + commentSWJYServices.getSum(0, user.getUser_id()) + commentSWZLServices.getSum(0, user.getUser_id()) + officialNewsServices.getSum(0, user.getUser_id());
                map.put("sum", sum);
            }

            //此处消息数总数
            Integer sum = commentSJDBServices.getSum(0, user.getUser_id()) + commentSWJYServices.getSum(0, user.getUser_id()) + commentSWZLServices.getSum(0, user.getUser_id()) + officialNewsServices.getSum(0, user.getUser_id());
            session.setAttribute("sum", sum);
            System.out.println("=====================" + sum);

            //获取昨日日期
            LocalDate old_time = LocalDate.now().minusDays(1);
            //获得今日日期
            LocalDate now_time = LocalDate.now();
            SignIn signIn = new SignIn();


            //查询用户昨日是否有登录记录，如果有，则添加今日的登录签到记录
            Integer user_id = user.getUser_id();
            if (signInServices.getDate(user_id, old_time) != null) {
                if (signInServices.getDate(user_id, now_time) == null) {
                    signIn.setUser_id(user_id);
                    signIn.setSign_time(now_time);
                    signInServices.add(signIn);
                    /*System.out.println("今日连续签到成功");*/
                    //传出1：表示登录，签到成功
                    map.put("flag", "1");
                    return map;
                } else {
                    /*System.out.println("已签到，登录成功");*/
                    //传出2：表示登录，签到成功
                    map.put("flag", "2");
                    //System.out.println("=============" + map.get("username"));
                    return map;
                }

            } else {
                //说明用户昨日没有登录，属于断签状态，删除该用户所有的登录记录后，再添加今日的签到记录
                signInServices.removeAll(user_id);
                signIn.setUser_id(user_id);
                signIn.setSign_time(now_time);
                signInServices.add(signIn);
                /*System.out.println("断签，但是今日签到成功");*/
                //登录成功，签到成功，签到为1
                map.put("flag", "3");
                /*System.out.println("=============" + map.get("flag"));*/
                return map;
            }

        }

    }


    /**
     * 注册时获得验证码
     */
    @RequestMapping(value = "/re_get_code", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map register(@RequestParam("username") String username,
                        @RequestParam("phone_number") String phone_number,
                        HttpSession session) throws Exception {

        //获取随机验证码
        String code = RandomVerificationCode.getCode();
        //在session中放入随机邀请码，并设定过期时间，过期后，用户需重新获取邀请码
        //先清空，防止更新不及时的情况
        session.removeAttribute("code");
        session.setAttribute("code", code);
        //设置此验证码的过期时间为5分钟
        session.setMaxInactiveInterval(5 * 60);
        //向用户发送验证码
        ShortMessageServicesUtil.sendSms(phone_number, code);
        Thread.sleep(3000L);

        Map map = new HashMap();
        map.put("code", code);
        return map;
    }


    /**
     * 注册控制器
     */
    @RequestMapping(value = "/re_register", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map register(@RequestParam("school_name") String school_name,
                        @RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("password_ok") String password_ok,
                        @RequestParam("invitation_code") Integer invitation_code,
                        @RequestParam("phone_number") String phone_number,
                        @RequestParam("verification_code") String verification_code,
                        HttpSession session) {
        System.out.println(password);
        System.out.println(password_ok);
        Map map = new HashMap();
        String code = (String) session.getAttribute("code");
        if (username.equals(null) | password.equals(null) | password_ok.equals(null) | phone_number.equals(null) | verification_code.equals(null)) {
            map.put("flag", 0);  //"请完整填写信息"
        } else if (!password.equals(password_ok)) {
            map.put("flag", 1);  //"密码错误"
        } else if (!verification_code.equals(code)) {
            map.put("flag", 2); //"邀请码错误"
        } else {

            User user = new User();

            user.setUser_name(username);
            user.setPhone_number(phone_number);
            user.setSchool_id(schoolServices.getId(school_name));
            user.setPassword(password);

            //插入默认的头像
            user.setHead_portrait(officialPictureServices.getRoad(Content.HEAD_PORTRAIT_ID));

            //注册
            userServices.add(user);
            if (!invitation_code.equals(null)) {
                //向邀请表插入一条记录
                invitationCodeServices.add(invitation_code);
            }

            map.put("flag", 3);  //"注册成功"
            //向数据库查询用户对象，传递给前台
            User userBySQL = userServices.get(username);
            session.setAttribute("user", userBySQL);
        }


        return map;
    }


    //退出登录
    @RequestMapping("/re_quit")
    public String quit(HttpSession session) {
        session.removeAttribute("user");
        //session.setAttribute("user", null);
        return "redirect:/home/list";
    }



    /**
     * 动态获取消息数
     */
    @RequestMapping(value = "/re_get_news_num", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map getNewsNum(HttpSession session) {

        User user = (User)session.getAttribute("user");
        Map map = new HashMap();
        //此处消息数总数
        Integer sum = commentSJDBServices.getSum(Content.getCommentState().get(0), user.getUser_id()) + commentSWJYServices.getSum(Content.getCommentState().get(0), user.getUser_id()) + commentSWZLServices.getSum(Content.getCommentState().get(0), user.getUser_id()) + officialNewsServices.getSum(Content.getCommentState().get(0), user.getUser_id());
        map.put("sum", sum);
        return map;
    }



    //修改密码
    /*@RequestMapping("/re_change_password")
    public String changePassword(HttpSession session, @RequestParam String old, @RequestParam String new1 , @RequestParam String new2){
        User user = (User)session.getAttribute("user");
        if(user.getPassword().equals(old)){
            if(new1.equals(new2)){
                user.setPassword(new1);
                globalReceptionServices.changePassword(user);
                //重定向到访问个人中心
                return "redirect:/self";
            }
        }
        return "redirect:re_to_change_password";
    }*/


    /*//去修改密码
    @RequestMapping("/re_to_change_password")
    public String toChangePassword(){
        return "/reception/change_password";
    }*/

    //去登陆控制器
    /*@RequestMapping("/to_re_login")
    public String toLogin() {

        return "/reception/login_register";
    }*/

}

