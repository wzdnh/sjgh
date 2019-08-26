package com.sjgh.services.impl;

import com.sjgh.dao.SignInDao;
import com.sjgh.entity.SignIn;
import com.sjgh.services.SignInServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

/**
 * 用户签到记录业务实现类
 *
 *
 *
 * */

@Service("signInServices")
public class SignInServicesImpl implements SignInServices {

    @Autowired
    private SignInDao signInDao;

    public void add(SignIn signIn) {
        signInDao.insert(signIn);
    }

    public void removeAll(Integer user_id) {
        signInDao.deleteAll(user_id);
    }

    @Override
    public SignIn getDate(Integer user_id, LocalDate sign_time) {
        return signInDao.selectDate(user_id, sign_time);
    }

    @Override
    public Integer getStatisticalContinuousCheckIn(Integer user_id) {
        return signInDao.statisticalContinuousCheckIn(user_id);
    }

}
