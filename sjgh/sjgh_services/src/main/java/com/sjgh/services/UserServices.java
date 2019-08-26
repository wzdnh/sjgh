package com.sjgh.services;

import com.sjgh.entity.User;

/*
* 用户业务处理接口
*
* */

public interface UserServices {
    //注册时
    void add(User user);
    //编辑
    void edit(User user);

    void editState(Integer user_id, Integer state);

    //修改用户是否完成学生认证
    void editAuthentication(Integer user_id, Integer state);


    //修改用户是否完成押金缴纳
    void editeDeposit(Integer user_id, Integer state);

    void remove(String user_name);
    //登录时调用
    User get(String user_name);
    //List<User> getAll();
}
