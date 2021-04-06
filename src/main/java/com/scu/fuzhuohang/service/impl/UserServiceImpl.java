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
    public User login(String accountOrName, String password) {
        User user = userDao.getUser(accountOrName);
        if(user != null && user.getPassword().equals(password)){
            userDao.updateLoggingStatus(user.getAccount(),1);
            return user;
        }else {
            return null;
        }
    }

    @Override
    public User getUser(String accountOrName) {
        User user = userDao.getUser(accountOrName);
        if(user != null){
            userDao.updateLoggingStatus(user.getAccount(),1);
            return user;
        }else {
            return null;
        }
    }

    @Override
    public int register(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int changePassword(String accountOrName, String password) {
        return userDao.updatePassword(accountOrName, password);
    }

    @Override
    public int changeUserInfo(String accountOrName, User user) {
        return userDao.updateUserInfo(accountOrName, user);
    }

    @Override
    public int logout(String account) {
        return userDao.updateLoggingStatus(account,0);
    }

    @Override
    public int delete(int userId) {
        return userDao.delUser(userId);
    }
}
