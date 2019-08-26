package com.sjgh.dao;

/*广告持久化操作对象
 *
 */

import com.sjgh.entity.Advertisement;

import java.util.List;

public interface AdvertisementDao {

    void insert(Advertisement advertisement);

    //查询所有记录===ROOT级别
    List<Advertisement> selectAll();
    //查询一个学校内的记录
    List<Advertisement> selectAllBySchool(Integer school_id);
}
