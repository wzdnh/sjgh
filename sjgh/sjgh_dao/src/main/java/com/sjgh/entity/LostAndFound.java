package com.sjgh.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalTime;

/*失物招领实体类
 *
 * */
public class LostAndFound {

    private int id;
    private Integer user_id;
    private int price;
    @DateTimeFormat(pattern = "HH:mm:ss") //入参
    private LocalTime start_time;
    @DateTimeFormat(pattern = "HH:mm:ss") //入参
    private LocalTime end_time;
    private String event_describe;
    private String create_time;
    private String event_tags;
    private Integer school_id;
    private String road;
    //0表示免费；1表示有偿
    private int free;
    private String goods;
    private User user_er;
    private School school_er;
    private int state;//状态码

    //接单者id外键关联user
    private User receive_user_er;
    //接单者id
    private Integer receive_id;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @JsonFormat(timezone = "GMT+8", pattern = "HH:mm") //出参
    public LocalTime getStart_time() {
        return start_time;
    }

    public void setStart_time(LocalTime start_time) {
        this.start_time = start_time;
    }

    @JsonFormat(timezone = "GMT+8", pattern = "HH:mm") //出参
    public LocalTime getEnd_time() {
        return end_time;
    }

    public void setEnd_time(LocalTime end_time) {
        this.end_time = end_time;
    }

    public String getEvent_describe() {
        return event_describe;
    }

    public void setEvent_describe(String event_describe) {
        this.event_describe = event_describe;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEvent_tags() {
        return event_tags;
    }

    public void setEvent_tags(String event_tags) {
        this.event_tags = event_tags;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
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

    public School getSchool_er() {
        return school_er;
    }

    public void setSchool_er(School school_er) {
        this.school_er = school_er;
    }

    public int getFree() {
        return free;
    }

    public void setFree(int free) {
        this.free = free;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User getReceive_user_er() {
        return receive_user_er;
    }

    public void setReceive_user_er(User receive_user_er) {
        this.receive_user_er = receive_user_er;
    }

    public Integer getReceive_id() {
        return receive_id;
    }

    public void setReceive_id(Integer receive_id) {
        this.receive_id = receive_id;
    }
}
