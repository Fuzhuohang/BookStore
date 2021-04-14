package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Orders;
import com.scu.fuzhuohang.bean.mergebean.BusinessOrders;
import com.scu.fuzhuohang.bean.mergebean.UserOrders;
import com.scu.fuzhuohang.service.OrdersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping("/jsp/*/getbusinessorders")
    @ResponseBody
    public ModelAndView getBusinessOrders(@Param("bid") int bid,
                                          HttpSession session,
                                          ModelAndView modelAndView){
        List<BusinessOrders> OrdersOfBusinessState01 = ordersService.getBusinessOrdersByState(bid,1);
        List<BusinessOrders> OrdersOfBusinessState02 = ordersService.getBusinessOrdersByState(bid,2);
        List<BusinessOrders> OrdersOfBusinessState03 = ordersService.getBusinessOrdersByState(bid,3);
        int CountOfBusinessState01 = ordersService.getBusinessCountByState(bid,1);
        int CountOfBusinessState02 = ordersService.getBusinessCountByState(bid,2);
        int CountOfBusinessState03 = ordersService.getBusinessCountByState(bid,3);
        int CountOfBusiness = ordersService.getBusinessCount(bid);
        session.setAttribute("orders_list_business_state01",OrdersOfBusinessState01);
        session.setAttribute("orders_list_business_state02",OrdersOfBusinessState02);
        session.setAttribute("orders_list_business_state03",OrdersOfBusinessState03);
        session.setAttribute("orders_count_business_state01",CountOfBusinessState01);
        session.setAttribute("orders_count_business_state02",CountOfBusinessState02);
        session.setAttribute("orders_count_business_state03",CountOfBusinessState03);
        session.setAttribute("orders_count_business",CountOfBusiness);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/business/businessorders.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/upstateorderstatebusiness")
    @ResponseBody
    public ModelAndView updateBusinessOrders(@Param("bid") int bid,
                                             @Param("oid") int oid,
                                             @Param("ostate") int ostate,
                                             HttpSession session,
                                             ModelAndView modelAndView){
        if(ordersService.updateState(oid,ostate)!=0){
            List<BusinessOrders> OrdersOfBusinessState01 = ordersService.getBusinessOrdersByState(bid,1);
            List<BusinessOrders> OrdersOfBusinessState02 = ordersService.getBusinessOrdersByState(bid,2);
            List<BusinessOrders> OrdersOfBusinessState03 = ordersService.getBusinessOrdersByState(bid,3);
            int CountOfBusinessState01 = ordersService.getBusinessCountByState(bid,1);
            int CountOfBusinessState02 = ordersService.getBusinessCountByState(bid,2);
            int CountOfBusinessState03 = ordersService.getBusinessCountByState(bid,3);
            int CountOfBusiness = ordersService.getBusinessCount(bid);
            session.setAttribute("orders_list_business_state01",OrdersOfBusinessState01);
            session.setAttribute("orders_list_business_state02",OrdersOfBusinessState02);
            session.setAttribute("orders_list_business_state03",OrdersOfBusinessState03);
            session.setAttribute("orders_count_business_state01",CountOfBusinessState01);
            session.setAttribute("orders_count_business_state02",CountOfBusinessState02);
            session.setAttribute("orders_count_business_state03",CountOfBusinessState03);
            session.setAttribute("orders_count_business",CountOfBusiness);
            modelAndView.addObject("message","状态更新成功");
            modelAndView.setViewName("redirect:/jsp/business/businessorders.jsp");
        } else{
            modelAndView.addObject("message","状态更新失败");
            modelAndView.setViewName("businessorders");
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getuserorders")
    @ResponseBody
    public ModelAndView getUserOrders(@Param("uid") int uid,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        List<UserOrders> OrdersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
        List<UserOrders> OrdersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
        List<UserOrders> OrdersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
        int CountOfUserState01 = ordersService.getUserCountByState(uid,1);
        int CountOfUserState02 = ordersService.getUserCountByState(uid,2);
        int CountOfUserState03 = ordersService.getUserCountByState(uid,3);
        int CountOfUser = ordersService.getUserCount(uid);
        session.setAttribute("orders_list_user_state01",OrdersOfUserState01);
        session.setAttribute("orders_list_user_state02",OrdersOfUserState02);
        session.setAttribute("orders_list_user_state03",OrdersOfUserState03);
        session.setAttribute("orders_count_user_state01",CountOfUserState01);
        session.setAttribute("orders_count_user_state02",CountOfUserState02);
        session.setAttribute("orders_count_user_state03",CountOfUserState03);
        session.setAttribute("orders_count_user",CountOfUser);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/shopping/orders.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/upstateorderstateuser")
    @ResponseBody
    public ModelAndView updateUserOrders(@Param("uid") int uid,
                                         @Param("oid") int oid,
                                         @Param("ostate") int ostate,
                                         HttpSession session,
                                         ModelAndView modelAndView){
        if(ordersService.updateState(oid,ostate)!=0){
            List<UserOrders> OrdersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
            List<UserOrders> OrdersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
            List<UserOrders> OrdersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
            int CountOfUserState01 = ordersService.getUserCountByState(uid,1);
            int CountOfUserState02 = ordersService.getUserCountByState(uid,2);
            int CountOfUserState03 = ordersService.getUserCountByState(uid,3);
            int CountOfUser = ordersService.getUserCount(uid);
            session.setAttribute("orders_list_user_state01",OrdersOfUserState01);
            session.setAttribute("orders_list_user_state02",OrdersOfUserState02);
            session.setAttribute("orders_list_user_state03",OrdersOfUserState03);
            session.setAttribute("orders_count_user_state01",CountOfUserState01);
            session.setAttribute("orders_count_user_state02",CountOfUserState02);
            session.setAttribute("orders_count_user_state03",CountOfUserState03);
            session.setAttribute("orders_count_user",CountOfUser);
            modelAndView.addObject("message","状态更新成功");
            modelAndView.setViewName("redirect:/jsp/shopping/orders.jsp");
        } else{
            modelAndView.addObject("message","状态更新失败");
            modelAndView.setViewName("orders");
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deleteorders")
    @ResponseBody
    public ModelAndView deleteOrders(@Param("uid") int uid,
                                     @Param("oid") int oid,
                                     HttpSession session,
                                     ModelAndView modelAndView){
        if(ordersService.deleteOrder(oid)!=0){
            List<UserOrders> OrdersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
            List<UserOrders> OrdersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
            List<UserOrders> OrdersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
            int CountOfUserState01 = ordersService.getUserCountByState(uid,1);
            int CountOfUserState02 = ordersService.getUserCountByState(uid,2);
            int CountOfUserState03 = ordersService.getUserCountByState(uid,3);
            int CountOfUser = ordersService.getUserCount(uid);
            session.setAttribute("orders_list_user_state01",OrdersOfUserState01);
            session.setAttribute("orders_list_user_state02",OrdersOfUserState02);
            session.setAttribute("orders_list_user_state03",OrdersOfUserState03);
            session.setAttribute("orders_count_user_state01",CountOfUserState01);
            session.setAttribute("orders_count_user_state02",CountOfUserState02);
            session.setAttribute("orders_count_user_state03",CountOfUserState03);
            session.setAttribute("orders_count_user",CountOfUser);
            modelAndView.addObject("message","订单删除成功");
            modelAndView.setViewName("redirect:/jsp/shopping/orders.jsp");
        } else{
            modelAndView.addObject("message","订单删除失败");
            modelAndView.setViewName("orders");
        }
        return modelAndView;
    }
}
