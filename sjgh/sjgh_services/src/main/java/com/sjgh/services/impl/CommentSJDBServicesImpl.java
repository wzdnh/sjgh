package com.sjgh.services.impl;

import com.sjgh.dao.CommentSJDBDao;
import com.sjgh.entity.CommentSJDB;
import com.sjgh.services.CommentSJDBServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 事件代办评论的业务处理实现类
 *
 *
 * */

@Service("commentSJDBServices")
public class CommentSJDBServicesImpl implements CommentSJDBServices {

    @Qualifier("commentSJDBDao")
    @Autowired
    CommentSJDBDao commentSJDBDao;

    public void add(CommentSJDB commentSJDB) {
        //设置初始状态为0，未读
        commentSJDB.setState(0);
        //设置回复初始状态为0，未读
        commentSJDB.setReply_state(0);
        commentSJDBDao.insert(commentSJDB);
    }

    public List<CommentSJDB> getAll(int sjdb_id) {
        return commentSJDBDao.selectAll(sjdb_id);
    }


    ////用户查询他所有的产品下的所有评论
    @Override
    public List<CommentSJDB> getAllByUser_id(Integer commented_user_id) {
        return commentSJDBDao.selectAllByUserId(commented_user_id);
    }

    //统计此用户的信息和
    @Override
    public Integer getSum(int state, Integer commented_user_id) {
        return commentSJDBDao.selectSum(state, commented_user_id);
    }


    //修改消息的状态码
    @Override
    public void setState(Integer id, Integer state) {
        commentSJDBDao.updateState(id, state);
    }


}
