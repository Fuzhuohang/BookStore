package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Business;
import com.scu.fuzhuohang.service.BusinessService;
import com.scu.fuzhuohang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

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
            session.setAttribute(CURRENT_BUSINESS,business);
            modelAndView.addObject(MESSAGE,"进入成功");
            modelAndView.setViewName(URL_2);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/enterproductbusiness")
    @ResponseBody
    public ModelAndView enterProductBusiness(@RequestParam("businessId") int businessId,
                                        HttpSession session,
                                        ModelAndView modelAndView){
        Business business = businessService.enterProductBusiness(businessId);
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
