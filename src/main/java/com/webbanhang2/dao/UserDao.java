/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.User;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface UserDao {

    boolean registerUser(User user);

    List<User> getUserList(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int top, int count);
    
    int getUserListPageCount(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int size);
    
    User getUser(User user);
    
    User getUserById(String userId);
    
    User getUserByName(String username);
    
    User getUserByEmail(String email);
    
    String createRecoveryCode(User user);
    
    boolean editUser(User user);
    
    boolean validateRecovery(String userId, String recoveryCode);
    
    boolean changePassword(String userId, String password);
}
