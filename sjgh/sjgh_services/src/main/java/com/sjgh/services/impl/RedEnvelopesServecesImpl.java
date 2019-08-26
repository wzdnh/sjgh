package com.sjgh.services.impl;

import com.sjgh.dao.RedEnvelopesDao;
import com.sjgh.entity.RedEnvelopes;
import com.sjgh.services.RedEnvelopesServeces;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 红包的业务实现类
 * @Author: 陈政
 * @Date: 2019/6/8 5:21
 **/
public class RedEnvelopesServecesImpl implements RedEnvelopesServeces {
    @Autowired
    RedEnvelopesDao redEnvelopesDao;

    @Override
    public void add(RedEnvelopes redEnvelopes) {
        redEnvelopesDao.insert(redEnvelopes);
    }

    @Override
    public List<RedEnvelopes> getAll(int userId) {
        return redEnvelopesDao.selectAll(userId);
    }

    @Override
    public void setState(Integer id, Integer state) {
        redEnvelopesDao.updateState(id, state);
    }

    @Override
    public Integer getCount(Integer userId) {
        return redEnvelopesDao.selectCount(userId);
    }
}
