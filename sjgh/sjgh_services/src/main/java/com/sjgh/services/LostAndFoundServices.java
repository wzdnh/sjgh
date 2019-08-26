package com.sjgh.services;

import com.sjgh.entity.LostAndFound;

import java.util.List;

/*失物招领业务接口
 *
 * */
public interface LostAndFoundServices {

    //插入
    void add(LostAndFound lostAndFound);
    void edit(LostAndFound lostAndFound);
    //void remove(int event_id);
    LostAndFound get(int id);
    List<LostAndFound> getAPartBySchool(Integer school_id);
    List<LostAndFound> getAllBySchool(Integer school_id);

    //输入关键词进行查找
    List<LostAndFound> fuzzyGetBySchool(Integer school_id, String keyWords);
    //统计模糊查询的记过结果
    Integer fuzzyGetCount(Integer school_id, String keyWords);
    //搜索框动态预览
    List<String> getDynamicPreview(Integer school_id, String searchKeyword);

    //用户查找他指定的事件的列表
    List<LostAndFound> getUserEvent(Integer user_id, int state);

    //通过标签查询一个学校内的所有的代办事件
    List<LostAndFound> getAllByLable(Integer school_id, String lable);


    //修改此任务的状态码
    void setState(Integer id, int state);


    //当有用户接单时，将此任务的接单者id，设为此用户的id
    void setReceiveId(Integer id, Integer receive_id);

    //用户查找他揭榜的任务列表
    List<LostAndFound> getReceiveUserEvent(int receive_user_id, int state);

}
