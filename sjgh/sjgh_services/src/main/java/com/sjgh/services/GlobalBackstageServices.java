package com.sjgh.services;

import com.sjgh.entity.Employee;

/*
 * 后台登录修改密码业务接口
 * */

public interface GlobalBackstageServices {
    //登录
    Employee login(int employee_id, String password);
    //修改密码
    void changePassword(Employee employee);
}
