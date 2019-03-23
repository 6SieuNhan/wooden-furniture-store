/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.OrderDetailDao;
import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailDao orderDetailDao;

    @Transactional
    @Override
    public boolean addOrderDetailList(String orderId, List<Product> items) {
        return orderDetailDao.addOrderDetailList(orderId, items);
    }

    @Transactional
    @Override
    public boolean addOrderDetail(String orderId, Product item) {
        return orderDetailDao.addOrderDetail(orderId, item);
    }

    @Transactional
    @Override
    public List<OrderDetail> getOrderDetailList(String orderId) {
        return orderDetailDao.getOrderDetailList(orderId);
    }

    @Transactional
    @Override
    public OrderDetail getOrderDetail(String orderId, String productId) {
        return orderDetailDao.getOrderDetail(orderId, productId);
    }

}
