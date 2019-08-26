package com.sjgh.dao;

import com.sjgh.entity.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
* 员工持久化操作对象
*
*
* */

@Repository("employeeDao")
public interface EmployeeDao {
    void insert(Employee employee);
    void update(Employee employee);
    void delete(int employee_phone);
    //修改头像
    void updateHeadPortrait(Employee employee);
    Employee select(int employee_id);//通过username查询
    List<Employee> selectAll();//查询所有用户===ROOT级别
    List<Employee> selectAllBySchool(Integer school_id);//查询一个学校内的所有用户


}
