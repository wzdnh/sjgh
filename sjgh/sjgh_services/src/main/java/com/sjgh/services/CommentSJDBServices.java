package com.sjgh.services;

import com.sjgh.entity.CommentSJDB;

import java.util.List;

/**
 *事件代办评论的业务处理接口
 *
 **/


public interface CommentSJDBServices {
    void add(CommentSJDB commentSJDB);
    List<CommentSJDB>  getAll(int sjdb_id);

    List<CommentSJDB>  getAllByUser_id(Integer commented_user_id);

    //统计此用户的信息和
    Integer getSum(int state, Integer commented_user_id);

    //修改消息的状态码
    void setState(Integer id, Integer state);


}
