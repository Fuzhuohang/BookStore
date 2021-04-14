package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Business;
import com.scu.fuzhuohang.bean.Comment;
import com.scu.fuzhuohang.bean.Product;
import com.scu.fuzhuohang.bean.mergebean.CommentUser;
import com.scu.fuzhuohang.service.BusinessService;
import com.scu.fuzhuohang.service.CommentService;
import com.scu.fuzhuohang.service.ProductService;
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
 * @Date 2021/4/13 10:35
 * @Version 1.0
 */
@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    BusinessService businessService;

    @Autowired
    CommentService commentService;

    @RequestMapping("/jsp/*/getproductinfo")
    @ResponseBody
    public ModelAndView getProductInfo(@RequestParam("pid") int productId,
                                       HttpSession session,
                                       ModelAndView modelAndView){
        Product product = productService.getProductById(productId);
        Business business = businessService.enterProductBusiness(product.getBid());
        List<CommentUser> commentList = commentService.getCommentUser(productId);
        int commentCount = commentService.getCount(productId);
        session.setAttribute("product_info",product);
        session.setAttribute("product_business",business);
        session.setAttribute("product_comment",commentList);
        session.setAttribute("product_commentcount",commentCount);
        modelAndView.addObject("message","跳转成功");
        modelAndView.setViewName("redirect:/jsp/shopping/productInfo.jsp");
        return modelAndView;
    }
}
