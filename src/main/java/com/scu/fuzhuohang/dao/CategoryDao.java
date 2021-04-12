package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 9:05
 * @Version 1.0
 */
public interface CategoryDao {
    public List<Category> getCategoryFirst();

    public List<CategorySecond> getCategorySecondAll();

    public List<CategorySecond> getCategorySecond(@Param("cateid") int cateid);

    public int addCategoryFirst(@Param("categroy") Category category);

    public int addCategorySecond(@Param("categorysecond") CategorySecond categorySecond);

    public int editCategoryFirst(@Param("cateid") int cateid,@Param("category") Category category);

    public int editCategorySecond(@Param("csid") int csid,@Param("categorysecond") CategorySecond categorySecond);

    public int deleteCategoryFirst(@Param("cateid") int cateid);

    public int deleteCategorySecond(@Param("csid") int csid);
}
