package com.sjgh.dao;

import com.sjgh.entity.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单持久化操作类
 *
 * */

@Repository("ordersDao")//对dao实现类进行注解
public interface OrdersDao {
    //注册时
    void insert(Orders orders);
    //修改订单状态码(订单id，状态码)
    void updateStates(@Param("id") int id, @Param("state") int state);
    //修改发单者状态码
    void updateInvoiceStates(@Param("id") int id, @Param("invoiceStates") int invoiceStates);
    //修改接单者状态码
    void updateReceiptStates(@Param("id") int id, @Param("receiptStates") int receiptStates);

    List<Orders> selectAllForInvoice(@Param("invoice_user_id") String invoice_user_id);//发单者查询自己所有的订单
    List<Orders> selectAllForReceipt(@Param("receipt_user_id") String receipt_user_id);//接单者查询自己所有的订单

}
