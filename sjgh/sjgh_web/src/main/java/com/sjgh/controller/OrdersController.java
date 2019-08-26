package com.sjgh.controller;

import com.sjgh.entity.OfficialNews;
import com.sjgh.entity.Orders;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 订单控制器，处理用户间的交易
 * <p>
 * 此模块用户必须登录
 */

@Controller("orderController")
@RequestMapping("/orders")
public class OrdersController {
    Orders orders = new Orders();
    @Autowired
    OrdersServices ordersServices;

    @Autowired
    AgentEventServices agentEventServices;

    @Autowired
    TransactionOfThingsServices transactionOfThingsServicesa;

    @Autowired
    LostAndFoundServices lostAndFoundServices;
    @Autowired
    OfficialNewsServices officialNewsServices;

    @Autowired
    OfficialPictureServices officialPictureServices;


    //事件代办接单处理---涉及到对接单者有一定的要求
    @RequestMapping(value = "/sjdb_receive", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map sjdb_receive(HttpSession session,
                            @RequestParam(value = "type_id", required = false) Integer type_id,
                            @RequestParam(value = "invoice_user_id", required = false) Integer invoice_user_id,
                            @RequestParam(value = "type", required = false) String type,
                            @RequestParam(value = "deposit", required = false) Integer deposit,
                            @RequestParam(value = "authentication", required = false) Integer authentication,
                            @RequestParam(value = "state", required = false) Integer state
    ) {
        System.out.println("session = [" + session + "], type_id = [" + type_id + "], invoice_user_id = [" + invoice_user_id + "], type = [" + type + "], deposit = [" + deposit + "], authentication = [" + authentication + "]");
        Map<String, Object> map = new HashMap<String, Object>();
        orders.setType_id(type_id);
        orders.setType(type);
        orders.setInvoice_user_id(invoice_user_id);

        //1.先查询接单用户信息
        //登录用户就是接单者
        User user = (User) session.getAttribute("user");
        if (user.equals(null)) {
            //flag=0表示用户没有登录
            map.put("flag", 0);
            //判断是否符合学生认证这一条
        } else if (authentication != 0 & user.getAuthentication() != authentication) {
            //flag = 1表示不符合学生认证
            map.put("flag", 1);
        } else if (deposit != 0 & user.getDeposit() != deposit) {
            map.put("flag", 2);
        } else if (user.getUser_id() == invoice_user_id) {
            //本人禁止接单 陈政 2019/5/29 20:13
            System.out.println(user.getUser_id() + "=================" + invoice_user_id);
            map.put("flag", 3);
        } else if (state != 0) {
            //状态码不为0，说明已被揭榜
            map.put("flag", 4);
        } else {
            //允许接单

            //任务状态码的处理， 1.表示已接单
            agentEventServices.setState(type_id, 1);

            //订单部分的处理
            orders.setReceipt_user_id(user.getUser_id());
            //初始化状态码
            orders.setState(0);
            orders.setInvoice_states(0);
            orders.setReceipt_states(0);


            //执行业务

            //修改接单者id
            agentEventServices.setReceiveId(type_id, user.getUser_id());

            //添加订单记录
            ordersServices.add(orders);
            map.put("flag", 5);

            //向发任务的用户发出提示消息
            OfficialNews officialNews = new OfficialNews();
            String title = "接单提示";
            String content = "领取了您的任务";
            //System.out.println("**********************************");
            officialNews.setTitle(title);
            //System.out.println("**********************************");
            officialNews.setUser_id(invoice_user_id);
            //System.out.println("**********************************");
            officialNews.setReceipt_user_id(user.getUser_id());
            //System.out.println("**********************************");
            officialNews.setContent(content);
            officialNews.setRoad(officialPictureServices.getRoad(Content.OFFICIAL_News_ID));
            officialNewsServices.add(officialNews);
            //System.out.println("**********************************");

            //System.out.println(officialNews.getContent() + officialNews.getRoad() + officialNews.getTitle() + officialNews.getRoad() + officialNews.getUser_id() + "" + officialNews.getReceipt_user_id());
        }

        return map;
    }


    //事物交易，失物招领接单控制器
    @RequestMapping(value = "/other_receive", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map other_receive(HttpSession session,
                             @RequestParam(value = "type_id", required = false) Integer type_id,
                             @RequestParam(value = "invoice_user_id", required = false) Integer invoice_user_id,
                             @RequestParam(value = "type", required = false) String type,
                             @RequestParam(value = "state", required = false) Integer state
    ) {

        Map<String, Object> map = new HashMap<String, Object>();
        orders.setType_id(type_id);
        orders.setType(type);
        orders.setInvoice_user_id(invoice_user_id);

        //1.先查询接单用户信息
        //登录用户就是接单者
        User user = (User) session.getAttribute("user");
        if (user.equals(null)) {
            //flag=0表示用户没有登录
            map.put("flag", 0);
            //判断是否符合学生认证这一条
        } else if (state != 0) {
            //状态码不为0，说明已被揭榜
            map.put("flag", 1);
        } else {

            //任务状态码的处理
            if (type.equals("事物交易")) {
                //修改订单状态为已接单
                transactionOfThingsServicesa.setState(type_id, 1);
                //修改接单者id
                transactionOfThingsServicesa.setReceiveId(type_id, user.getUser_id());
            } else {
                //修改订单状态为已接单
                lostAndFoundServices.setState(type_id, 1);
                //修改接单者id
                lostAndFoundServices.setReceiveId(type_id, user.getUser_id());
            }


            //订单部分的处理
            orders.setReceipt_user_id(user.getUser_id());
            //初始化状态码
            orders.setState(0);
            orders.setInvoice_states(0);
            orders.setReceipt_states(0);


            //执行业务
            //添加订单记录
            ordersServices.add(orders);
            //返回前台，揭榜成功
            map.put("flag", 2);


            //向发任务的用户发出提示消息
            //向发任务的用户发出提示消息
            OfficialNews officialNews = new OfficialNews();
            String title = "接单提示";
            String content = "领取了您的任务";
            //System.out.println("**********************************");
            officialNews.setTitle(title);
            //System.out.println("**********************************");
            officialNews.setUser_id(invoice_user_id);
            //System.out.println("**********************************");
            officialNews.setReceipt_user_id(user.getUser_id());
            //System.out.println("**********************************");
            officialNews.setContent(content);
            officialNews.setRoad(officialPictureServices.getRoad(Content.OFFICIAL_News_ID));
            officialNewsServices.add(officialNews);
            //System.out.println("**********************************");

        }


        return map;
    }


    //失物招领接单控制器
    @RequestMapping(value = "/swzl_receive", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map swzlReceive(HttpSession session,
                           @RequestParam(value = "type_id", required = false) Integer type_id,
                           @RequestParam(value = "invoice_user_id", required = false) Integer invoice_user_id,
                           @RequestParam(value = "type", required = false) String type,
                           @RequestParam(value = "state", required = false) Integer state,
                           @RequestParam(value = "tags", required = false) String tags
    ) {

        Map<String, Object> map = new HashMap<String, Object>();
        orders.setType_id(type_id);
        orders.setType(type);
        orders.setInvoice_user_id(invoice_user_id);

        //1.先查询接单用户信息
        //登录用户就是接单者
        User user = (User) session.getAttribute("user");
        if (user.equals(null)) {
            //flag=0表示用户没有登录
            map.put("flag", 0);
        } else if (state != 0) {
            //状态码不为0，说明已被揭榜
            map.put("flag", 1);
        } else {
            /**
             * 这里是用户允许接单的一系列处理
             *
             *
             * */

            //修改订单状态为已接单
            lostAndFoundServices.setState(type_id, 1);
            //修改接单者id
            lostAndFoundServices.setReceiveId(type_id, user.getUser_id());


            //订单部分的处理
            orders.setReceipt_user_id(user.getUser_id());
            //初始化状态码
            orders.setState(0);
            orders.setInvoice_states(0);
            orders.setReceipt_states(0);


            //执行业务
            //添加订单记录
            ordersServices.add(orders);

            //向发任务的用户发出提示消息
            //向发任务的用户发出提示消息
            OfficialNews officialNews = new OfficialNews();


            //判断任务属于丢失，还是拾到
            if (tags.equals("捡到")) {
                //返回前台，揭榜成功，且接单的用户是属于丢了东西的
                map.put("flag", 2);
                String title = "失物寻找";
                String content = "同学拾到了您的物品，请在订单中心私信联系Ta，感谢您对赏金工会的支持";
                //System.out.println("**********************************");
                officialNews.setTitle(title);
                //System.out.println("**********************************");
                officialNews.setUser_id(invoice_user_id);
                //System.out.println("**********************************");
                officialNews.setReceipt_user_id(user.getUser_id());
                //System.out.println("**********************************");
                officialNews.setContent(content);
                officialNews.setRoad(officialPictureServices.getRoad(Content.OFFICIAL_News_ID));
                officialNewsServices.add(officialNews);
                //System.out.println("**********************************");
            } else {
                //返回前台，揭榜成功,且接单的用户是捡到东西
                map.put("flag", 3);
                String title = "失物寻找";
                String content = "同学申请拿回失物，请在订单中心私信联系Ta，感谢您对赏金工会的支持";
                //System.out.println("**********************************");
                officialNews.setTitle(title);
                //System.out.println("**********************************");
                officialNews.setUser_id(invoice_user_id);
                //System.out.println("**********************************");
                officialNews.setReceipt_user_id(user.getUser_id());
                //System.out.println("**********************************");
                officialNews.setContent(content);
                officialNews.setRoad(officialPictureServices.getRoad(Content.OFFICIAL_News_ID));
                officialNewsServices.add(officialNews);
                //System.out.println("**********************************");
            }
        }

        return map;

    }
    //下面这两条放到私信里
    //失物寻找：xxx同学拾到了您的物品，请在订单中心私信联系Ta，感谢您对赏金工会的支持 （有回复按钮）
    //失物寻找：xxx同学申请拿回失物，请在订单中心私信联系Ta，感谢您对赏金工会的支持（有回复按钮）



    //发布的信息状态变为已完成
    //发布者收到确认订单
    //发布者可以选择 1.确认，打钱过去，用户收到信息和钱； 2.拒绝，接单者收到信息
    //




}



