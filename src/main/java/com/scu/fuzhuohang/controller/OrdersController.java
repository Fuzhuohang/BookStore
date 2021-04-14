package com.scu.fuzhuohang.controller;

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

    private static final String ORDERS_LIST_USER_STATE = "orders_list_user_state";
    private static final String ORDERS_COUNT_USER_STATE = "orders_count_user_state";
    private static final String ORDERS_LIST_BUSINESS_STATE = "orders_list_business_state";
    private static final String ORDERS_COUNT_BUSINESS_STATE = "orders_count_business_state01";
    private static final String ORDERS_COUNT_USER = "orders_count_user";
    private static final String ORDERS_COUNT_BUSINESS = "orders_count_business";
    private static final String MESSAGE = "message";
    private static final String URL_1 = "redirect:/jsp/shopping/orders.jsp";
    private static final String URL_2 = "redirect:/jsp/business/businessorders.jsp";

    @RequestMapping("/jsp/*/getbusinessorders")
    @ResponseBody
    public ModelAndView getBusinessOrders(@Param("bid") int bid,
                                          HttpSession session,
                                          ModelAndView modelAndView){
        List<BusinessOrders> ordersOfBusinessState01 = ordersService.getBusinessOrdersByState(bid,1);
        List<BusinessOrders> ordersOfBusinessState02 = ordersService.getBusinessOrdersByState(bid,2);
        List<BusinessOrders> ordersOfBusinessState03 = ordersService.getBusinessOrdersByState(bid,3);
        int countOfBusinessState01 = ordersService.getBusinessCountByState(bid,1);
        int countOfBusinessState02 = ordersService.getBusinessCountByState(bid,2);
        int countOfBusinessState03 = ordersService.getBusinessCountByState(bid,3);
        int countOfBusiness = ordersService.getBusinessCount(bid);
        session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"01",ordersOfBusinessState01);
        session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"02",ordersOfBusinessState02);
        session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"03",ordersOfBusinessState03);
        session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"01",countOfBusinessState01);
        session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"02",countOfBusinessState02);
        session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"03",countOfBusinessState03);
        session.setAttribute(ORDERS_COUNT_BUSINESS,countOfBusiness);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_2);
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
            List<BusinessOrders> ordersOfBusinessState01 = ordersService.getBusinessOrdersByState(bid,1);
            List<BusinessOrders> ordersOfBusinessState02 = ordersService.getBusinessOrdersByState(bid,2);
            List<BusinessOrders> ordersOfBusinessState03 = ordersService.getBusinessOrdersByState(bid,3);
            int countOfBusinessState01 = ordersService.getBusinessCountByState(bid,1);
            int countOfBusinessState02 = ordersService.getBusinessCountByState(bid,2);
            int countOfBusinessState03 = ordersService.getBusinessCountByState(bid,3);
            int countOfBusiness = ordersService.getBusinessCount(bid);
            session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"01",ordersOfBusinessState01);
            session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"02",ordersOfBusinessState02);
            session.setAttribute(ORDERS_LIST_BUSINESS_STATE+"03",ordersOfBusinessState03);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"01",countOfBusinessState01);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"02",countOfBusinessState02);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"03",countOfBusinessState03);
            session.setAttribute(ORDERS_COUNT_BUSINESS,countOfBusiness);
            modelAndView.addObject(MESSAGE,"状态更新成功");
            modelAndView.setViewName(URL_2);
        } else{
            modelAndView.addObject(MESSAGE,"状态更新失败");
            modelAndView.setViewName("businessorders");
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getuserorders")
    @ResponseBody
    public ModelAndView getUserOrders(@Param("uid") int uid,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        List<UserOrders> ordersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
        List<UserOrders> ordersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
        List<UserOrders> ordersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
        int countOfUserState01 = ordersService.getUserCountByState(uid,1);
        int countOfUserState02 = ordersService.getUserCountByState(uid,2);
        int countOfUserState03 = ordersService.getUserCountByState(uid,3);
        int countOfUser = ordersService.getUserCount(uid);
        session.setAttribute(ORDERS_LIST_USER_STATE+"01",ordersOfUserState01);
        session.setAttribute(ORDERS_LIST_USER_STATE+"02",ordersOfUserState02);
        session.setAttribute(ORDERS_LIST_USER_STATE+"03",ordersOfUserState03);
        session.setAttribute(ORDERS_COUNT_USER_STATE+"01",countOfUserState01);
        session.setAttribute(ORDERS_COUNT_USER_STATE+"02",countOfUserState02);
        session.setAttribute(ORDERS_COUNT_USER_STATE+"03",countOfUserState03);
        session.setAttribute(ORDERS_COUNT_USER,countOfUser);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_1);
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
            List<UserOrders> ordersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
            List<UserOrders> ordersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
            List<UserOrders> ordersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
            int countOfUserState01 = ordersService.getUserCountByState(uid,1);
            int countOfUserState02 = ordersService.getUserCountByState(uid,2);
            int countOfUserState03 = ordersService.getUserCountByState(uid,3);
            int countOfUser = ordersService.getUserCount(uid);
            session.setAttribute(ORDERS_LIST_USER_STATE+"01",ordersOfUserState01);
            session.setAttribute(ORDERS_LIST_USER_STATE+"02",ordersOfUserState02);
            session.setAttribute(ORDERS_LIST_USER_STATE+"03",ordersOfUserState03);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"01",countOfUserState01);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"02",countOfUserState02);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"03",countOfUserState03);
            session.setAttribute(ORDERS_COUNT_USER,countOfUser);
            modelAndView.addObject(MESSAGE,"状态更新成功");
            modelAndView.setViewName(URL_1);
        } else{
            modelAndView.addObject(MESSAGE,"状态更新失败");
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
            List<UserOrders> ordersOfUserState01 = ordersService.getUserOrdersByState(uid,1);
            List<UserOrders> ordersOfUserState02 = ordersService.getUserOrdersByState(uid,2);
            List<UserOrders> ordersOfUserState03 = ordersService.getUserOrdersByState(uid,3);
            int countOfUserState01 = ordersService.getUserCountByState(uid,1);
            int countOfUserState02 = ordersService.getUserCountByState(uid,2);
            int countOfUserState03 = ordersService.getUserCountByState(uid,3);
            int countOfUser = ordersService.getUserCount(uid);
            session.setAttribute(ORDERS_LIST_USER_STATE+"01",ordersOfUserState01);
            session.setAttribute(ORDERS_LIST_USER_STATE+"02",ordersOfUserState02);
            session.setAttribute(ORDERS_LIST_USER_STATE+"03",ordersOfUserState03);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"01",countOfUserState01);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"02",countOfUserState02);
            session.setAttribute(ORDERS_COUNT_USER_STATE+"03",countOfUserState03);
            session.setAttribute(ORDERS_COUNT_USER,countOfUser);
            modelAndView.addObject(MESSAGE,"订单删除成功");
            modelAndView.setViewName(URL_1);
        } else{
            modelAndView.addObject(MESSAGE,"订单删除失败");
            modelAndView.setViewName("orders");
        }
        return modelAndView;
    }
}
