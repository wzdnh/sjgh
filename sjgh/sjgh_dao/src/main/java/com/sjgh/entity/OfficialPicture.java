package com.sjgh.entity;

/*
* 广告以及官方图片实体类
*
* */
public class OfficialPicture {
    private int picture_id;
    private String road;
    private Integer school_id;
    private int employee_id;
    private Integer money;
    private String picture_describe;
    private String size;
    private String create_time;
    private String end_time;//当是广告时，可能需要知道它什么时候结束
    private String update_time;

    public int getPicture_id() {
        return picture_id;
    }

    public void setPicture_id(int picture_id) {
        this.picture_id = picture_id;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    private School school_er;

    public School getSchool_er() {
        return school_er;
    }

    public void setSchool_er(School school_er) {
        this.school_er = school_er;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    private Employee employee_er;

    public Employee getEmployee_er() {
        return employee_er;
    }

    public void setEmployee_er(Employee employee_er) {
        this.employee_er = employee_er;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getPicture_describe() {
        return picture_describe;
    }

    public void setPicture_describe(String picture_describe) {
        this.picture_describe = picture_describe;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
