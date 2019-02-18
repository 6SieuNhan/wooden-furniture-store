/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.User;
/**
 *
 * @author fkien
 */
public interface UserDao {
  boolean registerUser(User user);
  User validateUser(User user);
}
