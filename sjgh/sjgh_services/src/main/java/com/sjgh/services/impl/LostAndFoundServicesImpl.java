package com.sjgh.services.impl;


import com.sjgh.dao.LostAndFoundDao;
import com.sjgh.entity.LostAndFound;
import com.sjgh.services.LostAndFoundServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 失物招领业务实现类
 *
 *
 * */
@Service("lostAndFoundServices")
public class LostAndFoundServicesImpl implements LostAndFoundServices {

    @Autowired
    LostAndFoundDao lostAndFoundDao;


    public void add(LostAndFound lostAndFound) {
        //默认下，状态码为0
        lostAndFound.setState(0);
        lostAndFoundDao.insert(lostAndFound);
    }

    public void edit(LostAndFound lostAndFound) {

    }

    public LostAndFound get(int id) {

        return lostAndFoundDao.select(id);
    }

    public List<LostAndFound> getAPartBySchool(Integer school_id) {
        return lostAndFoundDao.selectAPartBySchool(school_id);
    }

    public List<LostAndFound> getAllBySchool(Integer school_id) {
        return lostAndFoundDao.selectAllBySchool(school_id);
    }


    public List<LostAndFound> fuzzyGetBySchool(Integer school_id, String keyWords) {
        return lostAndFoundDao.fuzzySelect(school_id, keyWords);
    }

    public Integer fuzzyGetCount(Integer school_id, String keyWords) {
        return lostAndFoundDao.fuzzySelectCount(school_id, keyWords);
    }

    public List<String> getDynamicPreview(Integer school_id, String searchKeyword) {
        return lostAndFoundDao.selectDynamicPreview(school_id, searchKeyword);
    }

    //用户查找他指定的事件的列表
    @Override
    public List<LostAndFound> getUserEvent(Integer user_id, int state) {
        return lostAndFoundDao.setlectUserEvent(user_id, state);
    }

    //通过标签查询一个学校内的所有的代办事件
    @Override
    public List<LostAndFound> getAllByLable(Integer school_id, String lable) {
        return lostAndFoundDao.selectAllByLable(school_id, lable);
    }


    //修改此任务的状态码
    @Override
    public void setState(Integer id, int state) {
        lostAndFoundDao.updateState(id, state);
    }


    //当有用户接单时，将此任务的接单者id，设为此用户的id
    @Override
    public void setReceiveId(Integer id, Integer receive_id) {
        lostAndFoundDao.updateReceiveId(id, receive_id);
    }


    //用户查找他揭榜的任务列表
    @Override
    public List<LostAndFound> getReceiveUserEvent(int receive_user_id, int state) {
        return lostAndFoundDao.selectReceiveUserEvent(receive_user_id, state);
    }
}
