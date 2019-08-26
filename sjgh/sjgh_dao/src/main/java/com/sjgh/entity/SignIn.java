package com.sjgh.entity;

import java.time.LocalDate;

/**
 *签到表实体类
 *
 *author：陈政
 *
 * */

public class SignIn {
    private Integer id;
    private Integer user_id;
    private LocalDate sign_time;

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

    public LocalDate getSign_time() {
        return sign_time;
    }

    public void setSign_time(LocalDate sign_time) {
        this.sign_time = sign_time;
    }

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
    }
}
