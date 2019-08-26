package com.sjgh.services;

import com.sjgh.entity.OfficialNews;

import java.util.List;

public interface OfficialNewsServices {
    void add(OfficialNews officialNews);
    //List<CommentSJDB> getAll(int sjdb_id);

    List<OfficialNews>  getAllByUser_id(Integer user_id);

    //统计此用户的信息和
    Integer getSum(int state, Integer commented_user_id);

    //修改消息的状态码
    void setState(Integer user_id, int state);

}
