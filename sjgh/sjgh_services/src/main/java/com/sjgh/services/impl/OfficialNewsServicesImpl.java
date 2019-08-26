package com.sjgh.services.impl;

import com.sjgh.dao.OfficialNewsDao;
import com.sjgh.entity.OfficialNews;
import com.sjgh.services.OfficialNewsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("officialNewsServices")
public class OfficialNewsServicesImpl implements OfficialNewsServices {

    @Qualifier("officialNewsDao")
    @Autowired
    OfficialNewsDao officialNewsDao;

    @Override
    public void add(OfficialNews officialNews) {
        //设置默认的状态码为0
        officialNews.setState(0);
        officialNewsDao.insert(officialNews);
    }

    @Override
    public List<OfficialNews> getAllByUser_id(Integer user_id) {
        return officialNewsDao.selectAllByUserId(user_id);
    }


    //统计此用户的信息和
    @Override
    public Integer getSum(int state, Integer commented_user_id) {
        return officialNewsDao.selectSum(state, commented_user_id);
    }


    //修改消息的状态码
    @Override
    public void setState(Integer user_id, int state) {
        officialNewsDao.updateState(user_id, state);
    }
}
