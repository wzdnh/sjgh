package com.sjgh.services;


import com.sjgh.entity.TransactionOfThings;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/*事物交易业务接口
 *
 * */
public interface TransactionOfThingsServices {

    //插入
    void add(TransactionOfThings transactionOfThings);
    void edit(TransactionOfThings transactionOfThings);
    //void remove(int event_id);
    //查询事物交易详情
    TransactionOfThings get(int id);
    List<TransactionOfThings> getAPartBySchool(Integer school_id);
    List<TransactionOfThings> getAllBySchool(Integer school_id);

    //输入关键词进行查找
    List<TransactionOfThings> fuzzyGetBySchool(Integer school_id, String keyWords);
    //统计模糊查询的记过结果
    Integer fuzzyGetCount(Integer school_id, String keyWords);
    //搜索框动态预览
    List<String> getDynamicPreview(Integer school_id, String searchKeyword);

    //查询一个学校昨日所有未完成的单
    List<TransactionOfThings> getUnfinishedBySchool(Integer school_id, LocalDate date, LocalDate theDay);
    //管理员进行时间优化
    void setOptimizationTime(int id, LocalDateTime optimization_time);

    //用户查找他指定的事件的列表
    List<TransactionOfThings> getUserEvent(Integer user_id, int state);

    //通过标签查询一个学校内的所有的代办事件
    List<TransactionOfThings> getAllByLable(Integer school_id, String lable);

    //修改此任务的状态码
    void setState(Integer id, int state);


    //当有用户接单时，将此任务的接单者id，设为此用户的id
    void setReceiveId(Integer id, Integer receive_id);

    //用户查找他揭榜的任务列表
    List<TransactionOfThings> getReceiveUserEvent(int receive_user_id, int state);

}
