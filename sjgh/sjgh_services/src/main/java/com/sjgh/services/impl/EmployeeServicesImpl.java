package com.sjgh.services.impl;

import com.sjgh.dao.EmployeeDao;
import com.sjgh.entity.Employee;
import com.sjgh.services.EmployeeServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/*
*后端管理之
* 员工业务实现类
*
* */

@Service("employeeServices")
public class EmployeeServicesImpl implements EmployeeServices {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;


    public void add(Employee employee) {
        //设置初始密码
        employee.setPassword("000000");
        employeeDao.insert(employee);
    }

    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    public void remove(int employee_id) {
        employeeDao.delete(employee_id);
    }

    //修改员工头像
    public void editHeadPortrait(Employee employee) {
        employeeDao.updateHeadPortrait(employee);
    }

    public Employee get(int employee_id) {
        return employeeDao.select(employee_id);
    }

    //查找所有的员工
    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }

    //查找一个学校范围内的员工
    public List<Employee> getAllBySchool(Integer school_id) {
        return employeeDao.selectAllBySchool(school_id);
    }
}
