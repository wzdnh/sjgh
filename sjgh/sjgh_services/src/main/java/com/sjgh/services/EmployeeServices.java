package com.sjgh.services;

import com.sjgh.entity.Employee;

import java.util.List;

public interface EmployeeServices {
    void add(Employee employee);
    void edit(Employee employee);
    void remove(int employee_id);
    //修改员工头像
    void editHeadPortrait(Employee employee);
    Employee get(int employee_id);
    List<Employee> getAll();
    List<Employee> getAllBySchool(Integer school_id);
}
