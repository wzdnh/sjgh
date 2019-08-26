package com.sjgh.entity;

/**
 * 事件代办评论表实体类
 * author：陈政
 * time: 4-26 14:29
 *
 * */

public class CommentSJDB {
    private int id;
    private int user_id;
    private String create_time;
    private String content;
    private int sjdb_id;
    private User user_er;
    private AgentEvent agentEvent_er;
    private int state;//状态码
    //表示是回复的那个id，为0时，表示不是回复
    private Integer reply_id;
    //表示此回复的状态（0：未读； 1：已读； 2：删除）
    private Integer reply_state;
    //被评论的人的id，也就是这条评论评论的是哪位用户的信息
    private Integer commented_user_id;
    private AgentEvent sjdb_er;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSjdb_id() {
        return sjdb_id;
    }

    public void setSjdb_id(int sjdb_id) {
        this.sjdb_id = sjdb_id;
    }

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
    }

    public AgentEvent getAgentEvent_er() {
        return agentEvent_er;
    }

    public void setAgentEvent_er(AgentEvent agentEvent_er) {
        this.agentEvent_er = agentEvent_er;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }

    public Integer getReply_state() {
        return reply_state;
    }

    public void setReply_state(Integer reply_state) {
        this.reply_state = reply_state;
    }

    public Integer getCommented_user_id() {
        return commented_user_id;
    }

    public void setCommented_user_id(Integer commented_user_id) {
        this.commented_user_id = commented_user_id;
    }

    public AgentEvent getSjdb_er() {
        return sjdb_er;
    }

    public void setSjdb_er(AgentEvent sjdb_er) {
        this.sjdb_er = sjdb_er;
    }
}
