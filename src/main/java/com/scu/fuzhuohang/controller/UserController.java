package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.User;
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
 * @Version 1.0
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public ModelAndView login(@RequestParam("accountOrName") String accountOrName,
                              @RequestParam("password") String password,
                              HttpSession session,
                              ModelAndView modelAndView){
        User user = userService.login(accountOrName, password);
        if(user == null){
            modelAndView.addObject("message","登录失败，账号或密码错误");
            modelAndView.setViewName("loginForm");
        } else {
            session.setAttribute("current_user", user);
            modelAndView.addObject("messge","登录成功");
            modelAndView.setViewName("/mainM");
        }
        return modelAndView;
    }

    public ModelAndView logout(@RequestParam("account") String account,
                               HttpSession session,
                               ModelAndView modelAndView){
        if (userService.logout(account)!=0){
            session.removeAttribute("current_user");
            modelAndView.setViewName("/loginForm");
        } else {
            modelAndView.setViewName("mainM");
        }
        return modelAndView;
    }
}
