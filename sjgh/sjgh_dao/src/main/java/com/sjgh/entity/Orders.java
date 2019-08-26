package com.sjgh.entity;

import java.time.LocalDateTime;

/**
 *订单记录表实体类
 *
 *
 * */

public class Orders {
    private int id;
    private int type_id;
    private String type;
    private Integer invoice_user_id;
    private Integer receipt_user_id;
    //此订单状态（1同意，2不同意）
    private int state;
    //发单者状态（0未读，1已读，2删除）
    private int invoice_states;
    //接单者状态
    private int receipt_states;
    private LocalDateTime create_time;
    private LocalDateTime update_time;
    private User user_er;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getInvoice_user_id() {
        return invoice_user_id;
    }

    public void setInvoice_user_id(Integer invoice_user_id) {
        this.invoice_user_id = invoice_user_id;
    }

    public Integer getReceipt_user_id() {
        return receipt_user_id;
    }

    public void setReceipt_user_id(Integer receipt_user_id) {
        this.receipt_user_id = receipt_user_id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
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

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
    }

    public int getInvoice_states() {
        return invoice_states;
    }

    public void setInvoice_states(int invoice_states) {
        this.invoice_states = invoice_states;
    }

    public int getReceipt_states() {
        return receipt_states;
    }

    public void setReceipt_states(int receipt_states) {
        this.receipt_states = receipt_states;
    }
}
