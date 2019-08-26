package com.sjgh.services.impl;

/*
 * 用户业务处理实现类
 *
 *
 **/

import com.sjgh.dao.UserDao;
import com.sjgh.entity.User;
import com.sjgh.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userServices")
public class UserServicesImpl implements UserServices {

    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;

    public void add(User user) {
        //设置默认性别为女
        user.setSex("女");
        userDao.insert(user);
    }

    public void remove(String user_name) {

        userDao.delete(user_name);
    }


    public void edit(User user) {
        userDao.update(user);
    }


    //修改用户状态码，可以判断用户是否登录，
    //可以实现禁言，拉黑
    @Override
    public void editState(Integer user_id, Integer state) {
        userDao.updateState(user_id, state);
    }


    //修改用户是否完成学生认证
    @Override
    public void editAuthentication(Integer user_id, Integer state) {
        userDao.updateAuthentication(user_id, state);
    }


    //修改用户是否完成学生认证
    @Override
    public void editeDeposit(Integer user_id, Integer state) {
            userDao.updateDeposit(user_id, state);
    }

    //登录时调用
    public User get(String user_name) {

        return userDao.select(user_name);
    }

    public List<User> getAll() {
        return userDao.selectAll();

    }
    //修改
    //删除


    //查看所有用户
    //查看某一用户的所有信息


}
