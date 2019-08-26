package com.sjgh.controller;

import com.sjgh.entity.AgentEvent;
import com.sjgh.entity.Employee;
import com.sjgh.entity.TransactionOfThings;
import com.sjgh.services.AgentEventServices;
import com.sjgh.services.TransactionOfThingsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;

@Controller("optimizationTimeController")
@RequestMapping("/optimization_time")
public class OptimizationTimeController {

    @Autowired
    AgentEventServices agentEventServices;

    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;

    //事件代办昨日信息列表
    @RequestMapping("/sjdb_list")
    public String sjdbList(Map<String, Object> map, HttpSession session){
        Employee employee = (Employee)session.getAttribute("employee");
        int school_id = employee.getSchool_id();
        //获取昨日的时间
        LocalDate date = LocalDate.now().minusDays(1);
        LocalDate theDay = LocalDate.now();
        System.out.println(date);
        map.put("list", agentEventServices.getUnfinishedBySchool(school_id, date, theDay));
        return "/backstage/optimization_time_sjdb_list";
    }

    //去编辑
    @RequestMapping(value = "/sjdb_to_update",params = "event_id")
    public String sjdbToUpdate(Integer event_id, Map<String,Object> map){
        map.put("agentEvent",agentEventServices.get(event_id));
        return "/backstage/optimization_time_sjdb_update";
    }


    //修改
    @RequestMapping(value="/sjdb_update",method= RequestMethod.POST)
    public String sjdbUpdate(AgentEvent agentEvent) {
        int event_id = agentEvent.getEvent_id();
        LocalDateTime  date = agentEvent.getOptimization_time();
        agentEventServices.setOptimizationTime(event_id, date);
        return "redirect:/optimization_time/sjdb_list";
    }


    //事物交易昨日信息列表
    @RequestMapping("/swjy_list")
    public String swjyList(Map<String, Object> map, HttpSession session){
        Employee employee = (Employee)session.getAttribute("employee");
        int school_id = employee.getSchool_id();
        //获取昨日的时间
        LocalDate date = LocalDate.now().minusDays(1);
        LocalDate theDay = LocalDate.now();
        System.out.println(date);
        map.put("list", transactionOfThingsServices.getUnfinishedBySchool(school_id, date, theDay));
        return "/backstage/optimization_time_swjy_list";
    }


    //事物交易去编辑
    @RequestMapping(value = "/swjy_to_update",params = "id")
    public String swjyToUpdate(Integer id, Map<String,Object> map){
        map.put("transactionOfThings", transactionOfThingsServices.get(id));
        return "/backstage/optimization_time_swjy_update";
    }


    //事物交易修改
    @RequestMapping(value="/swjy_update",method= RequestMethod.POST)
    public String swjyUpdate(TransactionOfThings transactionOfThings) {
        int id = transactionOfThings.getId();
        LocalDateTime date = transactionOfThings.getOptimization_time();
        agentEventServices.setOptimizationTime(id, date);
        return "redirect:/optimization_time/swjy_list";
    }





}
