package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.Business;
import org.apache.ibatis.annotations.Param;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/9 17:31
 * @Version 1.0
 */
public interface BusinessDao {

    public Business getBusinessByUser(@Param("uid") int userId);

    public Business getBusinessByBusiness(@Param("bid") int businessId);

    public int createBusiness(@Param("business") Business business);

    public int editBusiness(@Param("uid") int userId, @Param("business") Business business);

    public int deleteBusiness(@Param("bid") int businessId);
}
