package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Orders;
import com.scu.fuzhuohang.bean.mergebean.BusinessOrders;
import com.scu.fuzhuohang.bean.mergebean.UserOrders;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/9 17:55
 * @Version 1.0
 */
public interface OrderDao {

    public Orders getOrder(@Param("oid") int orderId);

    public UserOrders getUserOrder(@Param("oid") int orderId);

    public List<UserOrders> getOrderAll(@Param("uid") int userId);

    public List<UserOrders> getOrderByState(@Param("uid") int userId, @Param("ostate") int orderState);

    public List<BusinessOrders> getBusinessOrderAll(@Param("bid") int businessId);

    public List<BusinessOrders> getBusinessOrderByState(@Param("bid") int businessId, @Param("ostate") int orderState);

    public int createOrder(@Param("order") Orders order);

    public int deleteOrder(@Param("oid") int orderId);

    public int editOrder(@Param("oid") int orderId, @Param("order") Orders order);

    public int settleOrder(@Param("oid") int orderId, @Param("order") Orders order);

    public int updateState(@Param("oid") int orderId, @Param("ostate") int ostate);

    public int getCount(@Param("uid") int userId);

    public int getCountByState(@Param("uid") int userId,@Param("ostate") int ostate);

    public int getBusinessCount(@Param("bid") int businessId);

    public int getBusinessCountByState(@Param("bid") int businessId,@Param("ostate") int ostate);
}
