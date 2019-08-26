package com.sjgh.dao;

import com.sjgh.entity.AgentEvent;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/*
 * 代办事件持久化操作对象接口
 *     声明对应的持久化操作方法
 *
 * */

@Repository("agentEventDao")//对dao实现类进行注解
public interface AgentEventDao {
    //插入
    void insert(AgentEvent agentEvent);
    //传入代办事件id，找寻所有详情
    AgentEvent select(int event_id);
    //查询一个学校的一部分；针对首页信息显示
    List<AgentEvent> selectAPartBySchool(Integer school_id);
    //查询一个学校内的所有代办事件
    List<AgentEvent> selectAllBySchool(Integer school_id);

    //模糊查询,输入关键词，在一个学校范围内查询
    List<AgentEvent> fuzzySelect(@Param("school_id")Integer school_id, @Param("keyWords")String keyWords);
    //统计模糊查询的结果
    Integer fuzzySelectCount(@Param("school_id")Integer school_id, @Param("keyWords")String keyWords);
    //搜索框动态内容预览
    List<String> selectDynamicPreview(@Param("school_id")Integer school_id, @Param("searchKeyword")String searchKeyword);


    //查询前一日所有没完成的单(昨日，今日)
    List<AgentEvent> selectUnfinishedBySchool(@Param("school_id")Integer school_id, @Param("date") LocalDate date, @Param("theDay") LocalDate theDay);
    //管理员进行时间优化
    void updateOptimizationTime(@Param("event_id") int event_id, @Param("optimization_time") LocalDateTime optimization_time);

    //个人中心的功能，获得用户的事件代办的列表（未删除的）
    List<AgentEvent> selectUserEvent(@Param("user_id") int user_id, @Param("state") int state);


    //通过标签查询一个学校内的所有的代办事件
    List<AgentEvent> selectAllByLable(@Param("school_id") Integer school_id, @Param("lable") String lable);


    //修改此任务的状态码
    void updateState(@Param("event_id") Integer event_id, @Param("state") int state);

    //二级页面的任务排序
    List<AgentEvent> orderSelect(@Param("school_id")Integer school_id, @Param("sort")String sort);

    //当有用户接单时，将此任务的接单者id，设为此用户的id
    void updateReceiveId(@Param("event_id") Integer event_id, @Param("receive_id") Integer receive_id);

    //用户查找他揭榜的任务列表
    List<AgentEvent> selectReceiveUserEvent(@Param("receive_user_id") int receive_user_id, @Param("state") int state);


}


