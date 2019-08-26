package com.sjgh.services.impl;

import com.sjgh.dao.EmployeeDao;
import com.sjgh.entity.Employee;
import com.sjgh.services.GlobalBackstageServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/*
 *   后台登录修改密码业务实现类
 *
 * */

@Service("globalBackstageServicesImpl")
public class GlobalBackstageServicesImpl implements GlobalBackstageServices {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;

    public Employee login(int employee_id, String password) {
        //查询id为employee_id的employee对象
        Employee employee = employeeDao.select(employee_id);
        //如果成功，且用户的密码正确，代表登录成功
        if(employee!=null&&employee.getPassword().equals(password)){
            return  employee;
        }
        return null;
    }

    public void changePassword(Employee employee) {
        employeeDao.update(employee);
    }
}
