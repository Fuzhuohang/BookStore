package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Orders;
import com.scu.fuzhuohang.bean.mergebean.BusinessOrders;
import com.scu.fuzhuohang.bean.mergebean.UserOrders;

import java.util.Date;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:28
 * @Version 1.0
 */
public interface OrdersService {

    public Orders getAnOrder(int ordersId);

    public List<UserOrders> getUserOrders(int userId);

    public List<UserOrders> getUserOrdersByState(int userId, int state);

    public List<BusinessOrders> getBusinessOrders(int businessId);

    public List<BusinessOrders> getBusinessOrdersByState(int businessId, int state);

    public int createOrder(Orders orders);

    public int deleteOrder(int orderId);

    public int editOrder(int orderId,Orders orders);

    public int settleOrder(int orderId, Orders order);

    public int updateState(int orderId, int state);

    public int getUserCount(int userId);

    public int getUserCountByState(int userId, int state);

    public int getBusinessCount(int businessId);

    public int getBusinessCountByState(int businessId, int state);
}
