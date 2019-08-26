package com.sjgh.entity;

/*广告实体类
 *
 */
public class Advertisement {
    private int id;
    private Integer money;
    private String create_time;
    private Integer school_id;
    private int employee_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
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
}
