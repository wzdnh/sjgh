package com.sjgh.services;

/*广告业务处理接口
 *
 * */

import com.sjgh.entity.Advertisement;

import java.util.List;

public interface AdvertisementServices {

    void add(Advertisement advertisement);

    List<Advertisement> getAll();

    List<Advertisement> getAllBySchool(Integer school_id);
}
