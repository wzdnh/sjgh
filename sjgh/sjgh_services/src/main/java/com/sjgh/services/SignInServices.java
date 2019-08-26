package com.sjgh.services;

import com.sjgh.entity.SignIn;

import java.time.LocalDate;

/**
 * 用户签到记录业务接口
 *
 * */

public interface SignInServices {
    void add(SignIn signIn);
    void removeAll(Integer user_id);
    SignIn getDate(Integer user_id, LocalDate sign_time);
    //得到连续签到次数
    Integer getStatisticalContinuousCheckIn(Integer user_id);
}
