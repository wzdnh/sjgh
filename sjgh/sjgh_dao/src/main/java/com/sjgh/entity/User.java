package com.sjgh.entity;

/*用户实体类
 *
 */


public class User {
    private Integer user_id;
    private String user_name;
    private String password;
    private Integer school_id;
    private String phone_number;
    private Integer deposit;//押金（0：未交；1：已交）
    private Integer authentication;//认证（0：未认证； 1：已认证）
    private String head_portrait;//头像
    private Integer performance;//履约次数
    private Integer invitation_code;//邀请码（建议用户使用学号）
    private Integer wechart;
    private Integer qq;
    private String date_of_birth;
    private String sex;
    private String create_time;
    private String email;
    private String address;
    //状态码
    private Integer state;

    //声明关联对象，用于连接学校表
    private School school_er;


    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public School getSchool_er() {
        return school_er;
    }

    public void setSchool_er(School school_er) {
        this.school_er = school_er;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public Integer getDeposit() {
        return deposit;
    }

    public void setDeposit(Integer deposit) {
        this.deposit = deposit;
    }

    public Integer getAuthentication() {
        return authentication;
    }

    public void setAuthentication(Integer authentication) {
        this.authentication = authentication;
    }

    public String getHead_portrait() {
        return head_portrait;
    }

    public void setHead_portrait(String head_portrait) {
        this.head_portrait = head_portrait;
    }

    public Integer getPerformance() {
        return performance;
    }

    public void setPerformance(Integer performance) {
        this.performance = performance;
    }

    public Integer getInvitation_code() {
        return invitation_code;
    }

    public void setInvitation_code(Integer invitation_code) {
        this.invitation_code = invitation_code;
    }

    public Integer getWechart() {
        return wechart;
    }

    public void setWechart(Integer wechart) {
        this.wechart = wechart;
    }

    public Integer getQq() {
        return qq;
    }

    public void setQq(Integer qq) {
        this.qq = qq;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}

