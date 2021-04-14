package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;
import com.scu.fuzhuohang.bean.Product;
import com.scu.fuzhuohang.bean.mergebean.ProductBusiness;
import com.scu.fuzhuohang.service.CategoryService;
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
 * @Date 2021/4/13 10:36
 * @Version 1.0
 */
@Controller
public class IndexController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("getCategory")
    @ResponseBody
    public ModelAndView getIndex(HttpSession session,
                                 ModelAndView modelAndView){
        List<Category> categoryList = categoryService.getCategoryFirst();
        List<ProductBusiness> productList = productService.getProductList();
        session.setAttribute("current_category",categoryList);
        session.setAttribute("current_product",productList);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/shopping/shopindex.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getCategorysecond")
    @ResponseBody
    public ModelAndView getCategory(@RequestParam("cateid") int cateId,
                                    HttpSession session,
                                    ModelAndView modelAndView){
        List<CategorySecond> categorySeconds = categoryService.getCategorySecond(cateId);
        List<ProductBusiness> productList = productService.getProductListByCateId(cateId);
        session.setAttribute("current_category_persent",cateId);
        session.setAttribute("current_category_second",categorySeconds);
        session.setAttribute("current_product_persent",productList);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/shopping/shopcategory.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getCategorysecond2")
    @ResponseBody
    public ModelAndView getCategory2(@RequestParam("csid") int csId,
                                    HttpSession session,
                                    ModelAndView modelAndView){
        List<ProductBusiness> productList = productService.getProductListByCsId(csId);
        session.setAttribute("current_category_second_persent",csId);
        session.setAttribute("current_product_second_persent",productList);
        modelAndView.addObject("message","加载成功");
        modelAndView.setViewName("redirect:/jsp/shopping/shopcatesecond.jsp");
        return modelAndView;
    }
}