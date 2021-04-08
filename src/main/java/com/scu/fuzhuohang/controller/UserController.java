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
            modelAndView.setViewName("login");
        } else {
            session.setAttribute("current_user", user);
            modelAndView.addObject("messge","登录成功");
            modelAndView.setViewName("/shopindex1");
        }
        return modelAndView;
    }

    @RequestMapping("logout")
    @ResponseBody
    public ModelAndView logout(HttpSession session,
                               ModelAndView modelAndView){
        session.removeAttribute("current_user");
        modelAndView.setViewName("/shopindex");
        System.out.println("成功退出登录");
        return modelAndView;
    }

    @RequestMapping("register")
    @ResponseBody
    public ModelAndView register(@RequestParam("tel") String tel,
                                 @RequestParam("password") String password,
                                 @RequestParam("password1") String password1,
                                 HttpSession session,
                                 ModelAndView modelAndView){
        System.out.println("continue: "+tel+"::"+password+"::"+password1);
        User exist = userService.getUser(tel);
        System.out.println("continue: "+exist);
        if(exist == null && password.equals(password1)){
            User user = new User();
            user.setAccount(tel);
            user.setUsername(tel);
            user.setTel(tel);
            user.setPassword(password);
            System.out.println("continue: "+user);
            if(userService.register(user)!=0){
                user = userService.login(user.getAccount(), password);
                System.out.println("success: "+user);
                session.setAttribute("current_user", user);
                modelAndView.addObject("messge","登录成功");
                modelAndView.setViewName("/shopindex1");
            }
        } else{
            modelAndView.addObject("message","注册失败");
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }

    @RequestMapping("updatepwd")
    @ResponseBody
    public ModelAndView updatePwd(@RequestParam("oldpassword") String oldpassword,
                                  @RequestParam("newpassword") String newpassword,
                                  @RequestParam("newpassword1") String newpassword1,
                                  HttpSession session,
                                  ModelAndView modelAndView){
        System.out.println(oldpassword+"::"+newpassword+"::"+newpassword1);
        User user = (User) session.getAttribute("current_user");
        System.out.println(user.toString());
        if(!oldpassword.equals(newpassword) && oldpassword.equals(user.getPassword()) && newpassword.equals(newpassword1)){
            if(userService.changePassword(user.getAccount(), newpassword)!=0){
                user = userService.getUser(user.getAccount());
                session.setAttribute("current_user", user);
                modelAndView.addObject("messge","修改成功");
                modelAndView.setViewName("/changePassword");
            }else{
                modelAndView.addObject("message","修改失败");
                modelAndView.setViewName("changePassword");
            }
        }else{
            modelAndView.addObject("message","修改失败");
            modelAndView.setViewName("changePassword");
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
        System.out.println(account+"::"+username+"::"+tel+"::"+email);
        User user = new User();
        user.setUsername(username);
        user.setTel(tel);
        user.setEmail(email);
        System.out.println(user);
        if(userService.changeUserInfo(account,user)!=0){
            user = userService.getUser(account);
            session.setAttribute("current_user", user);
            modelAndView.addObject("messge","修改成功");
            modelAndView.setViewName("/changeUserInfo");
        } else {
            modelAndView.addObject("message","修改失败");
            modelAndView.setViewName("changeUserInfo");
        }
        return modelAndView;
    }

    @RequestMapping("verify")
    @ResponseBody
    public ModelAndView forgetVerify(@RequestParam("account") String account,
                                   @RequestParam("username") String username,
                                   @RequestParam("tel") String tel,
                                   @RequestParam("email") String email,
                                   HttpSession session,
                                   ModelAndView modelAndView){
        User user = userService.getUser(account);
        if(user.getUsername().equals(username) && user.getTel().equals(tel) && user.getEmail().equals(email)){
            session.setAttribute("current_user", user);
            modelAndView.addObject("messge","验证通过");
            modelAndView.setViewName("/resetPassword");
        }else {
            modelAndView.addObject("message","验证失败，请重新验证");
            modelAndView.setViewName("forgetVerify");
        }
        return modelAndView;
    }

    @RequestMapping("reset")
    @ResponseBody
    public ModelAndView resetPassword(@RequestParam("newpassword") String newpassword,
                                      @RequestParam("newpassword1") String newpassword1,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        User user = (User) session.getAttribute("current_user");
        System.out.println(user.toString());
        if(newpassword.equals(newpassword1)){
            if(userService.changePassword(user.getAccount(), newpassword)!=0){
                user = userService.getUser(user.getAccount());
                session.setAttribute("current_user", user);
                modelAndView.addObject("messge","重设成功");
                modelAndView.setViewName("/shopindex1");
            }else{
                modelAndView.addObject("message","重设失败");
                modelAndView.setViewName("resetPassword");
            }
        }else{
            modelAndView.addObject("message","重设失败");
            modelAndView.setViewName("resetPassword");
        }
        return modelAndView;
    }

    @RequestMapping("writeoff")
    @ResponseBody
    public ModelAndView writeOff(HttpSession session,
                                 ModelAndView modelAndView){
        User user = (User) session.getAttribute("current_user");
        if(userService.delete(user.getUid()) != 0){
            session.removeAttribute("current_user");
            modelAndView.setViewName("/shopindex");
            System.out.println("成功注销账号");
        }
        return modelAndView;
    }
}
