package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.User;
import com.scu.fuzhuohang.service.AddressService;
import com.scu.fuzhuohang.service.OrdersService;
import com.scu.fuzhuohang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import static com.scu.fuzhuohang.res.Session.*;
import static com.scu.fuzhuohang.res.Url.*;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;

    @Autowired
    OrdersService ordersService;

    @RequestMapping("/jsp/*/login")
    @ResponseBody
    public ModelAndView login(@RequestParam("accountOrName") String accountOrName,
                              @RequestParam("password") String password,
                              HttpSession session,
                              ModelAndView modelAndView){
        User user = userService.login(accountOrName, password);
        if(user == null){
            modelAndView.addObject(MESSAGE,"登录失败，账号或密码错误");
            modelAndView.setViewName(URL_LOGIN);
        } else {
            session.setAttribute(ORDERS_COUNT_USER_STATE+"00",ordersService.getUserCountByState(user.getUid(),0));
            session.setAttribute(ORDERS_COUNT_USER_STATE+"01",ordersService.getUserCountByState(user.getUid(),1));
            session.setAttribute(ORDERS_COUNT_USER_STATE+"02",ordersService.getUserCountByState(user.getUid(),2));
            session.setAttribute(ORDERS_COUNT_USER_STATE+"03",ordersService.getUserCountByState(user.getUid(),3));
            session.setAttribute(CURRENT_USER, user);
            modelAndView.addObject(MESSAGE,"登录成功");
            modelAndView.setViewName(URL_SHOP_INDEX_01);
        }
        return modelAndView;
    }

    @RequestMapping("jsp/*/logout")
    @ResponseBody
    public ModelAndView logout(HttpSession session,
                               ModelAndView modelAndView){
        session.removeAttribute(CURRENT_USER);
        modelAndView.setViewName(URL_INDEX);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/register")
    @ResponseBody
    public ModelAndView register(@RequestParam("tel") String tel,
                                 @RequestParam("password") String password,
                                 HttpSession session,
                                 ModelAndView modelAndView){
        User exist = userService.getUser(tel);
        if(exist == null){
            User user = new User();
            user.setAccount(tel);
            user.setUsername(tel);
            user.setTel(tel);
            user.setPassword(password);
            if(userService.register(user)!=0){
                user = userService.login(user.getAccount(), password);
                session.setAttribute(CURRENT_USER, user);
                modelAndView.addObject(MESSAGE,"注册成功");
                modelAndView.setViewName(URL_SHOP_INDEX_01);
            }
        } else{
            modelAndView.addObject(MESSAGE,"注册失败");
            modelAndView.setViewName(URL_REGISTER);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/updatepwd")
    @ResponseBody
    public ModelAndView updatePwd(@RequestParam("accountOrName") String accountOrName,
                                  @RequestParam("password") String password,
                                  HttpSession session,
                                  ModelAndView modelAndView){
        if(userService.changePassword(accountOrName, password)!=0){
            User user = userService.getUser(accountOrName);
            session.setAttribute(CURRENT_USER, user);
            modelAndView.addObject(MESSAGE,"修改成功");
            modelAndView.setViewName(URL_CHANGE_PASSWORD);
        }else{
            modelAndView.addObject(MESSAGE,"修改失败");
            modelAndView.setViewName(URL_CHANGE_PASSWORD);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/updateInfo")
    @ResponseBody
    public ModelAndView updateInfo(@RequestParam("account") String account,
                                   @RequestParam("username") String username,
                                   @RequestParam("tel") String tel,
                                   @RequestParam("email") String email,
                                   HttpSession session,
                                   ModelAndView modelAndView){
        User user = new User();
        user.setUsername(username);
        user.setTel(tel);
        user.setEmail(email);
        if(userService.changeUserInfo(account,user)!=0){
            user = userService.getUser(account);
            session.setAttribute(CURRENT_USER, user);
            modelAndView.addObject(MESSAGE,"修改成功");
            modelAndView.setViewName(URL_CHANGE_USER_INFO);
        } else {
            modelAndView.addObject(MESSAGE,"修改失败");
            modelAndView.setViewName(URL_CHANGE_USER_INFO);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/verify")
    @ResponseBody
    public ModelAndView forgetVerify(@RequestParam("account") String account,
                                     @RequestParam("username") String username,
                                     @RequestParam("tel") String tel,
                                     @RequestParam("email") String email,
                                     HttpSession session,
                                     ModelAndView modelAndView){
        User user = userService.getUser(account);
        if(user.getUsername().equals(username) && user.getTel().equals(tel) && user.getEmail().equals(email)){
            session.setAttribute(CURRENT_USER, user);
            modelAndView.addObject(MESSAGE,"验证通过");
            modelAndView.setViewName(URL_RESET_PASSWORD);
        }else {
            modelAndView.addObject(MESSAGE,"验证失败，请重新验证");
            modelAndView.setViewName(URL_FORGET_VERIFY);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/reset")
    @ResponseBody
    public ModelAndView resetPassword(@RequestParam("password") String newpassword,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        User user = (User) session.getAttribute(CURRENT_USER);
        if(userService.changePassword(user.getAccount(), newpassword)!=0){
            user = userService.getUser(user.getAccount());
            session.setAttribute(CURRENT_USER, user);
            modelAndView.addObject(MESSAGE,"重设成功");
            modelAndView.setViewName(URL_SHOP_INDEX_01);
        }else{
            modelAndView.addObject(MESSAGE,"重设失败");
            modelAndView.setViewName(URL_RESET_PASSWORD);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/writeoff")
    @ResponseBody
    public ModelAndView writeOff(@RequestParam("uid") int uid,
                                 HttpSession session,
                                 ModelAndView modelAndView){

        if(userService.delete(uid) != 0 && addressService.deleteAddressByUser(uid)!=0){
            session.removeAttribute(CURRENT_USER);
            modelAndView.setViewName(URL_INDEX);
        }
        return modelAndView;
    }
}
