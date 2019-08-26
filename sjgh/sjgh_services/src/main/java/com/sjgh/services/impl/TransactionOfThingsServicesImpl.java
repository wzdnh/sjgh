package com.sjgh.services.impl;

import com.sjgh.dao.TransactionOfThingsDao;
import com.sjgh.entity.TransactionOfThings;
import com.sjgh.services.TransactionOfThingsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 事物交易业务实现类
 *
 *
 * */

@Service("transactionOfThingsServices")
public class TransactionOfThingsServicesImpl implements TransactionOfThingsServices {

    @Autowired
    TransactionOfThingsDao transactionOfThingsDao;

    public void add(TransactionOfThings transactionOfThings) {
        //默认下，状态码为0
        transactionOfThings.setState(0);
        //System.out.println("*****************************************");
        transactionOfThingsDao.insert(transactionOfThings);
    }

    public void edit(TransactionOfThings transactionOfThings) {

    }

    public TransactionOfThings get(int id) {
        return transactionOfThingsDao.select(id);
    }

    public List<TransactionOfThings> getAPartBySchool(Integer school_id) {
        return transactionOfThingsDao.selectAPartBySchool(school_id);
    }

    public List<TransactionOfThings> getAllBySchool(Integer school_id) {
        return transactionOfThingsDao.selectAllBySchool(school_id);
    }


    public List<TransactionOfThings> fuzzyGetBySchool(Integer school_id, String keyWords) {
        return transactionOfThingsDao.fuzzySelect(school_id, keyWords);
    }

    public Integer fuzzyGetCount(Integer school_id, String keyWords) {
        return transactionOfThingsDao.fuzzySelectCount(school_id, keyWords);
    }

    public List<String> getDynamicPreview(Integer school_id, String searchKeyword) {
        return transactionOfThingsDao.selectDynamicPreview(school_id, searchKeyword);
    }


    @Override
    public List<TransactionOfThings> getUnfinishedBySchool(Integer school_id, LocalDate date, LocalDate theDay) {
        return transactionOfThingsDao.selectUnfinishedBySchool(school_id, date, theDay);
    }

    @Override
    public void setOptimizationTime(int id, LocalDateTime optimization_time) {
        transactionOfThingsDao.updateOptimizationTime(id, optimization_time);
    }


    //用户查找他指定的事件的列表
    @Override
    public List<TransactionOfThings> getUserEvent(Integer user_id, int state) {
        return transactionOfThingsDao.setlectUserEvent(user_id, state);
    }

    //通过标签查询一个学校内的所有的代办事件
    @Override
    public List<TransactionOfThings> getAllByLable(Integer school_id, String lable) {
        return transactionOfThingsDao.selectAllByLable(school_id, lable);
    }


    //修改此任务的状态码
    @Override
    public void setState(Integer id, int state) {
       transactionOfThingsDao.updateState(id, state);
    }


    //当有用户接单时，将此任务的接单者id，设为此用户的id
    @Override
    public void setReceiveId(Integer id, Integer receive_id) {
        transactionOfThingsDao.updateReceiveId(id, receive_id);
    }


    //用户查找他揭榜的任务列表
    @Override
    public List<TransactionOfThings> getReceiveUserEvent(int receive_user_id, int state) {
        return transactionOfThingsDao.selectReceiveUserEvent(receive_user_id, state);
    }
}
