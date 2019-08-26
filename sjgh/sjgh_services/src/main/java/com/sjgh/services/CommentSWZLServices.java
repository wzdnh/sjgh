package com.sjgh.services;

import com.sjgh.entity.CommentSWZL;

import java.util.List;

/**
 * 失物招领评论业务接口
 *
 * */

public interface CommentSWZLServices {
    void add(CommentSWZL commentSWZL);
    List<CommentSWZL> getAll(int swzl_id);

    List<CommentSWZL>  getAllByUser_id(Integer commented_user_id);

    //统计此用户的信息和
    Integer getSum(int state, Integer commented_user_id);

    //修改消息的状态码
    void setState(Integer id, Integer state);

}
