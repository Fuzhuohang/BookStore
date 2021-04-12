package com.scu.fuzhuohang.controller;


import com.scu.fuzhuohang.bean.Address;
import com.scu.fuzhuohang.bean.User;
import com.scu.fuzhuohang.service.AddressService;
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
 * @Date 2021/4/8 14:57
 * @Version 1.0
 */
@Controller
public class AddressController {

    @Autowired
    AddressService addressService;

    private static final String URL_1 = "redirect:/jsp/personalspace/shippingAddress.jsp";
    private static final String URL_2 = "shippingAddress";
    private static final String CURRENT_USER = "current_user";
    private static final String CURRENT_ADDRESSES = "current_addresses";
    private static final String MESSAGE = "message";

    @RequestMapping("/jsp/*/getAddressList")
    @ResponseBody
    public ModelAndView getAddressList(HttpSession session,
                                       ModelAndView modelAndView){
        int uid = ((User) session.getAttribute(CURRENT_USER)).getUid();
        List<Address> addresses = addressService.getAddresses(uid);
        session.setAttribute(CURRENT_ADDRESSES,addresses);
        modelAndView.addObject(MESSAGE,"获取成功");
        modelAndView.setViewName(URL_1);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/insertaddress")
    @ResponseBody
    public ModelAndView insertAddress(@RequestParam("uid") int uid,
                                      @RequestParam("reciveName") String reciveName,
                                      @RequestParam("phone") String phone,
                                      @RequestParam("address") String address,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        Address address1 = new Address();
        address1.setUid(uid);
        address1.setName(reciveName);
        address1.setTel(phone);
        address1.setAddr(address);
        if(addressService.addAddress(address1)!=0){
            List<Address> addresses = addressService.getAddresses(((User) session.getAttribute(CURRENT_USER)).getUid());
            session.setAttribute(CURRENT_ADDRESSES,addresses);
            modelAndView.addObject(MESSAGE,"添加成功");
            modelAndView.setViewName(URL_1);
        }else{
            modelAndView.addObject(MESSAGE,"添加失败");
            modelAndView.setViewName(URL_2);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/updateaddress")
    @ResponseBody
    public ModelAndView updateAddress(@RequestParam("addrid") int addrid,
                                      @RequestParam("reciveName") String reciveName,
                                      @RequestParam("phone") String phone,
                                      @RequestParam("address") String address,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        Address address1 = new Address();
        address1.setName(reciveName);
        address1.setTel(phone);
        address1.setAddr(address);
        if(addressService.editAddress(addrid,address1)!=0){
            List<Address> addresses = addressService.getAddresses(((User) session.getAttribute(CURRENT_USER)).getUid());
            session.setAttribute(CURRENT_ADDRESSES,addresses);
            modelAndView.addObject(MESSAGE,"更新成功");
            modelAndView.setViewName(URL_1);
        }else{
            modelAndView.addObject(MESSAGE,"更新失败");
            modelAndView.setViewName(URL_2);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deleteaddress")
    @ResponseBody
    public ModelAndView deleteAddressByAddr(@RequestParam("addrid") int addrid,
                                            HttpSession session,
                                            ModelAndView modelAndView){
        if(addressService.deleteAddressByAddr(addrid)!=0){
            List<Address> addresses = addressService.getAddresses(((User) session.getAttribute(CURRENT_USER)).getUid());
            session.setAttribute(CURRENT_ADDRESSES,addresses);
            modelAndView.addObject(MESSAGE,"删除成功");
            modelAndView.setViewName(URL_1);
        }else{
            modelAndView.addObject(MESSAGE,"删除失败");
            modelAndView.setViewName(URL_2);
        }
        return modelAndView;
    }
}
