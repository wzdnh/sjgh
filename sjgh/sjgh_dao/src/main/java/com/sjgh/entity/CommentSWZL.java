package com.sjgh.entity;

/**
 * 失物招领评论实体类
 *
 * */

public class CommentSWZL {
    private int id;
    private int user_id;

    private String create_time;
    private String content;
    private int swzl_id;
    private User user_er;
    private int state;//状态码
    //表示是回复的那个id，为0时，表示不是回复
    private Integer reply_id;
    //表示此回复的状态（0：未读； 1：已读； 2：删除）
    private Integer reply_state;
    //被评论的人的id，也就是这条评论评论的是哪位用户的信息
    private Integer commented_user_id;
    private LostAndFound swzl_er;

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

    public int getSwzl_id() {
        return swzl_id;
    }

    public void setSwzl_id(int swzl_id) {
        this.swzl_id = swzl_id;
    }

    public User getUser_er() {
        return user_er;
    }

    public void setUser_er(User user_er) {
        this.user_er = user_er;
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

    public LostAndFound getSwzl_er() {
        return swzl_er;
    }

    public void setSwzl_er(LostAndFound swzl_er) {
        this.swzl_er = swzl_er;
    }
}
