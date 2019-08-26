package com.sjgh.services.impl;

import com.sjgh.dao.OrdersDao;
import com.sjgh.entity.Orders;
import com.sjgh.services.OrdersServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ordersServices")
public class OrdersServicesImpl implements OrdersServices {
    @Qualifier("ordersDao")
    @Autowired
    private OrdersDao ordersDao;


    @Override
    public void add(Orders orders) {
        ordersDao.insert(orders);
    }

    @Override
    public void editState(int id, int state) {
        ordersDao.updateStates(id, state);
    }

    @Override
    public void editInvoiceStates(int id, int invoiceStates) {
        ordersDao.updateInvoiceStates(id, invoiceStates);
    }

    @Override
    public void editReceiptStates(int id, int receiptStates) {
        ordersDao.updateReceiptStates(id, receiptStates);
    }

    @Override
    public List<Orders> getAllForInvoice(String invoice_username) {
        return ordersDao.selectAllForInvoice(invoice_username);
    }

    @Override
    public List<Orders> getAllForReceipt(String receipt_username) {
        return ordersDao.selectAllForReceipt(receipt_username);
    }
}
