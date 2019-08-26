package com.sjgh.services.impl;

import com.sjgh.dao.SchoolDao;
import com.sjgh.entity.School;
import com.sjgh.services.SchoolServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * School业务实现类
 *
 * */

@Service("schoolServices")
public class SchoolServicesImpl implements SchoolServices {

    @Qualifier("schoolDao")
    @Autowired
    private SchoolDao schoolDao;

    public void add(School school) {
        schoolDao.insert(school);
    }

    //修改学校信息
    public void edit(School school) {
        schoolDao.update(school);

    }

    public void remove(int school_id) {
        schoolDao.delete(school_id);

    }

    public School get(Integer school_id) {
        return schoolDao.select(school_id);
    }

    //查找学校id
    public int getId(String school_name) {
        return schoolDao.selectId(school_name);
    }


    public List<School> getAll() {
        return schoolDao.selectAll();
    }


}
