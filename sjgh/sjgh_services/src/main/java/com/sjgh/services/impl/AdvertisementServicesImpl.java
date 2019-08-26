package com.sjgh.services.impl;

import com.sjgh.dao.AdvertisementDao;
import com.sjgh.entity.Advertisement;
import com.sjgh.services.AdvertisementServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("advertisementServices")
public class AdvertisementServicesImpl implements AdvertisementServices {

    @Autowired
    AdvertisementDao advertisementDao;

    public void add(Advertisement advertisement) {
        advertisementDao.insert(advertisement);
    }

    public List<Advertisement> getAll() {
        return advertisementDao.selectAll();
    }

    public List<Advertisement> getAllBySchool(Integer school_id) {
        return advertisementDao.selectAllBySchool(school_id);
    }
}
