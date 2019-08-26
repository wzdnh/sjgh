package com.sjgh.dao;

import com.sjgh.entity.OfficialNews;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 * 官方消息持久化操作
 *
 * */

@Repository("officialNewsDao")
public interface OfficialNewsDao {

    //插入
    void insert(OfficialNews officialNews);
    //查询一个事件代办信息的所有评论
    //List<CommentSJDB> selectAll(int sjdb_id);

    //用户查询所有的未读的官方信息
    List<OfficialNews> selectAllByUserId(@Param("user_id") Integer user_id);

    //统计此用户信息和
    Integer selectSum(@Param("state") int state, @Param("commented_user_id") Integer commented_user_id);

    //修改消息的状态码,此处传入的是用户id，此用户的所有的官方消息都设置为已读
    void updateState(@Param("user_id") Integer user_id, @Param("state") int state);


}
