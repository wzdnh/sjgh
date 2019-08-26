package com.sjgh.services;

import com.sjgh.entity.CommentSWJY;

import java.util.List;

/**
 * 事物交易评论业务处理接口
 *
 *
 * */

public interface CommentSWJYServices {
    void add(CommentSWJY commentSWJY);
    List<CommentSWJY> getAll(int swjy_id);

    List<CommentSWJY>  getAllByUser_id(Integer commented_user_id);

    //统计此用户的信息和
    Integer getSum(int state, Integer commented_user_id);

    //修改消息的状态码
    void setState(Integer id, Integer state);

}
