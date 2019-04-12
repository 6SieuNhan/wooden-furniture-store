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
    
    
    public List<Order> getOrderList(String userId, int top, int count);
    
    public List<Order> getOrderListSearch(String query, int top, int count);
    
    public int getOrderListPageCount(int size);
    
    public int getOrderListPageCount(String userId, int size);
    
    public int getOrderListSearchPageCount(String username, int size);
    
    public Order getOrder(String orderId);
    
    public Order addOrder(List<Product> items, User user, int paymentMethodId);
    
    public boolean changeOrderStatus(String orderId, int orderStatusId);
    
    public boolean validateOrder(String orderId, String validationCode);
    
    public boolean deleteOrder(String orderId);
    
}
