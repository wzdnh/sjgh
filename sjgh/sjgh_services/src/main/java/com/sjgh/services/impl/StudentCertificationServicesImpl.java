package com.sjgh.services.impl;

import com.sjgh.dao.StudentCertificationDao;
import com.sjgh.entity.StudentCertification;
import com.sjgh.services.StudentCertificationServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("studentCertificationServices")
public class StudentCertificationServicesImpl implements StudentCertificationServices {
    @Qualifier("studentCertificationDao")
    @Autowired
    StudentCertificationDao studentCertificationDao;

    @Override
    public void add(StudentCertification studentCertification) {
        //业务需要，默认状态为0
        studentCertification.setState(0);
        studentCertificationDao.insert(studentCertification);
    }

    @Override
    public void setState(int id, int state, int employee_id) {
        studentCertificationDao.updateState(id, state, employee_id);
    }

    @Override
    public List<StudentCertification> getAll(int state, int school_id) {
        return studentCertificationDao.selectAll(state, school_id);
    }


    //查询用户已认证的记录，如果有，则用户已登录，判断用户是否已登录
    @Override
    public StudentCertification getAuthentication(Integer user_id, Integer state) {
        return studentCertificationDao.selectAuthentication(user_id, state);
    }
}
