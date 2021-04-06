package com.scu.fuzhuohang.dao;

import com.scu.fuzhuohang.bean.User;
import org.apache.ibatis.annotations.Param;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 数据库普通用户操作
 */
public interface UserDao {

    public User getUser(@Param("str") String accountOrName);

    public int addUser(@Param("usr") User user);

    public int updatePassword(@Param("str") String accountOrName, @Param("pwd") String password);

    public int updateUserInfo(@Param("acc") String account, @Param("usr") User usr);

    public int updateLoggingStatus(@Param("str") String accountOrName, @Param("status") int status);

    public int updateIsBusiness(@Param("str") String accountOrName, @Param("isbusiness") int isBusiness);

    public int delUser(@Param("uid") int uid);

}
