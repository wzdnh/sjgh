package com.sjgh.dao;

import com.sjgh.entity.CommentSJDB;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *事件代办评论持久化操作
 *
 *
 * */

@Repository("commentSJDBDao")
public interface CommentSJDBDao {
    //插入
    void insert(CommentSJDB commentSJDB);
    //查询一个事件代办信息的所有评论
    List<CommentSJDB> selectAll(int sjdb_id);

    //用户查询他所有的产品下的所有评论
    List<CommentSJDB> selectAllByUserId(@Param("commented_user_id") Integer commented_user_id);

    //统计此用户信息和
    Integer selectSum(@Param("state") int state, @Param("commented_user_id") Integer commented_user_id);

    //修改消息的状态码
    void updateState(@Param("id") Integer id, @Param("state") int state);

}
