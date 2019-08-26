package com.sjgh.dao;

import com.sjgh.entity.LostAndFound;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*失物招领持久化操作
 *
 * */
public interface LostAndFoundDao {
    //插入
    void insert(LostAndFound lostAndFound);
    //传入失物招领信息id，找寻他的所有的详情
    LostAndFound select(int id);
    //查询一个学校的一部分；针对首页信息显示
    List<LostAndFound> selectAPartBySchool(Integer school_id);
    //查询一个学校内的所有失物招领
    List<LostAndFound> selectAllBySchool(Integer school_id);
    //模糊查询,输入关键词，在一个学校范围内查询
    List<LostAndFound> fuzzySelect(@Param("school_id")Integer school_id, @Param("keyWords")String keyWords);
    //统计模糊查询的结果
    Integer fuzzySelectCount(@Param("school_id")Integer school_id, @Param("keyWords")String keyWords);
    //搜索框动态内容预览
    List<String> selectDynamicPreview(@Param("school_id")Integer school_id, @Param("searchKeyword")String searchKeyword);


    //个人中心的功能，获得用户的事件代办的列表（未删除的）
    List<LostAndFound> setlectUserEvent(@Param("user_id") int user_id, @Param("state") int state);

    //通过标签查询一个学校内的所有的代办事件
    List<LostAndFound> selectAllByLable(@Param("school_id") Integer school_id, @Param("lable") String lable);


    //修改此任务的状态码
    void updateState(@Param("id") Integer id, @Param("state") int state);

    //当有用户接单时，将此任务的接单者id，设为此用户的id
    void updateReceiveId(@Param("id") Integer id, @Param("receive_id") Integer receive_id);

    //用户查找他揭榜的任务列表
    List<LostAndFound> selectReceiveUserEvent(@Param("receive_user_id") int receive_user_id, @Param("state") int state);

}
