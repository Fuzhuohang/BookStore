package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 15:57
 * @Version 1.0
 */
public interface ProductService {

    public List<Product> getProductByName( String productName);

    public Product getProductById( int productId);

    public int addProduct( Product product);

    public int editProduct( int productId,  Product product);

    public int updateNum( int productId,int productNum);

    public int deleteProductByProduct( int productId);

    public int deleteProductByBusiness( int businessId);
}
