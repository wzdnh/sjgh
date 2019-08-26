package com.sjgh.services;

public interface InvitationCodeServices {
    //注册时
    void add(Integer invitationCode);

    //得到此用户邀请了多少人
    Integer getStatistics(int invitationCode);
}
