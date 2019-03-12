/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface OrderDetailService {
    boolean addOrderDetailList(String orderId, List<Product> items);
    
    boolean addOrderDetail(String orderId, Product item);
    
    List<OrderDetail> getOrderDetailList(String orderId);
    
    OrderDetail getOrderDetail(String orderId, String productId);
}
