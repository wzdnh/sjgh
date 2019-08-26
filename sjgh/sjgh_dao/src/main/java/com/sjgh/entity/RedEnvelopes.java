package com.sjgh.entity;

import java.time.LocalDateTime;

/**
 * 红包表实体类
 * @Author: 陈政
 * @Date: 2019/6/8 4:58
 **/
public class RedEnvelopes {
    private Integer id;
    private int userId;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private Integer state;
    private Double money;
    private Double condition;   //红包的使用条件

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Double getCondition() {
        return condition;
    }

    public void setCondition(Double condition) {
        this.condition = condition;
    }
}
