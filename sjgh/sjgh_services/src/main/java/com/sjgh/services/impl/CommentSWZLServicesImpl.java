package com.sjgh.services.impl;

import com.sjgh.dao.CommentSWZLDao;
import com.sjgh.entity.CommentSWZL;
import com.sjgh.services.CommentSWZLServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 失物招领评论业务实现类
 *
 *
 * */

@Service("commentSWZLServices")
public class CommentSWZLServicesImpl implements CommentSWZLServices {
    @Qualifier("commentSWZLDao")
    @Autowired
    CommentSWZLDao commentSWZLDao;
    public void add(CommentSWZL commentSWZL) {
        //设置初始状态为0，未读
        commentSWZL.setState(0);
        //设置回复初始状态为0，未读
        commentSWZL.setReply_state(0);
        commentSWZLDao.insert(commentSWZL);
    }

    public List<CommentSWZL> getAll(int swzl_id) {
        return commentSWZLDao.selectAll(swzl_id);
    }


    ////用户查询他所有的产品下的所有评论
    @Override
    public List<CommentSWZL> getAllByUser_id(Integer commented_user_id) {
        return commentSWZLDao.selectAllByUserId(commented_user_id);
    }

    //统计此用户的信息和
    @Override
    public Integer getSum(int state, Integer commented_user_id) {
        return commentSWZLDao.selectSum(state, commented_user_id);
    }


    //修改消息的状态码
    @Override
    public void setState(Integer id, Integer state) {
        commentSWZLDao.updateState(id, state);
    }
}
