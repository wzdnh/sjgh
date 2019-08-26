package com.sjgh.controller;

import com.sjgh.entity.School;
import com.sjgh.services.SchoolServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 后台管理之学校控制器
 *
 * */

@Controller("schoolController")
@RequestMapping("/school")
public class SchoolController {

    //查看所有学校列表
    @Autowired
    private SchoolServices schoolServices;
    @RequestMapping("/list")
    public String list(Map<String, Object> map){
        map.put("list", schoolServices.getAll());
        return "/backstage/school_list";
    }

    //去添加
    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map){
        map.put("school",new School());
        //此处放着做权限校验
        return "/backstage/school_add";
    }

    //添加学校
    //employeeServices处提供默认密码的业务处理，所以这里不用添加密码
    @RequestMapping("/add")
    public String add(School school){
        schoolServices.add(school);
        return "redirect:/school/list";
    }

    //查看详情
    @RequestMapping(value = "/detail", params = "school_id")
    public String get(HttpSession session, Integer school_id){
        session.setAttribute("school",schoolServices.get(school_id));
        //System.out.println("=============================================" + schoolServices.get(school_id));
        return "/backstage/school_detail";
    }

    //去编辑
    @RequestMapping(value = "/to_update",params = "school_id")
    public String toUpdate(Integer school_id,Map<String,Object> map){
        map.put("school",schoolServices.get(school_id));
        return "/backstage/school_update";
    }

    //编辑
    @RequestMapping("/update")
    public String update(School school){
        schoolServices.edit(school);
        return "redirect:/school/list";
    }

    //删除
    @RequestMapping(value = "/remove",params = "school_id")
    public String remove(Integer school_id){
        schoolServices.remove(school_id);
        return "redirect:/school/list";
    }
}

