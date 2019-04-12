/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface OrderDao {
    
    List<Order> getOrderList(String userId, int top, int count);
    
    List<Order> getOrderListSearch(String query, int top, int count);
    
    int getOrderListPageCount(int size);
    
    int getOrderListPageCount(String userId, int size);
    
    int getOrderListSearchPageCount(String username, int size);
    
    Order getOrder(String orderId);
    
    boolean validateOrder(String orderId);
    
    boolean changeOrderStatus(String orderId, int orderStatusId);
    
    Order addOrder(List<Product> items, User user, int paymentMethodId);
    
    boolean deleteOrder(String orderId);
    
}
