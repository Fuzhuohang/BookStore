package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Product;
import com.scu.fuzhuohang.bean.mergebean.ProductBusiness;
import com.scu.fuzhuohang.dao.ProductDao;
import com.scu.fuzhuohang.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:57
 * @Version 1.0
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public List<Product> getProductAll(){
        return productDao.getProductAll();
    }

    @Override
    public List<ProductBusiness> getProductList(){
        return productDao.getProductList();
    }

    @Override
    public List<ProductBusiness> getProductListByCateId(int cateId){
        return productDao.getProductListByCateId(cateId);
    }

    @Override
    public List<ProductBusiness> getProductListByCsId(int csId){
        return productDao.getProductListByCsId(csId);
    }

    @Override
    public List<Product> getProductListByBusiness(int bid){
        return productDao.getProductListByBusiness(bid);
    }

    @Override
    public List<Product> getProductByName(String productName) {
        return productDao.getProductByName(productName);
    }

    @Override
    public Product getProductById(int productId) {
        return productDao.getProductById(productId);
    }

    @Override
    public int addProduct(Product product) {
        return productDao.addProduct(product);
    }

    @Override
    public int editProduct(int productId, Product product) {
        return productDao.editProduct(productId, product);
    }

    @Override
    public int updateNum(int productId, int productNum) {
        return productDao.updateNum(productId, productNum);
    }

    @Override
    public int deleteProductByProduct(int productId) {
        return productDao.deleteProductByProduct(productId);
    }

    @Override
    public int deleteProductByBusiness(int businessId) {
        return productDao.deleteProductByBusiness(businessId);
    }
}
