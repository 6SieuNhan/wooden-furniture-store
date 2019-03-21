/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.UserDao;
import com.webbanhang2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Transactional
    @Override
    public User validateUser(User user) {
        return userDao.getUser(user);
    }

    @Transactional
    @Override
    public boolean registerUser(User user) {
        return userDao.registerUser(user);
    }

    @Transactional
    @Override
    public User getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }
    
    @Transactional
    @Override
    public String createRecoveryCode(User user) {
        return userDao.createRecoveryCode(user);
    }
    
    @Transactional
    @Override
    public boolean validateRecovery(String userId, String recoveryCode){
        return userDao.validateRecovery(userId, recoveryCode);
    }
    
    @Transactional
    @Override
    public boolean resetPassword(String userId, String password){
        return userDao.resetPassword(userId, password);
    }
}
