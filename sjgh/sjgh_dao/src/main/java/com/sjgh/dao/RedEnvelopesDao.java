package com.sjgh.dao;

import com.sjgh.entity.RedEnvelopes;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 红包持久化操作对象
 * @Author: 陈政
 * @Date: 2019/6/8 5:03
 **/
@Repository("redEnvelopesDao")//对dao实现类进行注解
public interface RedEnvelopesDao {

    void insert(RedEnvelopes redEnvelopes);

    //查询所有红包
    List<RedEnvelopes> selectAll(@Param("userId") int userId);

    //修改红包状态码
    void updateState(@Param("id") Integer id, @Param("state") Integer state);

    //统计红包个数
    Integer selectCount(@Param("userId")Integer userId);
}
