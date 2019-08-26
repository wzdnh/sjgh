package com.sjgh.controller;

import com.sjgh.services.GlobalBackstageServices;
import com.sjgh.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/*赏金工会后台管理
*
* 登录的控制器
*
* */

@Controller("globalBackstageController")
public class GloablBackstageController {
    @Autowired
    private GlobalBackstageServices globalBackstageServices;

    //去登陆控制器
    @RequestMapping("/to_login")
    public String toLogin(){

        return "/backstage/login";
    }

    // 这里有多个参数，得用注解，表明这两个参数都是用来接收用户信息的
    //此处直接声明session对象，然后springmvc会自动注入，然后就可以使用session对象了
    //登录控制器
    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam int employee_id, @RequestParam String password){
        Employee employee = globalBackstageServices.login(employee_id, password);
        //如果为空，则登录失败
        if (employee == null) {
            //redirect重定向
            return "redirect:to_login";
        }
        //session中放置employee对象
        session.setAttribute("employee",employee);
        return "redirect:/self";
    }

    //登录成功后跳转到个人信息界面
    @RequestMapping("/self")
    public String self(){

        return "/backstage/self";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("employee",null);
        return "redirect:/to_login";
    }

    //去修改密码
    @RequestMapping("/to_change_password")
    public String toChangePassword(){
        return "/backstage/change_password";
    }

    @RequestMapping("/change_password")
    public String changePassword(HttpSession session, @RequestParam String old, @RequestParam String new1 ,@RequestParam String new2){
        Employee employee = (Employee)session.getAttribute("employee");
        if(employee.getPassword().equals(old)){
            if(new1.equals(new2)){
                employee.setPassword(new1);
                globalBackstageServices.changePassword(employee);
                return "redirect:/self";//重定向到访问self
            }
        }
        return "redirect:to_change_password";
    }

}
