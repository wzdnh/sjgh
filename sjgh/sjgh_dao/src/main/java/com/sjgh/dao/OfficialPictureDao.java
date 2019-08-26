package com.sjgh.dao;

import com.sjgh.entity.OfficialPicture;

import java.util.List;

/*
* 广告持久化操作对象接口
*     声明对应的持久化操作方法
*
* */
public interface OfficialPictureDao {
    void insert(OfficialPicture officialPicture);
    //更新除了图片以外的信息
    void update(OfficialPicture officialPicture);
    //修改图片
    void updatePicture(OfficialPicture officialPicture);

    OfficialPicture select(int picture_id);

    //通过id查询此图片的路径
    String selectRoad(int picture_id);

    //查询所有用户===ROOT级别
    List<OfficialPicture> selectAll();
    //查询一个学校内的所有图片、广告
    List<OfficialPicture> selectAllBySchool(Integer school_id);
}
