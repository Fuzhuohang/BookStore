package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.bean.Business;
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

    private static final String URL_1 = "redirect:/jsp/business/businessProducts.jsp";
    private static final String BUSINESS_PRODUCTS = "business_products";
    private static final String MESSAGE = "message";

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
        modelAndView.addObject(MESSAGE,"跳转成功");
        modelAndView.setViewName("redirect:/jsp/shopping/productInfo.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/addproduct")
    @ResponseBody
    public ModelAndView addProduct(@RequestParam("bid") int bid,
                                   @RequestParam("pname") String pname,
                                   @RequestParam("price") double price,
                                   @RequestParam("pnum") int pnum,
                                   @RequestParam("pdesc") String pdesc,
                                   @RequestParam("csid") int csid,
                                   HttpSession session,
                                   ModelAndView modelAndView){
        Product product = new Product();
        product.setBid(bid);
        product.setPname(pname);
        product.setPrice(price);
        product.setPnum(pnum);
        product.setPdesc(pdesc);
        product.setCsid(csid);
        if(productService.addProduct(product)!=0){
            List<Product> productList = productService.getProductListByBusiness(bid);
            session.setAttribute(BUSINESS_PRODUCTS,productList);
            modelAndView.addObject(MESSAGE, "添加成功");
            modelAndView.setViewName(URL_1);
        }else{
            modelAndView.addObject(MESSAGE, "添加失败");
            modelAndView.setViewName("addProduct");
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/editproduct01")
    @ResponseBody
    public ModelAndView editProduct01(@RequestParam("pid") int productId,
                                       HttpSession session,
                                       ModelAndView modelAndView){
        Product product = productService.getProductById(productId);
        session.setAttribute("product_info",product);
        modelAndView.addObject(MESSAGE,"跳转成功");
        modelAndView.setViewName("redirect:/jsp/business/editProduct.jsp");
        return modelAndView;
    }

    @RequestMapping("/jsp/*/editproduct02")
    @ResponseBody
    public ModelAndView editProduct02(@RequestParam("bid") int bid,
                                    @RequestParam("pid") int pid,
                                    @RequestParam("pname") String pname,
                                    @RequestParam("price") double price,
                                    @RequestParam("pnum") int pnum,
                                    @RequestParam("pdesc") String pdesc,
                                    @RequestParam("csid") int csid,
                                    HttpSession session,
                                    ModelAndView modelAndView){
        Product product = new Product();
        product.setPname(pname);
        product.setPrice(price);
        product.setPnum(pnum);
        product.setPdesc(pdesc);
        product.setCsid(csid);
        if(productService.editProduct(pid,product)!=0){
            List<Product> productList = productService.getProductListByBusiness(bid);
            session.setAttribute(BUSINESS_PRODUCTS,productList);
            modelAndView.addObject(MESSAGE, "修改成功");
            modelAndView.setViewName(URL_1);
        }else{
            modelAndView.addObject(MESSAGE, "修改失败");
            modelAndView.setViewName("editProduct");
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/deleteproduct")
    @ResponseBody
    public ModelAndView deleteProduct(@RequestParam("pid") int pid,
                                      HttpSession session,
                                      ModelAndView modelAndView){
        if(productService.deleteProductByProduct(pid)!=0){
            List<Product> productList = productService.getProductListByBusiness(((Business) session.getAttribute("current_business")).getBid());
            session.setAttribute(BUSINESS_PRODUCTS,productList);
            modelAndView.addObject(MESSAGE, "删除成功");
            modelAndView.setViewName(URL_1);
        }
        return modelAndView;
    }
}
