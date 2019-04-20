/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.UserDao;
import com.webbanhang2.model.User;
import java.util.List;
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
    public User getUser(User user) {
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
    public boolean validateRecovery(String userId, String recoveryCode) {
        return userDao.validateRecovery(userId, recoveryCode);
    }

    @Transactional
    @Override
    public boolean changePassword(String userId, String password) {
        return userDao.changePassword(userId, password);
    }

    @Override
    public boolean editUser(User user) {
        return userDao.editUser(user);
    }

    @Override
    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }

    @Override
    public List<User> getUserList(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int top, int count) {
        return userDao.getUserList(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, top, count);
    }

    @Override
    public int getUserListPageCount(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int size) {
        return userDao.getUserListPageCount(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, size);
    }
    
    @Override
    public User getUserById(String userId){
        return userDao.getUserById(userId);
    }
}
