package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Business;
import com.scu.fuzhuohang.bean.Product;
import com.scu.fuzhuohang.service.BusinessService;
import com.scu.fuzhuohang.service.OrdersService;
import com.scu.fuzhuohang.service.ProductService;
import com.scu.fuzhuohang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.scu.fuzhuohang.res.Session.*;
import static com.scu.fuzhuohang.res.Url.*;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 10:04
 * @Version 1.0
 */
@Controller
public class BusinessController {
    @Autowired
    BusinessService businessService;

    @Autowired
    UserService userService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    ProductService productService;

    @RequestMapping("/jsp/*/entermybusiness")
    @ResponseBody
    public ModelAndView enterMyBusiness(@RequestParam("userId") int userId,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Business business = businessService.enterMyBusiness(userId);
        if(business == null){
            modelAndView.addObject(MESSAGE,"您没有开设自己的店铺，请先进行店铺申请注册");
            modelAndView.setViewName(URL_CREATE_BUSINESS);
        }else {
            int countOfBusinessState01 = ordersService.getBusinessCountByState(business.getBid(),1);
            int countOfBusinessState02 = ordersService.getBusinessCountByState(business.getBid(),2);
            int countOfBusinessState03 = ordersService.getBusinessCountByState(business.getBid(),3);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"01",countOfBusinessState01);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"02",countOfBusinessState02);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"03",countOfBusinessState03);
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"进入成功");
            modelAndView.setViewName(URL_MY_BUSINESS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/enterbusinessproduct")
    @ResponseBody
    public ModelAndView enterBusinessProduct(@RequestParam("bid") int bid,
                                             HttpSession session,
                                             ModelAndView modelAndView){
        List<Product> productList = productService.getProductListByBusiness(bid);
        session.setAttribute(BUSINESS_PRODUCTS,productList);
        modelAndView.addObject(MESSAGE, "加载成功");
        modelAndView.setViewName(URL_BUSINESS_PRODUCTS);
        return modelAndView;
    }



    @RequestMapping("/jsp/*/enterproductbusiness")
    @ResponseBody
    public ModelAndView enterProductBusiness(@RequestParam("bid") int bid,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Business business = businessService.enterProductBusiness(bid);
        List<Product> productList = productService.getProductListByBusiness(bid);
        if(business == null){
            modelAndView.addObject(MESSAGE,"该店铺不存在");
        }else {
            session.setAttribute(CURRENT_BUSINESS,business);
            session.setAttribute(BUSINESS_PRODUCTS,productList);
            modelAndView.addObject(MESSAGE,"进入成功");
            modelAndView.setViewName(URL_PRODUCTS_BUSINESS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/registerbusiness")
    @ResponseBody
    public ModelAndView register(@RequestParam("uid") int uid,
                                 @RequestParam("bname") String bname,
                                 @RequestParam("baddr") String bAddr,
                                 HttpSession session,
                                 ModelAndView modelAndView){
        Business business = new Business();
        business.setUid(uid);
        business.setBname(bname);
        business.setBAddr(bAddr);
        if(businessService.register(business)!=0 && userService.updateIsBusiness(uid,1)!=0){
            business = businessService.enterMyBusiness(business.getUid());
            int countOfBusinessState01 = ordersService.getBusinessCountByState(business.getBid(),1);
            int countOfBusinessState02 = ordersService.getBusinessCountByState(business.getBid(),2);
            int countOfBusinessState03 = ordersService.getBusinessCountByState(business.getBid(),3);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"01",countOfBusinessState01);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"02",countOfBusinessState02);
            session.setAttribute(ORDERS_COUNT_BUSINESS_STATE+"03",countOfBusinessState03);
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"申请成功");
            modelAndView.setViewName(URL_MY_BUSINESS);
        }else {
            modelAndView.addObject(MESSAGE,"申请失败");
            modelAndView.setViewName(URL_CREATE_BUSINESS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/updatebusinessinfo")
    @ResponseBody
    public ModelAndView updateBusinessInfo(@RequestParam("uid") int uid,
                                           @RequestParam("bname") String bname,
                                           @RequestParam("baddr") String bAddr,
                                           HttpSession session,
                                           ModelAndView modelAndView){
        Business business = new Business();
        business.setUid(uid);
        business.setBname(bname);
        business.setBAddr(bAddr);
        if(businessService.changeBusinessInfo(uid,business)!=0){
            business=businessService.enterMyBusiness(uid);
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"修改成功");
            modelAndView.setViewName(URL_CHANGE_BUSINESS_INFO);
        }else{
            modelAndView.addObject(MESSAGE,"修改失败");
            modelAndView.setViewName(URL_CHANGE_BUSINESS_INFO);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deletebusiness")
    @ResponseBody
    public ModelAndView writeOff(@RequestParam("uid") int uid,
                        HttpSession session,
                        ModelAndView modelAndView){
        if(businessService.delete(uid)!=0 && userService.updateIsBusiness(uid,0)!=0){
            session.removeAttribute(CURRENT_BUSINESS);
            modelAndView.setViewName(URL_SHOP_INDEX_01);
        }
        return modelAndView;
    }
}
