package com.sjgh.services;

import com.sjgh.entity.Orders;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单业务实现类
 *
 *
 * */

@Service("ordersServices")
public interface OrdersServices {
    void add(Orders orders);
    //编辑状态码
    void editState(int id, int state);
    //编辑发单者状态码
    void editInvoiceStates(int id, int invoiceStates);
    //编辑接单者状态码
    void editReceiptStates(int id, int receiptStates);
    //发单者查询自己所有的订单
    List<Orders> getAllForInvoice(String invoice_username);
    //接单者查询自己所有的订单
    List<Orders> getAllForReceipt(String receipt_username);
}
