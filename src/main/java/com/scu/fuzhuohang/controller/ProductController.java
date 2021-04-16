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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static com.scu.fuzhuohang.res.Session.*;
import static com.scu.fuzhuohang.res.Url.*;

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
        session.setAttribute(PRODUCT_INFO,product);
        session.setAttribute(PRODUCT_BUSINESS,business);
        session.setAttribute(PRODUCT_COMMENT,commentList);
        session.setAttribute(PRODUCT_COMMENT_COUNT,commentCount);
        modelAndView.addObject(MESSAGE,"跳转成功");
        modelAndView.setViewName(URL_PRODUCT_INFO);
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
            modelAndView.setViewName(URL_BUSINESS_PRODUCTS);
        }else{
            modelAndView.addObject(MESSAGE, "添加失败");
            modelAndView.setViewName(URL_ADD_PRODUCT);
        }
        return modelAndView;
    }

    @RequestMapping("/jsp/*/editproduct01")
    @ResponseBody
    public ModelAndView editProduct01(@RequestParam("pid") int productId,
                                       HttpSession session,
                                       ModelAndView modelAndView){
        Product product = productService.getProductById(productId);
        session.setAttribute(PRODUCT_INFO,product);
        modelAndView.addObject(MESSAGE,"跳转成功");
        modelAndView.setViewName(URL_EDIT_PRODUCT);
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
            modelAndView.setViewName(URL_BUSINESS_PRODUCTS);
        }else{
            modelAndView.addObject(MESSAGE, "修改失败");
            modelAndView.setViewName(URL_EDIT_PRODUCT);
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
            modelAndView.setViewName(URL_BUSINESS_PRODUCTS);
        }
        return modelAndView;
    }

//    @ResponseBody
//    @RequestMapping("upload")
//    public Map upload(MultipartFile file, HttpServletRequest request){
//
//        String prefix="";
//        String dateStr="";
//        //保存上传
//        OutputStream out = null;
//        InputStream fileInput=null;
//        try{
//            if(file!=null){
//                String originalName = file.getOriginalFilename();
//                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
//                Date date = new Date();
//                String uuid = UUID.randomUUID()+"";
//                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//                dateStr = simpleDateFormat.format(date);
//                String filepath = "D:\\mycode\\LayUiTest\\src\\main\\resources\\static\\images\\" + dateStr+"\\"+uuid+"." + prefix;
//
//
//                File files=new File(filepath);
//                //打印查看上传路径
//                System.out.println(filepath);
//                if(!files.getParentFile().exists()){
//                    files.getParentFile().mkdirs();
//                }
//                file.transferTo(files);
//                Map<String,Object> map2=new HashMap<>();
//                Map<String,Object> map=new HashMap<>();
//                map.put("code",0);
//                map.put("msg","");
//                map.put("data",map2);
//                map2.put("src","/images/"+ dateStr+"/"+uuid+"." + prefix);
//                return map;
//            }
//
//        }catch (Exception e){
//        }finally{
//            try {
//                if(out!=null){
//                    out.close();
//                }
//                if(fileInput!=null){
//                    fileInput.close();
//                }
//            } catch (IOException e) {
//            }
//        }
//        Map<String,Object> map=new HashMap<>();
//        map.put("code",1);
//        map.put("msg","");
//        return map;
//
//    }
}
