package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.*;
import com.scu.fuzhuohang.bean.mergebean.BusinessOrders;
import com.scu.fuzhuohang.bean.mergebean.UserOrders;
import com.scu.fuzhuohang.service.AddressService;
import com.scu.fuzhuohang.service.OrdersService;
import com.scu.fuzhuohang.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

import static com.scu.fuzhuohang.res.Session.*;
import static com.scu.fuzhuohang.res.Url.*;

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

    @Autowired
    AddressService addressService;

    @Autowired
    ProductService productService;

    @RequestMapping("/jsp/*/getbusinessorders")
    @ResponseBody
    public ModelAndView getBusinessOrders(@RequestParam("bid") int bid,
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
        modelAndView.setViewName(URL_BUSINESS_ORDERS);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/upstateorderstatebusiness")
    @ResponseBody
    public ModelAndView updateBusinessOrders(@RequestParam("bid") int bid,
                                             @RequestParam("oid") int oid,
                                             @RequestParam("ostate") int ostate,
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
            modelAndView.setViewName(URL_BUSINESS_ORDERS);
        } else{
            modelAndView.addObject(MESSAGE,"状态更新失败");
            modelAndView.setViewName(URL_BUSINESS_ORDERS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getuserorders")
    @ResponseBody
    public ModelAndView getUserOrders(@RequestParam("uid") int uid,
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
        modelAndView.setViewName(URL_ORDERS);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/upstateorderstateuser")
    @ResponseBody
    public ModelAndView updateUserOrders(@RequestParam("uid") int uid,
                                         @RequestParam("oid") int oid,
                                         @RequestParam("ostate") int ostate,
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
            modelAndView.setViewName(URL_ORDERS);
        } else{
            modelAndView.addObject(MESSAGE,"状态更新失败");
            modelAndView.setViewName(URL_ORDERS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deleteorders")
    @ResponseBody
    public ModelAndView deleteOrders(@RequestParam("uid") int uid,
                                     @RequestParam("oid") int oid,
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
            modelAndView.setViewName(URL_ORDERS);
        } else{
            modelAndView.addObject(MESSAGE,"订单删除失败");
            modelAndView.setViewName(URL_ORDERS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getshoppingcart")
    @ResponseBody
    public ModelAndView getShoppingCart(@RequestParam("uid") int uid,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        List<UserOrders> ordersInShoppingCart = ordersService.getUserOrdersByState(uid,0);
        session.setAttribute(ORDERS_LIST_USER_STATE+"00",ordersInShoppingCart);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_SHOPPING_CART);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/addshoppingcart")
    @ResponseBody
    public ModelAndView addShoppingCart(@RequestParam("uid") int uid,
                                        @RequestParam("pnum") int pnum,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Product product = (Product) session.getAttribute(PRODUCT_INFO);
        Orders orders = new Orders();
        orders.setUid(uid);
        orders.setBid(product.getBid());
        orders.setPid(product.getPid());
        orders.setPnum(pnum);
        orders.setMoney(product.getPrice());
        orders.setTotal(product.getPrice() * pnum);
        orders.setOstate(0);
        if(ordersService.createOrder(orders)!=0){
            modelAndView.addObject(MESSAGE,"添加成功");
            modelAndView.setViewName(URL_PRODUCT_INFO);
        }else {
            modelAndView.addObject(MESSAGE,"添加失败");
            modelAndView.setViewName(URL_PRODUCT_INFO);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/topayment")
    @ResponseBody
    public ModelAndView toPayment(@RequestParam("uid") int uid,
                                  @RequestParam("pnum") int pnum,
                                  HttpSession session,
                                  ModelAndView modelAndView){
        Product product = (Product) session.getAttribute(PRODUCT_INFO);
        Business business = (Business) session.getAttribute(PRODUCT_BUSINESS);
        UserOrders userOrders = new UserOrders();
        userOrders.setOid(0);
        userOrders.setBname(business.getBname());
        userOrders.setPname(product.getPname());
        userOrders.setPnum(pnum);
        userOrders.setMoney(product.getPrice());
        userOrders.setTotal(product.getPrice()*pnum);
        userOrders.setUid(uid);
        userOrders.setBid(business.getBid());
        userOrders.setPid(product.getPid());
        List<Address> addresses = addressService.getAddresses(uid);
        session.setAttribute(CURRENT_ADDRESSES,addresses);
        session.setAttribute(PRODUCT_PAID,userOrders);
        modelAndView.addObject(MESSAGE,"跳转成功");
        modelAndView.setViewName(URL_CREATE_ORDERS);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/topayment2")
    @ResponseBody
    public ModelAndView toPayment2(@RequestParam("oid") int oid,
                                  @RequestParam("uid") int uid,
                                  HttpSession session,
                                  ModelAndView modelAndView){
        List<UserOrders> userOrdersList = (List<UserOrders>) session.getAttribute(ORDERS_LIST_USER_STATE+"00");
        for(UserOrders userOrders : userOrdersList){
            if(userOrders.getOid() == oid){
                List<Address> addresses = addressService.getAddresses(uid);
                session.setAttribute(CURRENT_ADDRESSES,addresses);
                session.setAttribute(PRODUCT_PAID,userOrders);
                modelAndView.addObject(MESSAGE,"跳转成功");
                modelAndView.setViewName(URL_CREATE_ORDERS);
            }
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/payment")
    @ResponseBody
    public ModelAndView pay(@RequestParam("uid") int uid,
                            @RequestParam("bid") int bid,
                            @RequestParam("pid") int pid,
                            @RequestParam("addrid") int addrid,
                            HttpSession session,
                            ModelAndView modelAndView){
        UserOrders userOrders = (UserOrders) session.getAttribute(PRODUCT_PAID);
        Orders orders = new Orders();
        orders.setUid(uid);
        orders.setBid(bid);
        orders.setPid(pid);
        orders.setPnum(userOrders.getPnum());
        orders.setMoney(userOrders.getMoney());
        orders.setOstate(1);
        orders.setAddrId(addrid);
        orders.setTime(new Timestamp(System.currentTimeMillis()));
        orders.setTotal(userOrders.getTotal());
        if(userOrders.getOid()==0){
            if(ordersService.createOrder(orders)!=0){
                productService.updateNum(pid,userOrders.getPnum());
                modelAndView.addObject("支付成功");
                modelAndView.setViewName(URL_PAY_SUCCESS);
            }
        }else{
            if(ordersService.settleOrder(userOrders.getOid(),orders)!=0){
                productService.updateNum(pid,userOrders.getPnum());
                modelAndView.addObject("支付成功");
                modelAndView.setViewName(URL_PAY_SUCCESS);
            }
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/tocreatecomment")
    @ResponseBody
    public ModelAndView toCreateComment(@RequestParam("oid") int oid,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        UserOrders userOrders = ordersService.getUserOrder(oid);
        session.setAttribute(COMMENT_ORDERS,userOrders);
        modelAndView.addObject(MESSAGE);
        modelAndView.setViewName(URL_COMMENTS);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/updateordersinfo")
    @ResponseBody
    public ModelAndView updateOrderInfo(@RequestParam("oid") int oid,
                                        @RequestParam("pnum") int pnum,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        User user = (User) session.getAttribute(CURRENT_USER);
        Orders orders = new Orders();
        orders.setPnum(pnum);
        orders.setTotal(pnum * ordersService.getAnOrder(oid).getMoney());
        if(ordersService.editOrder(oid,orders)!=0){
            List<UserOrders> ordersInShoppingCart = ordersService.getUserOrdersByState(user.getUid(),0);
            session.setAttribute(ORDERS_LIST_USER_STATE+"00",ordersInShoppingCart);
            modelAndView.addObject(MESSAGE,"修改成功");
            modelAndView.setViewName(URL_SHOPPING_CART);
        }else {
            modelAndView.addObject(MESSAGE,"修改失败");
            modelAndView.setViewName(URL_SHOPPING_CART);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deletecart")
    @ResponseBody
    public ModelAndView deleteCart(@RequestParam("oid") int oid,
                                   HttpSession session,
                                   ModelAndView modelAndView){
        if(ordersService.deleteOrder(oid)!=0){
            List<UserOrders> ordersInShoppingCart = ordersService.getUserOrdersByState(((User) session.getAttribute(CURRENT_USER)).getUid(),0);
            session.setAttribute(ORDERS_LIST_USER_STATE+"00",ordersInShoppingCart);
            modelAndView.addObject(MESSAGE,"订单删除成功");
            modelAndView.setViewName(URL_SHOPPING_CART);
        } else{
            modelAndView.addObject(MESSAGE,"订单删除失败");
            modelAndView.setViewName(URL_SHOPPING_CART);
        }
        return modelAndView;
    }
}
