package com.sjgh.entity;

import java.time.LocalDateTime;

/**
 *
 * 学生认证实体类
 *
 * */

public class StudentCertification {
    private Integer id;
    private Integer user_id;
    //真实姓名
    private String name;
    private int school_id;
    private int student_id;
    private String road;
    private LocalDateTime create_time;
    private LocalDateTime update_time;
    private int state;
    private int employee_id;

    private School school_er;
    private Employee employee_er;
    private User user_er;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    public LocalDateTime getCreate_time() {
        return create_time;
    }

    public void setCreate_time(LocalDateTime create_time) {
        this.create_time = create_time;
    }

    public LocalDateTime getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(LocalDateTime update_time) {
        this.update_time = update_time;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public School getSchool_er() {
        return school_er;
    }

    public void setSchool_er(School school_er) {
        this.school_er = school_er;
    }

    public Employee getEmployee_er() {
        return employee_er;
    }

    public void setEmployee_er(Employee employee_er) {
        this.employee_er = employee_er;
    }

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
    }
}
