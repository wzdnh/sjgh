package com.sjgh.services;

import com.sjgh.entity.User;

public interface GlobalReceptionServices {
    //登录通过用户名
    User login(String user_name, String password);
    //登录，通过电话号码
    User loginByPhone(String phone_number, String password);
    //注册
    //需要传入确认密码password_two
    void Register(User user, String password_two);

    //修改密码
    void changePassword(User user);

}
