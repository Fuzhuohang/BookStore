package com.scu.fuzhuohang.controller;

import com.scu.fuzhuohang.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:15
 * @Version 1.0
 */
@Controller()
public class CategoryController {
    @Autowired
    CategoryService categoryService;


}
