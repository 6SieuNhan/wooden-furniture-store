/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.OrderDao;
import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
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
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    
    /*@Autowired
    private EmailService emailService;*/

    @Transactional
    @Override
    public List<Order> getOrderList(int top, int count) {
        return orderDao.getOrderList(top, count);
    }

    @Transactional
    @Override
    public List<Order> getOrderList(String userId, int top, int count) {
        return orderDao.getOrderList(userId, top, count);
    }

    @Transactional
    @Override
    public Order getOrder(String orderId) {
        return orderDao.getOrder(orderId);
    }

    @Transactional
    @Override
    public Order addOrder(List<Product> items, User user, int paymentMethodId) {
        return orderDao.addOrder(items, user, paymentMethodId);
    }

    @Transactional
    @Override
    public boolean validateOrder(String orderId, String validationCode) {
        Order o = getOrder(orderId);
        if(o==null || !o.getValidationCode().equals(validationCode)){
            return false;
        }
        else{
            return orderDao.validateOrder(orderId);
        }
    }
    
    @Override
    public int getOrderListPageCount(int size){
        return orderDao.getOrderListPageCount(size);
    }
    
    @Override
    public int getOrderListPageCount(String userId, int size){
        return orderDao.getOrderListPageCount(userId, size);
    }
}
