package com.scu.fuzhuohang.controller;


import com.scu.fuzhuohang.bean.Address;
import com.scu.fuzhuohang.service.AddressService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/8 14:57
 * @Version 1.0
 */
public class AddressController {

    private AddressService addressService;

    @RequestMapping("getAddressList")
    @ResponseBody
    public String getAddressList(@RequestParam("uid") int uid,
                                        HttpSession session){
        System.out.println("uid:"+uid);
        List<Address> addresses = addressService.getAddresses(uid);
        session.setAttribute("current_addresses",addresses);
        return "addresses";
    }
}
