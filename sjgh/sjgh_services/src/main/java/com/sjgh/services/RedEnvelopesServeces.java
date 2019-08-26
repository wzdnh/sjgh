package com.sjgh.services;

import com.sjgh.entity.RedEnvelopes;

import java.util.List;

/**
 * 红包的业务操作接口
 * @Author: 陈政
 * @Date: 2019/6/8 5:20
 **/
public interface RedEnvelopesServeces {
    void add(RedEnvelopes redEnvelopes);

    //查询所有红包
    List<RedEnvelopes> getAll(int userId);

    //修改红包状态码
    void setState(Integer id, Integer state);

    //统计红包个数
    Integer getCount(Integer userId);
}
