package com.sjgh.services;

/*
 *代办事件业务接口
 *
 * */


import com.sjgh.entity.AgentEvent;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface AgentEventServices {
    void add(AgentEvent agentEvent);
    void edit(AgentEvent agentEvent);
    //void remove(int event_id);
    AgentEvent get(int event_id);
    List<AgentEvent> getAPartBySchool(Integer school_id);
    List<AgentEvent> getAllBySchool(Integer school_id);

    //输入关键词进行查找
    List<AgentEvent> fuzzyGetBySchool(Integer school_id, String keyWords);
    //统计模糊查询的记过结果
    Integer fuzzyGetCount(Integer school_id, String keyWords);
    //搜索框动态预览
    List<String> getDynamicPreview(Integer school_id, String searchKeyword);

    //查询一个学校昨日所有未完成的单
    List<AgentEvent> getUnfinishedBySchool(Integer school_id, LocalDate date, LocalDate theDay);
    //管理员进行时间优化
    void setOptimizationTime(int event_id, LocalDateTime optimization_time);

    //用户查找他指定的事件的列表
    List<AgentEvent> getUserEvent(Integer user_id, int state);

    //通过标签查询一个学校内的所有的代办事件
    List<AgentEvent> getAllByLable(Integer school_id, String lable);

    //修改此任务的状态码
    void setState(Integer event_id, int state);


    //二级页面的任务排序
    List<AgentEvent> getByOrder(Integer school_id, String sort);

    //当有用户接单时，将此任务的接单者id，设为此用户的id
    void setReceiveId(Integer event_id, Integer receive_id);


    //用户查找他揭榜的任务列表
    List<AgentEvent> getReceiveUserEvent(int receive_user_id, int state);


}
