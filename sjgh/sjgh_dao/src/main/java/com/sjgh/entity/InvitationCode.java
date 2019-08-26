package com.sjgh.entity;

/*邀请码实体类
 *
 * */

public class InvitationCode {
    private int id;
    private int invitation_code;//邀请码

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvitation_code() {
        return invitation_code;
    }

    public void setInvitation_code(int invitation_code) {
        this.invitation_code = invitation_code;
    }
}
