package com.scu.fuzhuohang.service;

import com.scu.fuzhuohang.bean.User;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 */
public interface UserService {

    public User login(String accountOrName, String password);

    public User getUser(String accountOrName);

    public int register(User user);

    public int changePassword(String accountOrName, String password);

    public int changeUserInfo(String account, User user);

    public int delete(int userId);
}
