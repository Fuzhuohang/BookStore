package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Comment;
import com.scu.fuzhuohang.bean.mergebean.CommentUser;
import com.scu.fuzhuohang.bean.mergebean.UserOrders;
import com.scu.fuzhuohang.service.CommentService;
import com.scu.fuzhuohang.service.OrdersService;
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
 * @Date 2021/4/16 9:21
 * @Version 1.0
 */
@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @RequestMapping("/jsp/*/addcomment")
    @ResponseBody
    public ModelAndView addComment(@RequestParam("uid") int uid,
                                   @RequestParam("pid") int pid,
                                   @RequestParam("score") double score,
                                   @RequestParam("comm") String comm,
                                   HttpSession session,
                                   ModelAndView modelAndView){
        Comment comment = new Comment();
        comment.setUid(uid);
        comment.setPid(pid);
        comment.setScore(score);
        comment.setComm(comm);
        if(commentService.addComment(comment)!=0){
            modelAndView.addObject(MESSAGE,"新增评论成功");
            modelAndView.setViewName(URL_ORDERS);
        }else{
            modelAndView.addObject(MESSAGE,"新增评论失败");
            modelAndView.setViewName(URL_COMMENTS);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getcommentproduct")
    @ResponseBody
    public ModelAndView getCommentProduct(@RequestParam("uid") int uid,
                                          HttpSession session,
                                          ModelAndView modelAndView){
        List<CommentUser> commentUsers = commentService.getCommentProduct(uid);
        session.setAttribute(USER_COMMENTS,commentUsers);
        modelAndView.addObject(MESSAGE,"获取成功");
        modelAndView.setViewName(URL_MY_COMMENTS);
        return modelAndView;
    }
}
