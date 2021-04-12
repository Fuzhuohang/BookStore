package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.AdminUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/12 9:42
 * @Version 1.0
 */
public interface AdminUserDao {
    public AdminUser getAdminUser(@Param("username") String ausername);

    public List<AdminUser> getAdminUserAll();

    public int addAdminUser(@Param("adminuser") AdminUser adminUser);

    public int editAdminUser(@Param("aid") int aid, @Param("adminuser") AdminUser adminUser);

    public int deleteAdminUser(@Param("aid") int aid);
}
