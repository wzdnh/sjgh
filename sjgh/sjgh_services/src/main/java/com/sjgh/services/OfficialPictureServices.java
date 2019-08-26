package com.sjgh.services;

import com.sjgh.entity.OfficialPicture;

import java.util.List;

/*官方图片，广告业务处理接口
 *
 *
 * */
public interface OfficialPictureServices {
    void add(OfficialPicture officialPicture);
    void edit(OfficialPicture officialPicture);
    void remove(int picture_id);
    //修改官方图片
    void editPicture(OfficialPicture officialPicture);

    OfficialPicture get(int picture_id);

    //获取图片路径
    String getRoad(int picture_id);

    List<OfficialPicture> getAll();
    List<OfficialPicture> getAllBySchool(Integer school_id);
}
