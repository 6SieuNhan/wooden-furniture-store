/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.User;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface UserService {

    public boolean registerUser(User user);

    List<User> getUserList(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int top, int count);

    int getUserListPageCount(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int size);

    public User getUser(User user);
    
    public User getUserById(String userId);

    public User getUserByName(String username);

    public User getUserByEmail(String email);

    public String createRecoveryCode(User user);

    public boolean validateRecovery(String userId, String recoveryCode);

    public boolean editUser(User user);

    public boolean changePassword(String userId, String password);
}
