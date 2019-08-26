package com.sjgh.dao;

import com.sjgh.entity.StudentCertification;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 学生认证持久化操作
 *
 * */

@Repository("studentCertificationDao")
public interface StudentCertificationDao {

    void insert(StudentCertification studentCertification);
    //更新状态，需要传入id
    void updateState(@Param("id") int id, @Param("state") int state, @Param("employee_id") int employee_id);

    //查询所有未处理的学生认证信息
    List<StudentCertification> selectAll(@Param("state") int state, @Param("school_id") int school_id);

    //删除
    //void delete(int employee_phone);

    //查询用户已认证的记录，如果有，则用户已登录，判断用户是否已登录
    StudentCertification selectAuthentication(@Param("user_id") Integer user_id, @Param("state") Integer state);
}
