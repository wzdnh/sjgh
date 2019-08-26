package com.sjgh.services;

import com.sjgh.entity.School;

import java.util.List;

/*
* 学校业务接口
*
* */

public interface SchoolServices {
    void add(School school);
    void edit(School school);//编辑
    void remove(int school_id);
    School get(Integer school_id);
    //通过学校名字，查找学校id
    int getId(String school_name);
    List<School> getAll();
}
