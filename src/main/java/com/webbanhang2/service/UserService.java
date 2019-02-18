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
}
