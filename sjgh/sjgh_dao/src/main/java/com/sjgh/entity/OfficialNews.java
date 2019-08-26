package com.sjgh.entity;

import java.time.LocalDateTime;

/**
 * 官方消息实体类
 *
 * */

public class OfficialNews {
    private Integer id;
    private Integer user_id;
    private String title;
    private Integer receipt_user_id;
    private String content;
    private LocalDateTime create_time;
    private Integer employee_id;
    private Integer state;
    private String road;

    //此信息的接受者
    private User user_er;
    private Employee employee_er;

    //此信息是哪位用户处理后,发送给用户的提示信息
    private User receive_user_er;


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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreate_time() {
        return create_time;
    }

    public void setCreate_time(LocalDateTime create_time) {
        this.create_time = create_time;
    }

    public Integer getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(Integer employee_id) {
        this.employee_id = employee_id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
    }

    public Employee getEmployee_er() {
        return employee_er;
    }

    public void setEmployee_er(Employee employee_er) {
        this.employee_er = employee_er;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getReceipt_user_id() {
        return receipt_user_id;
    }

    public void setReceipt_user_id(Integer receipt_user_id) {
        this.receipt_user_id = receipt_user_id;
    }


    public User getReceive_user_er() {
        return receive_user_er;
    }

    public void setReceive_user_er(User receive_user_er) {
        this.receive_user_er = receive_user_er;
    }
}
