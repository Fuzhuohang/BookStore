package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.User;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 */
public interface UserService {

    public User login(String accountOrName, String Password);

    public User getUser(String accountOrName);

    public int register(User user);

    public int changePassword(String accountOrName, String Password);

    public int changeUserInfo(String accountOrName, User user);

    public int logout();

    public int delete();
}
