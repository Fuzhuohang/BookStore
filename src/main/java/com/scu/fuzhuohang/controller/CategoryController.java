package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;
import com.scu.fuzhuohang.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:15
 * @Version 1.0
 */
@Controller()
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("getCategory")
    @ResponseBody
    public ModelAndView getCategory(HttpSession session,
                                    ModelAndView modelAndView){
        List<Category> categoryList = categoryService.getCategoryFirst();
        session.setAttribute("current_category",categoryList);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/shopping/shopindex.jsp");
        return modelAndView;
    }
}
