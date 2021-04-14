package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.AdminUser;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 16:04
 * @Version 1.0
 */
public interface AdminUserService {
    public AdminUser getAdminUser(String ausername,String apassword);

    public List<AdminUser> getAdminUserAll();

    public int addAdminUser(AdminUser adminUser);

    public int editAdminUser(int aid, AdminUser adminUser);

    public int deleteAdminUser(int aid);
}
