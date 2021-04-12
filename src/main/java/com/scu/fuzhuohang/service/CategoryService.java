package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:47
 * @Version 1.0
 */
public interface CategoryService {

    public List<Category> getCategoryFirst();

    public List<CategorySecond> getCategorySecondAll();

    public List<CategorySecond> getCategorySecond(int cateId);

    public int addCategoryFirst(Category category);

    public int addCategorySecond(CategorySecond categorySecond);

    public int editCategoryFirst(int cateId,Category category);

    public int editCategorySecond(int csId,CategorySecond categorySecond);

    public int deleteCategoryFirst(int cateid);

    public int deleteCategorySecond(int csId);

}
