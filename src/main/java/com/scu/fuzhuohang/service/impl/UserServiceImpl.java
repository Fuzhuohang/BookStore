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
            return user;
        }else {
            return null;
        }
    }

    @Override
    public User getUser(String accountOrName) {
        User user = userDao.getUser(accountOrName);
        if(user != null){
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
    public int changeUserInfo(String account, User user) {
        return userDao.updateUserInfo(account, user);
    }

    @Override
    public int updateIsBusiness(int uid, int isBusiness) {
        return userDao.updateIsBusiness(uid,isBusiness);
    }

    @Override
    public int delete(int userId) {
        return userDao.delUser(userId);
    }
}
