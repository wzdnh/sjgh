package com.sjgh.controller.mb;

import com.sjgh.entity.*;
import com.sjgh.services.*;
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
 *
 * 手机端之
 * 用户前台页面之
 * 事件详情页面--以及评论
 * <p>
 * 评论功能用户只要登录后才可进行
 */

@Controller("mbReceptionDetailController")
@RequestMapping("/mb_detail")
public class ReceptionDetailController {

    @Autowired
    AgentEventServices agentEventServices;
    @Autowired
    CommentSJDBServices commentSJDBServices;
    @Autowired
    LostAndFoundServices lostAndFoundServices;
    @Autowired
    CommentSWZLServices commentSWZLServices;
    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;
    @Autowired
    CommentSWJYServices commentSWJYServices;

    //事件代办详情
    @RequestMapping(value = "/sjdb", params = "event_id")
    public String list(HttpSession session, int event_id, Map<String, Object> map) {
        AgentEvent agentEvent = agentEventServices.get(event_id);
        session.setAttribute("agentEvent", agentEvent);
        //map中放入评论
        map.put("commentSJDBList", commentSJDBServices.getAll(event_id));
        return "/reception/mb/msjdb_detail";
    }

    //事件代办评论添加
    @RequestMapping(value = "/sjdb_comment_add", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addCommentSJDB(@RequestParam(value = "content", required = false) String content,
                                 @RequestParam(value = "sjdb_id", required = false) Integer sjdb_id,
                                 @RequestParam(value = "user_id", required = false) Integer user_id,
                                 @RequestParam(value = "commented_user_id", required = false) Integer commented_user_id
                                 ) {
        //System.out.println("content = [" + content + "], sjdb_id = [" + sjdb_id + "], user_id = [" + user_id + "]");
        CommentSJDB commentSJDB = new CommentSJDB();

        commentSJDB.setContent(content);
        commentSJDB.setSjdb_id(sjdb_id);
        commentSJDB.setUser_id(user_id);
        commentSJDB.setCommented_user_id(commented_user_id);
        //设置类型为评论，而不是回复
        commentSJDB.setReply_id(0);

        //此处判断，评论的用户是否是发布任务的用户，如果是，设置消息状态为已读



        //执行业务
        commentSJDBServices.add(commentSJDB);

        return null;
    }

    //事件评论回显
    @RequestMapping(value = "/sjdb_comment_list", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> list(@RequestParam(value = "sjdb_id") int sjdb_id) {

        List<CommentSJDB> list = commentSJDBServices.getAll(sjdb_id);
        //JSONArray jsonArray = JSONArray.fromArray(Object[] list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("comment", list);
        //System.out.println("================已被成功调用==============");
        return map;
    }

    //失物招领详情
    @RequestMapping(value = "/swzl", params = "id")
    public String swzlList(HttpSession session, int id, Map<String, Object> map) {
        LostAndFound lostAndFound = lostAndFoundServices.get(id);
        session.setAttribute("lostAndFound", lostAndFound);
        //map中放入评论
        //map.put("commentSJDBList", commentSJDBServices.getAll(event_id));
        return "/reception/mb/mswzl_detail";
    }

    //失物招领评论添加
    @RequestMapping(value = "/swzl_comment_add", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addCommentSWZL(@RequestParam(value = "content", required = false) String content,
                                 @RequestParam(value = "swzl_id", required = false) Integer swzl_id,
                                 @RequestParam(value = "user_id", required = false) Integer user_id,
                                 @RequestParam(value = "commented_user_id", required = false) Integer commented_user_id
                                    ) {
        //System.out.println("content = [" + content + "], swzl_id = [" + swzl_id + "], user_id = [" + user_id + "], commented_user_id = [" + commented_user_id + "]");
        CommentSWZL commentSWZL = new CommentSWZL();
        commentSWZL.setContent(content);
        commentSWZL.setUser_id(user_id);
        commentSWZL.setSwzl_id(swzl_id);
        commentSWZL.setCommented_user_id(commented_user_id);
        //设置类型为评论，而不是回复
        commentSWZL.setReply_id(0);

        //执行业务
        commentSWZLServices.add(commentSWZL);
        return null;
    }

    //失物招领评论回显
    @RequestMapping(value = "/swzl_comment_list", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> listSWZL(@RequestParam(value = "swzl_id") int swzl_id) {

        List<CommentSWZL> list = commentSWZLServices.getAll(swzl_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("comment", list);
        //System.out.println("================已被成功调用==============");
        return map;
    }


    //事物交易详情
    @RequestMapping(value = "/swjy", params = "id")
    public String swjyList(HttpSession session, int id, Map<String, Object> map) {
        TransactionOfThings transactionOfThings = transactionOfThingsServices.get(id);
        session.setAttribute("transactionOfThings", transactionOfThings);
        return "/reception/mb/mswjy_detail";
    }


    //事物交易评论添加
    @RequestMapping(value = "/swjy_comment_add", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addCommentSWJY(@RequestParam(value = "content", required = false) String content,
                                 @RequestParam(value = "swjy_id", required = false) int swjy_id,
                                 @RequestParam(value = "user_id", required = false) Integer user_id,
                                 @RequestParam(value = "commented_user_id", required = false) Integer commented_user_id) {
        CommentSWJY commentSWJY = new CommentSWJY();
        commentSWJY.setContent(content);
        commentSWJY.setUser_id(user_id);
        commentSWJY.setSwjy_id(swjy_id);
        commentSWJY.setCommented_user_id(commented_user_id);
        //设置类型为评论，而不是回复
        commentSWJY.setReply_id(0);

        //执行业务
        commentSWJYServices.add(commentSWJY);
        return null;
    }

    //事物交易评论回显
    @RequestMapping(value = "/swjy_comment_list", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> listSWJY(@RequestParam(value = "swjy_id") int swjy_id) {

        List<CommentSWJY> list = commentSWJYServices.getAll(swjy_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("comment", list);
        //System.out.println("================已被成功调用==============");
        return map;
    }
}
