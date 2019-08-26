package com.sjgh.controller;


import com.sjgh.entity.Employee;
import com.sjgh.entity.OfficialPicture;
import com.sjgh.services.AdvertisementServices;
import com.sjgh.services.EmployeeServices;
import com.sjgh.services.OfficialPictureServices;
import com.sjgh.services.SchoolServices;
import com.sjgh.util.PictureUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

/*官方图片、广告控制器
 *
 *
 * */
@Controller("officialPictureController")
@RequestMapping("/officialPicture")
public class OfficialPictureController {

    @Autowired
    OfficialPictureServices officialPictureServices;
    @Autowired
    EmployeeServices employeeServices;
    @Autowired
    SchoolServices schoolServices;
    @Autowired
    AdvertisementServices advertisementServices;

    /**====Root级权限
     *
     *查看所有官方图片，广告
     *大管理员才可以查看多有员工
     **/
    @RequestMapping("/list")    //设置此控制器的访问路径
    public String list(Map<String, Object> map){
        map.put("list",officialPictureServices.getAll());
        return "/backstage/official_picture_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

    /*
     *查看
     *一个学校范围内所有员工
     *大管理员才可以查看多有员工
     */
    @RequestMapping(value = "/listBySchool", params = "school_id")    //设置此控制器的访问路径
    public String list(Integer school_id, Map<String, Object> map){
        map.put("list",officialPictureServices.getAllBySchool(school_id));
        return "/backstage/official_picture_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

    @RequestMapping(value = "/detail", params = "picture_id")
    public String getPictureDetail(int picture_id, HttpSession session){
        session.setAttribute("picture", officialPictureServices.get(picture_id));;
        return "/backstage/official_picture_detail";

    }


    /*去修改信息
     *
     * */
    //去修改信息
    @RequestMapping(value = "/to_update",params = "picture_id")
    public String toUpdate(int picture_id,Map<String,Object> map){
        map.put("officialPicture",officialPictureServices.get(picture_id));
        return "/backstage/official_picture_info_update";
    }

    //修改信息，然后去到上传图片界面
    @RequestMapping("/update")
    public String update(OfficialPicture officialPicture, HttpSession session){
        //School school = schoolServices.getId(officialPicture.getSchool_er().getSchool_name());//获取管理员输入的学校名字，然后去查找id
        //officialPicture.setSchool_id(school.getSchool_id());
        //此处将修改人的id放入；完成记录修改人这个功能
        Employee employee = (Employee) session.getAttribute("employee");
        officialPicture.setEmployee_id(employee.getEmployee_id());
        officialPicture.setSchool_id(employee.getSchool_id());
        //System.out.println(employee.getEmployee_id()+ "====" + employee.getSchool_id() + "================================");
        officialPictureServices.edit(officialPicture);
        session.setAttribute("officialPicture", officialPicture);
        return "/backstage/official_picture_update";
    }


    /* 上传文件处理
     *用@RequestParam注解来指定表单上的file为MultipartFile
     *
     */
    @RequestMapping(value ="/official_picture_upload", method = RequestMethod.POST)
    public String fileUpload(@RequestParam(value ="road", required = false) MultipartFile file, HttpSession session) {
        /*使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
        //将工具类返回的真实路径赋值给head_portrait
        String road = (String) pictureUploadUtils.upload(file, "\\official_imgs").get(0);

        //将/update放入session里的officialPicture取出
        OfficialPicture officialPicture = (OfficialPicture) session.getAttribute("officialPicture");;
        officialPicture.setRoad(road);

        //执行业务
        officialPictureServices.editPicture(officialPicture);
        return "redirect:/officialPicture/list";
    }


}
