package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Orders;
import com.scu.fuzhuohang.dao.OrderDao;
import com.scu.fuzhuohang.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:28
 * @Version 1.0
 */
@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    OrderDao orderDao;

    @Override
    public Orders getAnOrder(int ordersId) {
        return orderDao.getOrder(ordersId);
    }

    @Override
    public List<Orders> getUserOrders(int userId) {
        return orderDao.getOrderAll(userId);
    }

    @Override
    public List<Orders> getUserOrdersByState(int userId, int state) {
        return orderDao.getOrderByState(userId, state);
    }

    @Override
    public List<Orders> getBusinessOrders(int businessId) {
        return orderDao.getBusinessOrderAll(businessId);
    }

    @Override
    public List<Orders> getBusinessOrdersByState(int businessId, int state) {
        return orderDao.getBusinessOrderByState(businessId, state);
    }

    @Override
    public int createOrder(Orders orders) {
        return orderDao.createOrder(orders);
    }

    @Override
    public int deleteOrder(int orderId) {
        return orderDao.deleteOrder(orderId);
    }

    @Override
    public int editOrder(int orderId, Orders orders) {
        return orderDao.editOrder(orderId, orders);
    }

    @Override
    public int updateState(int orderId, int state, Date time) {
        return orderDao.updateState(orderId,state,time);
    }

    @Override
    public int getUserCount(int userId) {
        return orderDao.getCount(userId);
    }

    @Override
    public int getUserCountByState(int userId, int state) {
        return orderDao.getCountByState(userId, state);
    }

    @Override
    public int getBusinessCount(int businessId) {
        return orderDao.getBusinessCount(businessId);
    }

    @Override
    public int getBusinessCountByState(int businessId, int state) {
        return orderDao.getBusinessCountByState(businessId, state);
    }
}
