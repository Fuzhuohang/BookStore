package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Orders;
import com.scu.fuzhuohang.service.OrdersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 18:45
 * @Version 1.0
 * OrderState(Ostate):
 *      0：新建
 *      1：待发货（未处理）
 *      2：待收货（未完成）
 *      3：已完成
 */
@Controller
public class OrdersController {

    @Autowired
    OrdersService ordersService;

    public ModelAndView getBusinessOrders(@Param("businessid") int businessId,
                                          HttpSession session,
                                          ModelAndView modelAndView){
        List<Orders> OrdersOfBusinessState01 = ordersService.getBusinessOrdersByState(businessId,1);
        List<Orders> OrdersOfBusinessState02 = ordersService.getBusinessOrdersByState(businessId,2);
        List<Orders> OrdersOfBusinessState03 = ordersService.getBusinessOrdersByState(businessId,3);
        List<Orders> OrdersOfBusiness = ordersService.getBusinessOrders(businessId);
        int CountOfBusinessState01 = ordersService.getBusinessCountByState(businessId,1);
        int CountOfBusinessState02 = ordersService.getBusinessCountByState(businessId,2);
        int CountOfBusinessState03 = ordersService.getBusinessCountByState(businessId,3);
        int CountOfBusiness = ordersService.getBusinessCount(businessId);
        session.setAttribute("orders_list_business_state01",OrdersOfBusinessState01);
        session.setAttribute("orders_list_business_state02",OrdersOfBusinessState02);
        session.setAttribute("orders_list_business_state03",OrdersOfBusinessState03);
        session.setAttribute("orders_list_business",OrdersOfBusiness);
        session.setAttribute("orders_count_business_state01",CountOfBusinessState01);
        session.setAttribute("orders_count_business_state02",CountOfBusinessState02);
        session.setAttribute("orders_count_business_state03",CountOfBusinessState03);
        session.setAttribute("orders_count_business",CountOfBusiness);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/business/businessorders");
        return modelAndView;
    }

}
