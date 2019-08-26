package com.sjgh.controller;

import com.sjgh.entity.Employee;
import com.sjgh.services.EmployeeServices;
import com.sjgh.services.SchoolServices;
import com.sjgh.util.PictureUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/*
 *后台管理控制器类
 *        员工控制器类
 *
 *
 * */

@Controller("employeeController")
@RequestMapping("/employee")
public class EmployeeController {

    //注入业务处理对象
    @Autowired
    private EmployeeServices employeeServices;
    @Autowired
    private SchoolServices schoolServices;

    //去添加
    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map){
        map.put("employee",new Employee());
        //此处放着做权限校验
        return "/backstage/employee_add";
    }

    //添加员工
    //employeeServices处提供默认密码的业务处理，所以这里不用添加密码
    @RequestMapping("/add")
    public String add(Employee employee){
        //先将员工输入的学校名称变为id
        //获取管理员输入的学校名字，然后去查找id
        employee.setSchool_id(schoolServices.getId(employee.getSchool_er().getSchool_name()));
        employeeServices.add(employee);
        return "redirect:/employee/to_file_update?employee_id=" + employee.getEmployee_id();
    }


    /**====Root级权限
     *
     *查看一个所有员工
     *大管理员才可以查看多有员工
     **/
    @RequestMapping("/list")    //设置此控制器的访问路径
    public String list(Map<String, Object> map){
        map.put("list",employeeServices.getAll());
        return "/backstage/employee_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

    /*
     *查看
     *一个学校范围内所有员工
     *大管理员才可以查看多有员工
     */
    @RequestMapping(value = "/listBySchool", params = "school_id")    //设置此控制器的访问路径
    public String list(Integer school_id, Map<String, Object> map){
        map.put("list",employeeServices.getAllBySchool(school_id));
        return "/backstage/employee_list";     //转发到jsp;配置视图解析器时已设置前缀和后缀
    }

    //查看员工详细信息
    @RequestMapping(value = "/employee_detail", params = "employee_id")
    public String get(HttpSession session, int employee_id){
        //要区别于登录者，登录者的信息也是放在session中，所以不能再叫employee
        session.setAttribute("employeeForE",employeeServices.get(employee_id));
        return "/backstage/employee_detail";
    }

    //去修改信息
    @RequestMapping(value = "/to_update",params = "employee_id")
    public String toUpdate(int employee_id,Map<String,Object> map){
        map.put("employee",employeeServices.get(employee_id));
        return "/backstage/employee_update";
    }

    //修改信息
    @RequestMapping("/update")
    public String update(Employee employee){
        //获取管理员输入的学校名字，然后去查找id
        employee.setSchool_id(schoolServices.getId(employee.getSchool_er().getSchool_name()));
        employeeServices.edit(employee);
        return "redirect:/employee/list";
    }


    /*去上传头像
     *
     * */
    @RequestMapping(value = "/to_file_update", params = "employee_id")
    public String toFileUpload(HttpSession session, Map<String, Object> map, int employee_id){
        Employee employee = new Employee();
        map.put("employee",new Employee());
        employee.setEmployee_id(employee_id);
        //return "/backstage/employee_file_update?employee_id =" + employee.getEmployee_id();
        session.setAttribute("employee_id", employee_id);
        return "/backstage/employee_file_update";
    }

    /* 上传文件处理
     *用@RequestParam注解来指定表单上的file为MultipartFile
     *
     * @param file
     * @return
     */
    @RequestMapping(value ="/file_upload", method = RequestMethod.POST)
    public String fileUpload(@RequestParam(value ="head_portrait", required = false) MultipartFile file, HttpSession session, HttpServletRequest request) {
        /*使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        PictureUploadUtils uploadUtils = new PictureUploadUtils();
        //将工具类返回的真实路径赋值给head_portrait
        //String head_portrait = uploadUtils.upload(file);

        Employee employee = new Employee();
        //employee.setHead_portrait(head_portrait);
        //先将id从session中取出，然后转为string在转换为int
        int employee_id = Integer.parseInt(String.valueOf(session.getAttribute("employee_id")));
        employee.setEmployee_id(employee_id);
        //执行业务
        employeeServices.editHeadPortrait(employee);

        return "redirect:/employee/list";
    }


    //删除员工
    @RequestMapping(value = "/remove",params = "employee_id")
    public String remove(int employee_id){
        employeeServices.remove(employee_id);
        return "redirect:/employee/list";
    }


}
