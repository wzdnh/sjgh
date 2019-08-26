package com.sjgh.dao;

/*
*后端之
* 学校持久化操作对象
*
* */

import com.sjgh.entity.School;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("schoolDao")//对dao实现类进行注解
public interface SchoolDao {
    //添加
    void insert(School school);
    //修改
    void update(School school);
    //删除
    void delete(Integer school_id);

    School select(Integer school_id);
    //通过传入的学校名，查找学校id
    int selectId(String school_name);
    //查询所有
    List<School> selectAll();
}
