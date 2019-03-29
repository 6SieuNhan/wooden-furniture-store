/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.User;

/**
 *
 * @author fkien
 */
public interface UserService {
    
    public boolean registerUser(User user);
    
    public User validateUser(User user);
    
    public User getUserByEmail(String email);
    
    public String createRecoveryCode(User user);
    
    public boolean validateRecovery(String userId, String recoveryCode);
    
    public boolean editUser(User user);
    
    public boolean resetPassword(String userId, String password);
}
