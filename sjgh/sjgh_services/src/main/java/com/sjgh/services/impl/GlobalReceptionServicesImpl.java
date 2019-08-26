package com.sjgh.services.impl;

import com.sjgh.dao.UserDao;
import com.sjgh.entity.User;
import com.sjgh.services.GlobalReceptionServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/*用户界面之
 *登录注册业务实现类
 *
 * */

@Service("globalReceptionServices")
public class GlobalReceptionServicesImpl implements GlobalReceptionServices {

    @Qualifier("userDao")
    @Autowired
    UserDao userDao;

    //登录,用户名
    public User login(String user_name, String password) {

        User user = userDao.select(user_name);
        //如果不为空，且密码与用户输入的相同，则成功登录
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    //登录，电话
    @Override
    public User loginByPhone(String phone_number, String password) {
        User user = userDao.selectByPhone(phone_number);
        //如果不为空，且密码与用户输入的相同，则成功登录
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    //注册
    public void Register(User user, String password_two) {
        System.out.println("---------------------惆怅长岑长");
        if(password_two != null & password_two.equals(user.getPassword())){
            userDao.insert(user);
        }

    }

    //修改密码
    public void changePassword(User user) {
        userDao.update(user);
    }


}
