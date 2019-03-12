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
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Component
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

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
    public Order addOrder(List<Product> items, User user) {
        return orderDao.addOrder(items, user);
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
}
