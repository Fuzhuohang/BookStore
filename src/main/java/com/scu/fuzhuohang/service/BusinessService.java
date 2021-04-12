package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.Business;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 9:53
 * @Version 1.0
 */
public interface BusinessService {

    public Business enterMyBusiness(int userId);

    public Business enterProductBusiness(int businessId);

    public int register(Business business);

    public int changeBusinessInfo(int userId,Business business);

    public int delete(int userId);
}
