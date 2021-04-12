package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Category;
import com.scu.fuzhuohang.bean.CategorySecond;
import com.scu.fuzhuohang.dao.CategoryDao;
import com.scu.fuzhuohang.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:47
 * @Version 1.0
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categoryDao;

    @Override
    public List<Category> getCategoryFirst() {
        return categoryDao.getCategoryFirst();
    }

    @Override
    public List<CategorySecond> getCategorySecondAll() {
        return categoryDao.getCategorySecondAll();
    }

    @Override
    public List<CategorySecond> getCategorySecond(int cateId) {
        return categoryDao.getCategorySecond(cateId);
    }

    @Override
    public int addCategoryFirst(Category category) {
        return categoryDao.addCategoryFirst(category);
    }

    @Override
    public int addCategorySecond(CategorySecond categorySecond) {
        return categoryDao.addCategorySecond(categorySecond);
    }

    @Override
    public int editCategoryFirst(int cateId, Category category) {
        return categoryDao.editCategoryFirst(cateId, category);
    }

    @Override
    public int editCategorySecond(int csId, CategorySecond categorySecond) {
        return categoryDao.editCategorySecond(csId, categorySecond);
    }

    @Override
    public int deleteCategoryFirst(int cateid) {
        if(categoryDao.deleteCategoryFirst(cateid)!=0 && categoryDao.deleteCategorySecondByFirst(cateid)!=0){
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int deleteCategorySecond(int csId) {
        return categoryDao.deleteCategorySecond(csId);
    }
}
