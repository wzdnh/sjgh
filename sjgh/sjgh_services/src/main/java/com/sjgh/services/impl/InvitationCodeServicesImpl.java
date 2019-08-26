package com.sjgh.services.impl;

import com.sjgh.dao.InvitationCodeDao;
import com.sjgh.services.InvitationCodeServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("invitationCodeServices")
public class InvitationCodeServicesImpl implements InvitationCodeServices {

    @Autowired
    InvitationCodeDao invitationCodeDao;

    @Override
    public void add(Integer invitationCode) {
        invitationCodeDao.insert(invitationCode);
    }

    @Override
    public Integer getStatistics(int invitationCode) {
        return invitationCodeDao.selectStatistics(invitationCode);
    }
}
