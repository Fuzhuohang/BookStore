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

    @RequestMapping("logout")
    @ResponseBody
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

    @RequestMapping("regist")
    @ResponseBody
    public ModelAndView register(@RequestParam("tel") String tel,
                                 @RequestParam("password") String password,
                                 HttpSession session,
                                 ModelAndView modelAndView){
        User user = new User();
        user.setAccount(tel);
        user.setUsername(tel);
        user.setTel(tel);
        user.setPassword(password);
        if(userService.register(user)!=0){
            user = userService.login(user.getAccount(), password);
            session.setAttribute("current_user", user);
            modelAndView.addObject("messge","登录成功");
            modelAndView.setViewName("/mainM");
        }else{
            modelAndView.addObject("message","注册失败");
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }

    @RequestMapping("updatepwd")
    @ResponseBody
    public ModelAndView updatePwd(@RequestParam("accountOrName") String accountOrName,
                                  @RequestParam("password") String password,
                                  HttpSession session,
                                  ModelAndView modelAndView){
        if(userService.changePassword(accountOrName, password)!=0){

        }else{

        }
        return modelAndView;
    }

    @RequestMapping("updateInfo")
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

        } else {

        }
        return modelAndView;
    }
}
