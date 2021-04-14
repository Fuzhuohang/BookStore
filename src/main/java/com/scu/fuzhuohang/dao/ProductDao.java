package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Product;
import com.scu.fuzhuohang.bean.mergebean.ProductBusiness;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/9 18:38
 * @Version 1.0
 */
public interface ProductDao {

    public List<Product> getProductAll();

    public List<ProductBusiness> getProductList();

    public List<ProductBusiness> getProductListByCateId(@Param("cateid") int cateId);

    public List<ProductBusiness> getProductListByCsId(@Param("csid") int csId);

    public List<Product> getProductByName(@Param("pname") String productName);

    public Product getProductById(@Param("pid") int productId);

    public int addProduct(@Param("product") Product product);

    public int editProduct(@Param("pid") int productId, @Param("product") Product product);

    public int updateNum(@Param("pid") int productId,@Param("pnum") int productNum);

    public int deleteProductByProduct(@Param("pid") int productId);

    public int deleteProductByBusiness(@Param("bid") int businessId);
}
