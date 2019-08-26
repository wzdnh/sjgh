package com.sjgh.services.impl;

import com.sjgh.dao.CommentSWJYDao;
import com.sjgh.entity.CommentSWJY;
import com.sjgh.services.CommentSWJYServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 事物交易评论业务实现类
 *
 * */


@Service("commentSWJYServices")
public class CommentSWJYServicesImpl implements CommentSWJYServices {

    @Qualifier("commentSWJYDao")
    @Autowired
    CommentSWJYDao commentSWJYDao;

    public void add(CommentSWJY commentSWJY) {
        //设置初始状态为0，未读
        commentSWJY.setState(0);
        //设置回复初始状态为0，未读
        commentSWJY.setReply_state(0);
        //commentSWJY.setReply_id(0);
        commentSWJYDao.insert(commentSWJY);
    }

    public List<CommentSWJY> getAll(int swjy_id) {
        return commentSWJYDao.selectAll(swjy_id);
    }


    ////用户查询他所有的产品下的所有评论
    @Override
    public List<CommentSWJY> getAllByUser_id(Integer commented_user_id) {
        return commentSWJYDao.selectAllByUserId(commented_user_id);
    }

    //统计此用户的信息和
    @Override
    public Integer getSum(int state, Integer commented_user_id) {
        return commentSWJYDao.selectSum(state, commented_user_id);
    }


    //修改消息的状态码
    @Override
    public void setState(Integer id, Integer state) {
        commentSWJYDao.updateState(id, state);
    }
}
