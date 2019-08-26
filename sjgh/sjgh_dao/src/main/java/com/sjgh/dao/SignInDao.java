package com.sjgh.dao;

import com.sjgh.entity.SignIn;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

/**
 * 用户签到记录持久化操作
 *
 *
 * */

@Repository("signDao")
public interface SignInDao {

    void insert(SignIn signIn);
    //当不满足条件时，删除该用户的所有记录
    void deleteAll(Integer user_id);
    //输入当前时间，和用户名，查看用户前一天的记录
    SignIn selectDate(@Param("user_id") Integer user_id, @Param("sign_time") LocalDate sign_time);//通过username查询
    //统计用户的记录数
    Integer statisticalContinuousCheckIn(Integer user_id);

}
