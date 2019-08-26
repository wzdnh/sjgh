package com.sjgh.services.impl;

import com.sjgh.dao.OfficialPictureDao;
import com.sjgh.entity.Advertisement;
import com.sjgh.entity.OfficialPicture;
import com.sjgh.services.AdvertisementServices;
import com.sjgh.services.OfficialPictureServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*官方图片、广告实现类
 *
 *
 * */
@Service("officialPictureSrevices")
public class OfficialPictureServicesImpl implements OfficialPictureServices {

    @Autowired
    OfficialPictureDao officialPictureDao;

    @Autowired
    AdvertisementServices advertisementServices;

    //添加图片，广告
    public void add(OfficialPicture officialPicture) {
        officialPictureDao.insert(officialPicture);
    }

    //修改、更新
    public void edit(OfficialPicture officialPicture) {
        officialPictureDao.update(officialPicture);
    }

    public void remove(int picture_id) {

    }


    //修改图片路径
    public void editPicture(OfficialPicture officialPicture) {

        officialPictureDao.updatePicture(officialPicture);

        /*如果类型为广告，则将其记录在广告表中
         *
         *
         * */
        if (officialPicture.getPicture_describe().equals("广告")){
            Advertisement advertisement = new Advertisement();
            advertisement.setMoney(officialPicture.getMoney());
            advertisement.setSchool_id(officialPicture.getSchool_id());
            advertisement.setEmployee_id(officialPicture.getEmployee_id());
            advertisementServices.add(advertisement);
        }
    }

    public OfficialPicture get(int picture_id) {
        return officialPictureDao.select(picture_id);
    }


    //获取图片路径
    @Override
    public String getRoad(int picture_id) {
        return officialPictureDao.selectRoad(picture_id);
    }


    //查询所有的图片、广澳（root级权限）
    public List<OfficialPicture> getAll() {
        return officialPictureDao.selectAll();
    }

    //按管理员所在学校查询所有图片。广告
    public List<OfficialPicture> getAllBySchool(Integer school_id) {
        return officialPictureDao.selectAllBySchool(school_id);
    }
}
