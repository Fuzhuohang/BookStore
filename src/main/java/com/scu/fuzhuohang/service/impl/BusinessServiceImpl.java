package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.Business;
import com.scu.fuzhuohang.dao.BusinessDao;
import com.scu.fuzhuohang.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 9:53
 * @Version 1.0
 */
@Service
@Transactional
public class BusinessServiceImpl implements BusinessService {

    @Autowired
    BusinessDao businessDao;

    @Override
    public Business enterMyBusiness(int userId) {
        return businessDao.getBusinessByUser(userId);
    }

    @Override
    public Business enterProductBusiness(int businessId) {
        return businessDao.getBusinessByBusiness(businessId);
    }

    @Override
    public int register(Business business) {
        return businessDao.createBusiness(business);
    }

    @Override
    public int changeBusinessInfo(int userId, Business business) {
        return businessDao.editBusiness(userId,business);
    }

    @Override
    public int delete(int businessId) {
        return businessDao.deleteBusiness(businessId);
    }
}
