package com.sjgh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sjgh.entity.AgentEvent;
import com.sjgh.entity.LostAndFound;
import com.sjgh.entity.TransactionOfThings;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.AgentEventServices;
import com.sjgh.services.LostAndFoundServices;
import com.sjgh.services.TransactionOfThingsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模糊搜索控制器
 * <p>
 * 用户没有登录也可以进行搜索操作
 * <p>
 * 每个方法都加了ifelse判断，使用户不登录也可以进行搜索操作
 * <p>
 * 用户未登录时，默认学校id为9，进入天津商业大学信息模块
 */

@Controller("searchController")
@RequestMapping("/search")
public class SearchController {

    @Autowired
    AgentEventServices agentEventServices;
    @Autowired
    LostAndFoundServices lostAndFoundServices;
    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;
    Integer school_id = Content.SCHOOL_ID;

    //事件代办模糊搜索，获得分页信息
    @RequestMapping(value = "/sjdb_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdbSearchPageInfo(HttpSession session, @RequestParam(value = "sjdb_keyWords") String sjdb_keyWords) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.fuzzyGetBySchool(school_id, sjdb_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.fuzzyGetBySchool(school_id, sjdb_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;
    }


    //事件代办模糊搜索，传入页码，返回相关的任务
    @RequestMapping(value = "/sjdb", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdb(HttpSession session, @RequestParam(value = "sjdb_keyWords") String sjdb_keyWords,
                    @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.fuzzyGetBySchool(school_id, sjdb_keyWords);
            //PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("agentEvent", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", agentEventServices.fuzzyGetCount(school_id, sjdb_keyWords));
            return map;
        } else {
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.fuzzyGetBySchool(school_id, sjdb_keyWords);
            //PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("agentEvent", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", agentEventServices.fuzzyGetCount(school_id, sjdb_keyWords));
            return map;

        }

    }

    //事件代办搜索预览
    @RequestMapping(value = "/sjdb_search_review", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> sjdbSearchPreview(HttpSession session, @RequestParam(value = "searchKeyword") String searchKeyword) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            List<String> list = agentEventServices.getDynamicPreview(school_id, searchKeyword);
            //System.out.println("==========yes");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("sjdbSearchPreview", list);
            return map;
        } else {
            school_id = user.getSchool_id();
            //System.out.println("--------------ok");
            List<String> list = agentEventServices.getDynamicPreview(school_id, searchKeyword);
            //System.out.println("==========yes");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("sjdbSearchPreview", list);
            return map;
        }

    }


    //事件代办之点击标签查询相关操作,此控制器传入lable关键字，查询分页相关信息
    @RequestMapping(value = "/sjdb_lable_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdbLableSearchPageInfo(HttpSession session, @RequestParam(value = "lable", required = false) String lable) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List list = agentEventServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List list = agentEventServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;

    }

    //点击了lable之后，通过点击分页，传入页码，进行数据的查询
    @RequestMapping(value = "/sjdb_lable_search", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> sjdbLableSearch(HttpSession session, @RequestParam(value = "lable", required = false) String lable,
                                               @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List list = agentEventServices.getAllByLable(school_id, lable);
            map.put("agentEventLableSearchList", list);
            return map;
        }else{
            Integer school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List list = agentEventServices.getAllByLable(school_id, lable);
            map.put("agentEventLableSearchList", list);
            return map;
        }
    }



    //事件代办之点击排序，对任务排序，此控制器负责获得分页信息  排序
    @RequestMapping(value = "/sjdb_sort_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdbSortPageInfo(HttpSession session, @RequestParam(value = "sjdb_sort") String sjdb_sort) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        //String orderByPrice = "price desc";
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.getByOrder(school_id, sjdb_sort);    //此处前端返回的排序关键词应该与数据库中的排序字段一致
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<AgentEvent> list = agentEventServices.getByOrder(school_id, sjdb_sort);    //此处前端返回的排序关键词应该与数据库中的排序字段一致
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;
    }


    //事件代办之点击排序，传入排序关键词和页码，返回相应的内容
    @RequestMapping(value = "/sjdb_sort", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdbSort(HttpSession session, @RequestParam(value = "sjdb_sort") String sjdb_sort,
                        @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        //String orderByPrice = "price desc";
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.getByOrder(school_id, sjdb_sort);    //此处前端返回的排序关键词应该与数据库中的排序字段一致
            //PageInfo pageInfo = new PageInfo(list);
            map.put("sjdb_sort", list);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List<AgentEvent> list = agentEventServices.getByOrder(school_id, sjdb_sort);    //此处前端返回的排序关键词应该与数据库中的排序字段一致
            //PageInfo pageInfo = new PageInfo(list);
            map.put("sjdb_sort", list);
        }

        return map;
    }






    //失物招领模糊搜索获得分页信息
    @RequestMapping(value = "/swzl_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swzlSearchPageInfo(HttpSession session, @RequestParam(value = "swzl_keyWords") String swzl_keyWords) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<LostAndFound> list = lostAndFoundServices.fuzzyGetBySchool(school_id, swzl_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<LostAndFound> list = lostAndFoundServices.fuzzyGetBySchool(school_id, swzl_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;
    }

    //事件代办模糊搜索，传入页码，返回相关的任务
    @RequestMapping(value = "/swzl", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swzl(HttpSession session, @RequestParam(value = "swzl_keyWords") String swzl_keyWords,
                    @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            //System.out.println("=================ok--");
            List<LostAndFound> list = lostAndFoundServices.fuzzyGetBySchool(school_id, swzl_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("lostAndFound", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", lostAndFoundServices.fuzzyGetCount(school_id, swzl_keyWords));
            return map;
        } else {
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            //System.out.println("=================ok--");
            List<LostAndFound> list = lostAndFoundServices.fuzzyGetBySchool(school_id, swzl_keyWords);
            //System.out.println("--------------------ok==");
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("lostAndFound", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", lostAndFoundServices.fuzzyGetCount(school_id, swzl_keyWords));
            return map;
        }

    }


    //失物招领搜索预览
    @RequestMapping(value = "/swzl_search_review", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swzlSearchPreview(HttpSession session, @RequestParam(value = "searchKeyword") String searchKeyword) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            List<String> list = lostAndFoundServices.getDynamicPreview(school_id, searchKeyword);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("swzlSearchPreview", list);
            return map;
        } else {
            school_id = user.getSchool_id();
            List<String> list = lostAndFoundServices.getDynamicPreview(school_id, searchKeyword);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("swzlSearchPreview", list);
            return map;
        }

    }



    //失物招领之点击标签查询相关操作,此控制器传入lable关键字，查询分页相关信息
    @RequestMapping(value = "/swzl_lable_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swzlLableSearchPageInfo(HttpSession session, @RequestParam(value = "lable", required = false) String lable) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List list = lostAndFoundServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List list = lostAndFoundServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;

    }

    //失物招领之
    //点击了lable之后，通过点击分页，传入页码，进行数据的查询
    @RequestMapping(value = "/swzl_lable_search", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swzlLableSearch(HttpSession session, @RequestParam(value = "lable", required = false) String lable,
                                               @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List list = lostAndFoundServices.getAllByLable(school_id, lable);
            map.put("lostAndFoundLableSearchList", list);
            return map;
        }else{
            Integer school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List list = lostAndFoundServices.getAllByLable(school_id, lable);
            map.put("lostAndFoundLableSearchList", list);
            return map;
        }
    }




    //事物交易模糊搜索,获得分页信息
    @RequestMapping(value = "/swjy_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swjySearchPageInfo(HttpSession session, @RequestParam(value = "swjy_keyWords") String swjy_keyWords) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.fuzzyGetBySchool(school_id, swjy_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List<TransactionOfThings> list = transactionOfThingsServices.fuzzyGetBySchool(school_id, swjy_keyWords);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;
    }


    //事物交易模糊搜索，传入页码，返回相关的任务
    @RequestMapping(value = "/swjy", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swjy(HttpSession session, @RequestParam(value = "swjy_keyWords") String swjy_keyWords,
                                    @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            //System.out.println("=================ok--");
            List<TransactionOfThings> list = transactionOfThingsServices.fuzzyGetBySchool(school_id, swjy_keyWords);
            //System.out.println("--------------------ok==");
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("transactionOfThings", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", transactionOfThingsServices.fuzzyGetCount(school_id, swjy_keyWords));
            return map;
        } else {
            school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            //System.out.println("=================ok--");
            List<TransactionOfThings> list = transactionOfThingsServices.fuzzyGetBySchool(school_id, swjy_keyWords);
            //System.out.println("--------------------ok==");
            PageInfo pageInfo = new PageInfo(list);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("transactionOfThings", list);
            //将搜索结果统计放入
            //map.put("fuzzySelectCount", transactionOfThingsServices.fuzzyGetCount(school_id, swjy_keyWords));
            return map;
        }

    }

    //事物交易搜索预览
    @RequestMapping(value = "/swjy_search_review", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swjySearchPreview(HttpSession session, @RequestParam(value = "searchKeyword") String searchKeyword) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            //System.out.println("--------------ok");
            List<String> list = transactionOfThingsServices.getDynamicPreview(school_id, searchKeyword);
            //System.out.println("==========yes");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("swjySearchPreview", list);
            return map;
        } else {
            school_id = user.getSchool_id();
            //System.out.println("--------------ok");
            List<String> list = transactionOfThingsServices.getDynamicPreview(school_id, searchKeyword);
            //System.out.println("==========yes");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("swjySearchPreview", list);
            return map;
        }

    }


    //事物交易之点击标签查询相关操作,此控制器传入lable关键字，查询分页相关信息
    @RequestMapping(value = "/swjy_lable_search_page_info", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swjyLableSearchPageInfo(HttpSession session, @RequestParam(value = "lable", required = false) String lable) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(1, 12);
            List list = transactionOfThingsServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }else{
            school_id = user.getSchool_id();
            PageHelper.startPage(1, 12);
            List list = transactionOfThingsServices.getAllByLable(school_id, lable);
            PageInfo pageInfo = new PageInfo(list);
            map.put("info", pageInfo);
        }

        return map;

    }

    //事物交易之
    //点击了lable之后，通过点击分页，传入页码，进行数据的查询
    @RequestMapping(value = "/swjy_lable_search", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> swjyLableSearch(HttpSession session, @RequestParam(value = "lable", required = false) String lable,
                                               @RequestParam(value = "currentPage") int currentPage) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            PageHelper.startPage(currentPage, 12);
            List list = transactionOfThingsServices.getAllByLable(school_id, lable);
            map.put("swjyLableSearchList", list);
            return map;
        }else{
            Integer school_id = user.getSchool_id();
            PageHelper.startPage(currentPage, 12);
            List list = transactionOfThingsServices.getAllByLable(school_id, lable);
            map.put("swjyLableSearchList", list);
            return map;
        }
    }



}
