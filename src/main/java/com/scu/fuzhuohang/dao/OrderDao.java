package com.scu.fuzhuohang.dao;

import com.sun.org.apache.xpath.internal.operations.Or;
import org.apache.ibatis.annotations.Param;
import org.springframework.core.annotation.Order;

import java.util.Date;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/9 17:55
 * @Version 1.0
 */
public interface OrderDao {

    public Order getOrder(@Param("oid") int orderId);

    public List<Order> getOrderAll(@Param("uid") int userId);

    public List<Order> getOrderByState(@Param("uid") int userId, @Param("ostate") int orderState);

    public int createOrder(@Param("order") Order order);

    public int deleteOrder(@Param("oid") int orderId);

    public int editOrder(@Param("oid") int orderId, @Param("order") Order order);

    public int updateState(@Param("oid") int orderId, @Param("ostate") int ostate, @Param("time")Date time);

    public int getCountByState(@Param("uid") int userId,@Param("ostate") int ostate);
}
