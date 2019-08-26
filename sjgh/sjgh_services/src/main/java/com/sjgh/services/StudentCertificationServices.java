package com.sjgh.services;


import com.sjgh.entity.StudentCertification;

import java.util.List;

/**
 *
 * 学生认证业务接口
 *
 * */
public interface StudentCertificationServices {

    void add(StudentCertification studentCertification);
    //更新状态，需要传入id
    void setState(int id, int state, int employee_id);

    //查看所有的待处理的学生的认证信息
    List<StudentCertification> getAll(int state, int school_id);

    //查询用户已认证的记录，如果有，则用户已登录，判断用户是否已登录
    StudentCertification getAuthentication(Integer user_id, Integer state);
}
