package com.scu.fuzhuohang.service.impl;

import com.scu.fuzhuohang.bean.User;
import com.scu.fuzhuohang.dao.UserDao;
import com.scu.fuzhuohang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/6 12:21
 * @Version 1.0
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String accountOrName, String Password) {
        User user =userDao.getUser(accountOrName);
        if(user != null && user.getPassword().equals(Password)){
            return user;
        }else {
            return null;
        }
    }

    @Override
    public User getUser(String accountOrName) {
        return null;
    }

    @Override
    public int register(User user) {
        return 0;
    }

    @Override
    public int changePassword(String accountOrName, String Password) {
        return 0;
    }

    @Override
    public int changeUserInfo(String accountOrName, User user) {
        return 0;
    }

    @Override
    public int logout() {
        return 0;
    }

    @Override
    public int delete() {
        return 0;
    }
}
