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

    private static final String MESSAGE = "message";
    private static final String CURRENT_BUSINESS = "current_business";
    private static final String URL_1 = "redirect:/jsp/business/createbusiness.jsp";
    private static final String URL_2 = "redirect:/jsp/business/mybusiness.jsp";

    @RequestMapping("/jsp/*/entermybusiness")
    @ResponseBody
    public ModelAndView enterMyBusiness(@RequestParam("userId") int userId,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Business business = businessService.enterMyBusiness(userId);
        if(business == null){
            modelAndView.addObject(MESSAGE,"您没有开设自己的店铺，请先进行店铺申请注册");
            modelAndView.setViewName(URL_1);
        }else {
            int CountOfBusinessState01 = ordersService.getBusinessCountByState(business.getBid(),1);
            int CountOfBusinessState02 = ordersService.getBusinessCountByState(business.getBid(),2);
            int CountOfBusinessState03 = ordersService.getBusinessCountByState(business.getBid(),3);
            session.setAttribute("orders_count_business_state01",CountOfBusinessState01);
            session.setAttribute("orders_count_business_state02",CountOfBusinessState02);
            session.setAttribute("orders_count_business_state03",CountOfBusinessState03);
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"进入成功");
            modelAndView.setViewName(URL_2);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/enterbusinessproduct")
    @ResponseBody
    public ModelAndView enterBusinessProduct(@RequestParam("bid") int bid,
                                             HttpSession session,
                                             ModelAndView modelAndView){
        List<Product> productList = productService.getProductListByBusiness(bid);
        session.setAttribute("business_products",productList);
        modelAndView.addObject(MESSAGE, "加载成功");
        modelAndView.setViewName("redirect:/jsp/business/businessProducts.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/enterproductbusiness")
    @ResponseBody
    public ModelAndView enterProductBusiness(@RequestParam("bid") int bid,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Business business = businessService.enterProductBusiness(bid);
        if(business == null){
            modelAndView.addObject(MESSAGE,"该店铺不存在");

        }else {
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"进入成功");

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
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"申请成功");
            modelAndView.setViewName(URL_2);
        }else {
            modelAndView.addObject(MESSAGE,"申请失败");
            modelAndView.setViewName("createbusiness");
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
            modelAndView.setViewName("redirect:/jsp/business/changeBusinessInfo.jsp");
        }else{
            modelAndView.addObject(MESSAGE,"修改失败");
            modelAndView.setViewName("changeBusinessInfo");
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
            modelAndView.setViewName("redirect:/jsp/shopping/shopindex1.jsp");
        }
        return modelAndView;
    }
}
