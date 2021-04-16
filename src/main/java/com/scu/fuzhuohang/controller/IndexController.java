package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;
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

import static com.scu.fuzhuohang.res.Session.*;
import static com.scu.fuzhuohang.res.Url.*;

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
        List<CategorySecond> categorySecondList = categoryService.getCategorySecondAll();
        List<ProductBusiness> productList = productService.getProductList();
        session.setAttribute(CURRENT_CATEGORY,categoryList);
        session.setAttribute(CURRENT_CATEGORYSECOND,categorySecondList);
        session.setAttribute(CURRENT_PRODUCT,productList);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_SHOP_INDEX);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getCategorysecond")
    @ResponseBody
    public ModelAndView getCategory(@RequestParam("cateid") int cateId,
                                    HttpSession session,
                                    ModelAndView modelAndView){
        List<CategorySecond> categorySeconds = categoryService.getCategorySecond(cateId);
        List<ProductBusiness> productList = productService.getProductListByCateId(cateId);
        session.setAttribute(CURRENT_CATEGORY_CHOSEN,cateId);
        session.setAttribute(CURRENT_CATEGORY_SECOND,categorySeconds);
        session.setAttribute(CURRENT_PRODUCT_CHOSEN,productList);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_SHOP_CATEGORY);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/getCategorysecond2")
    @ResponseBody
    public ModelAndView getCategory2(@RequestParam("csid") int csId,
                                    HttpSession session,
                                    ModelAndView modelAndView){
        List<ProductBusiness> productList = productService.getProductListByCsId(csId);
        session.setAttribute(CURRENT_CATEGORY_SECOND_CHOSEN,csId);
        session.setAttribute(CURRENT_PRODUCT_SECOND_CHOSEN,productList);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_SHOP_CATEGORY_SECOND);
        return modelAndView;
    }

    @RequestMapping("/jsp/*/gotoindex")
    @ResponseBody
    public ModelAndView gotoIndex(HttpSession session,
                                  ModelAndView modelAndView){
        List<Category> categoryList = categoryService.getCategoryFirst();
        List<CategorySecond> categorySecondList = categoryService.getCategorySecondAll();
        List<ProductBusiness> productList = productService.getProductList();
        session.setAttribute(CURRENT_CATEGORY,categoryList);
        session.setAttribute(CURRENT_CATEGORYSECOND,categorySecondList);
        session.setAttribute(CURRENT_PRODUCT,productList);
        modelAndView.addObject(MESSAGE,"加载成功");
        modelAndView.setViewName(URL_SHOP_INDEX_01);
        return modelAndView;
    }
}
