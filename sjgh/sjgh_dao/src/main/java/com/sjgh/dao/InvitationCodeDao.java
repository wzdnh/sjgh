package com.sjgh.dao;

/*邀请码持久化操作对象
 *
 */


public interface InvitationCodeDao {
    void insert(Integer invitationCode);
    int selectStatistics(int invitation_code);//查询某一邀请码的和
    //List<InvitationCode> selectAll();//查询所有邀请码的统计记录
}
