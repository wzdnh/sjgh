package com.sjgh.dao;

import com.sjgh.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 *       前端操作之
 * 用户持久化操作对象接口
 *     声明对应的持久化操作方法
 *
 * */

@Repository("userDao")//对dao实现类进行注解
public interface UserDao {
    //注册时
    void insert(User user);

    User select(String user_name);//通过username查询

    //User selectById(Integer id);//通过id来查询，主要是防止修改用户名时，session更新不及时的问题

    User selectByPhone(String phone_number);//通过电话号码来查询

    List<User> selectAll();//查询所有用户

    void update(User user);

    //修改用户状态码
    void updateState(@Param("user_id") Integer user_id, @Param("state") Integer state);

    //修改用户是否完成学生认证
    void updateAuthentication(@Param("user_id") Integer user_id, @Param("state") Integer state);

    //修改用户是否完成押金缴纳
    void updateDeposit(@Param("user_id") Integer user_id, @Param("state") Integer state);




    void delete(String username);
    //List<User> selectByDepartmentAndPost(@Param("dsn") String dsn, @Param("post") String post);



}
