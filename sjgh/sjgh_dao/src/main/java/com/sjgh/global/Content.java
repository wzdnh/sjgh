package com.sjgh.global;

import java.util.ArrayList;
import java.util.List;

/**
 * 会用到的一些常量
 *
 *
 *
 **/
public class Content {

    //设置默认学校id
    //为了首页的默认显示
    //public static final Integer SCHOOL_ID = 9;
    //服务器端是1
    public static final Integer SCHOOL_ID = 1;
    //水印图片的完整路径
    //此处在上传到服务器时，应该更改过
    public static final String WaterMarkImgRoad = "C:\\Users\\asus\\Desktop\\SJGH\\sjgh\\sjgh_web\\src\\main\\webapp\\static\\reception\\img\\watermark\\watermark.png";

    //事件代办之代取快递的数据库id
    public static final Integer SJDB_dai_qu_kuai_di_ID = 9;

    //事件代办之辅助学习的数据库id
    public static final Integer SJDB_fu_zhu_xue_xi_ID = 10;

    //事件代办之代跑腿的数据库id
    public static final Integer SJDB_dai_pao_tui_ID = 11;

    //事件代办之其他的数据库id
    public static final Integer SJDB_other_ID = 12;

    //失物招领默认的的数据库id
    public static final Integer SWZL_mo_ren_ID = 13;

    //事物交易默认的的数据库id
    public static final Integer SWJY_mo_ren_ID = 14;


    //用户头像的数据库id
    public static final Integer HEAD_PORTRAIT_ID = 15;

    //官方消息头像
    public static final Integer OFFICIAL_News_ID = 16;

    //二级页面之事件代办
    public static final Integer SECONDARY_PAGE_SJDB_ID = 17;

    //二级页面之失物招领
    public static final Integer SECONDARY_PAGE_SWZL_ID = 18;

    //二级页面之事物交易
    public static final Integer SECONDARY_PAGE_SWJY_ID = 19;

    /**
     *
     * 对应用户发布的信息，有三个状态
     *
     * 0：表示未还没有人接单
     * 1:表示已完成
     * 2表示用户已删除（其实只是状态变为3，不在向用户显示）
     *
     * */

    /**
     * 对与评论来说，有两种状态
     * 0未读
     * 1已读
     * 2.用户已删除
     *
     *
     *
     * */


    /***
     *
     * 事件代办关键词
     */
    public static List<String> getSjdbKeywords(){
        List<String> list = new ArrayList<String>();
        list.add("代取快递");
        list.add("辅助学习");
        list.add("代跑腿（吃的、药品等）");
        list.add("其他任务类型");
        return list;
    }


    //消息状态码
    public static List<Integer> getCommentState(){
        List<Integer> list = new ArrayList<Integer>();
        list.add(0);//未读
        list.add(1);//已读
        list.add(2);//删除
        return list;
    }

    //学生认证状态码
    public static List<Integer> getStudentCertification(){
        List<Integer> list = new ArrayList<Integer>();
        list.add(0);//未读
        list.add(1);//已认证
        list.add(2);//未认证
        return list;
    }


    //事件代办的状态
    public static List<Integer> getsEventSjdbState(){
        List<Integer> list = new ArrayList<Integer>();
        list.add(0);//未处理，还没有人接单
        list.add(1);//已有人接单处理中
        list.add(2);//接单者确认已完成
        list.add(3);//已打钱
        list.add(4);//已删除
        return list;
    }


    //事物交易的状态
    public static List<Integer> getsEventSwjyState(){
        List<Integer> list = new ArrayList<Integer>();
        list.add(0);//未处理，还没有人接单
        list.add(1);//已有人接单处理中
        list.add(2);//接单者确认已完成
        list.add(3);//已打钱
        list.add(4);//已删除
        return list;
    }

    //失物招领的状态
    public static List<Integer> getsEventSwzlState(){
        List<Integer> list = new ArrayList<Integer>();
        list.add(0);//未处理，还没有人接单
        list.add(1);//已有人接单处理中
        list.add(2);//接单者确认已完成
        list.add(3);//已打钱
        list.add(4);//已删除
        return list;
    }




}
