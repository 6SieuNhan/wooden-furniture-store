/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface OrderService {
    
    public List<Order> getOrderList(int top, int count);
    
    public List<Order> getOrderList(String userId, int top, int count);
    
    public Order getOrder(String orderId);
    
    public Order addOrder(List<Product> items, User user);
    
    public boolean validateOrder(String orderId, String validationCode);
    
}
