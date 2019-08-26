package com.sjgh.controller;

import com.sjgh.entity.OfficialNews;
import com.sjgh.entity.StudentCertification;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.*;
import com.sjgh.util.PictureUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*后台管理之
 *
 * 用户控制器类
 *
 * */

@Controller("userController")
@RequestMapping("/user")    //设置下面所有的方法同一路径
public class UserController {

    //注入业务处理对象'
    @Autowired
    private UserServices userServices;

    @Autowired
    private SchoolServices schoolServices;

    @Autowired
    private StudentCertificationServices studentCertificationServices;

    @Autowired
    OfficialNewsServices officialNewsServices;
    @Autowired
    OfficialPictureServices officialPictureServices;

    //修改用户信息,图片不为空时
    @RequestMapping(value = "set_info_img", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map setInfoImg(@RequestParam(value = "img", required = false) MultipartFile file,
                          @RequestParam(value = "username") String username,
                          @RequestParam(value = "address") String address,
                          @RequestParam(value = "sex") String sex,
                          @RequestParam(value = "phone_number") String phone_number,
                          @RequestParam(value = "email") String email,
                          HttpSession session
    ) {
        //修改时，禁止修改电话号码，因为要用电话号码进行用户信息个更新
        Map<String, Integer> map = new HashMap<>();
        User user = new User();
        user.setUser_name(username);
        user.setAddress(address);
        user.setSex(sex);
        user.setPhone_number(phone_number);
        user.setEmail(email);

        /**使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        //图片不为空时，才执行图片的相关操作
        if (!file.isEmpty()) {
            PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
            //完成上传功能
            List list = pictureUploadUtils.upload(file, "\\head_portrait\\user");
            //将工具类返回的真实路径赋值给road
            String road = (String) list.get(0);
            user.setHead_portrait(road);
            //PictureCompression pictureCompression = new PictureCompression();
            //将图片进行压缩，添加水印
            //pictureCompression.googleCompress((String)list.get(1), Content.WaterMarkImgRoad);
            //System.out.println("==================" + list.get(1));
        }

        userServices.edit(user);
        //先将session中user清除，在将user更新
        session.removeAttribute("user");
        session.setAttribute("user", user);
        //System.out.println("=======================" + user.getHead_portrait());
        map.put("flag", 1);
        return map;

    }


    //修改用户信息,图片为空时
    @RequestMapping(value = "set_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map setInfo(@RequestParam(value = "username") String username,
                       @RequestParam(value = "address") String address,
                       @RequestParam(value = "sex") String sex,
                       @RequestParam(value = "phone_number") String phone_number,
                       @RequestParam(value = "email") String email,
                       HttpSession session
    ) {

        Map<String, Integer> map = new HashMap<>();
        User user = new User();
        user.setUser_name(username);
        user.setAddress(address);
        user.setSex(sex);
        user.setPhone_number(phone_number);
        user.setEmail(email);

        //将session中的用户取出，得到他以前的头像路径取出来放入user对象
        User oldUser = (User) session.getAttribute("user");
        user.setHead_portrait(oldUser.getHead_portrait());

        userServices.edit(user);
        //先将session中user清除，在将user更新
        session.removeAttribute("user");
        session.setAttribute("user", user);
        map.put("flag", 1);
        return map;
    }


    //学生认证之提交学生信息控制器
    @RequestMapping(value = "add_certification", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map addCertification(@RequestParam(value = "img", required = false) MultipartFile file,
                                @RequestParam(value = "name") String name,
                                @RequestParam(value = "school_name") String school_name,
                                @RequestParam(value = "student_id") int student_id,
                                HttpSession session
    ) {

        Map<String, Integer> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        Integer user_id = user.getUser_id();
        StudentCertification studentCertification = new StudentCertification();


        studentCertification.setUser_id(user_id);
        studentCertification.setName(name);
        studentCertification.setSchool_id(schoolServices.getId(school_name));
        studentCertification.setStudent_id(student_id);

        /**使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        //图片不为空时，才执行图片的相关操作
        PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
        //完成上传功能
        List list = pictureUploadUtils.upload(file, "\\student_certification");
        //将工具类返回的真实路径赋值给road
        String road = (String) list.get(0);

        studentCertification.setRoad(road);
        studentCertificationServices.add(studentCertification);
        map.put("flag", 1);
        return map;
    }




    //查看一个学校的所有的待验证信息
    @RequestMapping(value = "/get_certification", params = "school_id")
    public String getCertification(int school_id, Map<String, Object> map) {
        //Map<String, List> map = new HashMap<>();
        //查询未处理的学生认证信息
        int state = 0;
        map.put("list", studentCertificationServices.getAll(state, school_id));
        return "/backstage/student_certification_list";
    }



    //处理学生认证信息
    @RequestMapping(value = "/set_certification_state", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map setCertificationState(@RequestParam(value = "id") int id,
                                     @RequestParam(value = "state") int state,
                                     @RequestParam(value = "employee_id") int employee_id,
                                     @RequestParam(value = "user_id") int user_id) {
        Map<String, Integer> map = new HashMap<>();
        //处理学生认证信息
        studentCertificationServices.setState(id, state, employee_id);

        //给用户发送的信息
        OfficialNews officialNews = new OfficialNews();
        officialNews.setTitle("系统提示");
        officialNews.setRoad(officialPictureServices.getRoad(Content.OFFICIAL_News_ID));
        officialNews.setUser_id(user_id);

        //如果同意认证，则修改用户表的学生认证状态码
        if(state == 1){
            userServices.editAuthentication(user_id, Content.getStudentCertification().get(1));
            officialNews.setContent("您已通过学生认证");
        }else{
            userServices.editAuthentication(user_id, Content.getStudentCertification().get(2));
            officialNews.setContent("抱歉，您未通过学生认证，请重新上传认证信息");
        }

        //给用户发送处理的信息
        officialNewsServices.add(officialNews);



        //修改用户状态码，可以判断用户是否登录，
        //userServices.editAuthentication();
        map.put("flag", 1);
        return map;
    }





    /*//查看所有的用户
    @RequestMapping("/list")    //设置此控制器的访问路径
    public String list(Map<String, Object> map){
        map.put("list",userServices.getAll());
        //return "backstage/user_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
        return "/backstage/user_list";
    }*/



}
