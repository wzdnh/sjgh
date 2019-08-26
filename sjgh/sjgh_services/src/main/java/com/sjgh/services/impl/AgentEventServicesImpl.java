package com.sjgh.services.impl;

import com.sjgh.dao.AgentEventDao;
import com.sjgh.entity.AgentEvent;
import com.sjgh.global.Content;
import com.sjgh.services.AgentEventServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/*事件代办业务处理实现类
 *
 * */

@Service("agentEventServices")
public class AgentEventServicesImpl implements AgentEventServices {

    @Qualifier("agentEventDao")
    @Autowired
    AgentEventDao agentEventDao;

    public void add(AgentEvent agentEvent) {
        //默认下，状态码为0
        agentEvent.setState(0);
        agentEventDao.insert(agentEvent);
    }

    public void edit(AgentEvent agentEvent) {

    }

    public AgentEvent get(int event_id) {

        return agentEventDao.select(event_id);
    }

    public List<AgentEvent> getAPartBySchool(Integer school_id) {
        return agentEventDao.selectAPartBySchool(school_id);
    }

    public List<AgentEvent> getAllBySchool(Integer school_id) {
        if (school_id == 0){
            school_id = Content.SCHOOL_ID;
            return agentEventDao.selectAllBySchool(school_id);
        }
        return agentEventDao.selectAllBySchool(school_id);
    }

    //输入关键词进行查询
    public List<AgentEvent> fuzzyGetBySchool(Integer school_id, String keyWords) {
        return agentEventDao.fuzzySelect(school_id, keyWords);
    }

    //统计查询的结果
    public Integer fuzzyGetCount(Integer school_id, String keyWords) {
        return agentEventDao.fuzzySelectCount(school_id, keyWords);
    }

    //搜索框动态预览
    public List<String> getDynamicPreview(Integer school_id, String searchKeyword) {
        return agentEventDao.selectDynamicPreview(school_id, searchKeyword);
    }

    @Override
    public List<AgentEvent> getUnfinishedBySchool(Integer school_id, LocalDate date, LocalDate theDay) {
        return agentEventDao.selectUnfinishedBySchool(school_id, date, theDay);
    }

    @Override
    public void setOptimizationTime(int event_id, LocalDateTime optimization_time) {
        agentEventDao.updateOptimizationTime(event_id, optimization_time);
    }

    //用户查看事件列表
    @Override
    public List<AgentEvent> getUserEvent(Integer user_id, int state) {
        return agentEventDao.selectUserEvent(user_id, state);
    }

    //通过标签查询一个学校内的所有的代办事件
    @Override
    public List<AgentEvent> getAllByLable(Integer school_id, String lable) {
        return agentEventDao.selectAllByLable(school_id, lable);
    }


    //修改此任务的状态码
    @Override
    public void setState(Integer event_id, int state) {
        agentEventDao.updateState(event_id, state);
    }


    //二级页面的任务排序,排序的关键词，应该和数据库的一致
    @Override
    public List<AgentEvent> getByOrder(Integer school_id, String sort) {
        return agentEventDao.orderSelect(school_id, sort);
    }


    //当有用户接单时，将此任务的接单者id，设为此用户的id
    @Override
    public void setReceiveId(Integer event_id, Integer receive_id) {
        agentEventDao.updateReceiveId(event_id, receive_id);
    }

    //用户查找他揭榜的任务列表
    @Override
    public List<AgentEvent> getReceiveUserEvent(int receive_user_id, int state) {
        return agentEventDao.selectReceiveUserEvent(receive_user_id, state);
    }
}
