package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.AdminUser;
import com.scu.fuzhuohang.dao.AdminUserDao;
import com.scu.fuzhuohang.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:04
 * @Version 1.0
 */
@Service
@Transactional
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    AdminUserDao adminUserDao;

    @Override
    public AdminUser getAdminUser(String ausername, String apassword) {
        return adminUserDao.getAdminUser(ausername, apassword);
    }

    @Override
    public List<AdminUser> getAdminUserAll() {
        return adminUserDao.getAdminUserAll();
    }

    @Override
    public int addAdminUser(AdminUser adminUser) {
        return adminUserDao.addAdminUser(adminUser);
    }

    @Override
    public int editAdminUser(int aid, AdminUser adminUser) {
        return adminUserDao.editAdminUser(aid, adminUser);
    }

    @Override
    public int deleteAdminUser(int aid) {
        return adminUserDao.deleteAdminUser(aid);
    }
}
