/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author fkien
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-mvc-servlet.xml")
@ActiveProfiles("test")
@WebAppConfiguration
public class OrderDetailDaoTest extends TestCase {
    @Autowired
    WebApplicationContext webApplicationContext;
    
    @Autowired
    OrderDetailDao orderDetailDaoMock;
    //tests for method addOrderDetailList(String orderId, List<Product> items)
    List<Product> getListProductOneItem(){
        List<Product> l = new ArrayList<>();
        Product p1 = new Product();
        p1.setProductId("5380cb0f-4034-11e9-91dc-448a5bec6a0c");
        p1.setPrice(500000);
        p1.setQuantity(50);
        l.add(p1);
        return l;
    }
    
    List<Product> getListProductTwoItem(){
        List<Product> l = getListProductOneItem();
        Product p2 = new Product();
        p2.setProductId("5382b3a0-4034-11e9-91dc-448a5bec6a0c");
        p2.setPrice(500000);
        p2.setQuantity(50);
        l.add(p2);
        return l;
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID01(){
        boolean result = orderDetailDaoMock.addOrderDetailList(null, getListProductOneItem());
        assertEquals(result,false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID02(){
        boolean result = orderDetailDaoMock.addOrderDetailList("INCORRECT_ORDER_ID", getListProductOneItem());
        assertEquals(result,false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID03(){
        List<Product> list = getListProductOneItem();
        list.get(0).setProductId(null);
        boolean result = orderDetailDaoMock.addOrderDetailList("c28457a9-60f3-11e9-96b3-9457a5ae8d38",list);
        assertEquals(result,false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID04(){
        List<Product> list = getListProductOneItem();
        list.get(0).setProductId("INCORRECT_PRODUCT_ID");
        boolean result = orderDetailDaoMock.addOrderDetailList("c28457a9-60f3-11e9-96b3-9457a5ae8d38",list);
        assertEquals(result,false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID05(){
        boolean result = orderDetailDaoMock.addOrderDetailList("c28457a9-60f3-11e9-96b3-9457a5ae8d38", getListProductOneItem());
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addOrderDetailList_UTCID06(){
        boolean result = orderDetailDaoMock.addOrderDetailList("c28457a9-60f3-11e9-96b3-9457a5ae8d38", getListProductTwoItem());
        assertEquals(result,true);
    }
    
    //tests for method getOrderDetailList(String orderId)
    @Test
    public void getOrderDetailList_UTCID01(){
        List<OrderDetail> result = orderDetailDaoMock.getOrderDetailList(null);
        assertEquals(result, null);
    }
    
    @Test
    public void getOrderDetailList_UTCID02(){
        List<OrderDetail> result = orderDetailDaoMock.getOrderDetailList("c07793b7-60f3-11e9-96b3-9457a5ae8d38");
        assertEquals(result.size(), 1);
    }
    
    @Test
    public void getOrderDetailList_UTCID03(){
        List<OrderDetail> result = orderDetailDaoMock.getOrderDetailList("2c90a6c6-5096-11e9-90ab-20474704b06e");
        assertEquals(result.size(), 3);
    }
    
    @Test
    public void getOrderDetailList_UTCID04(){
        List<OrderDetail> result = orderDetailDaoMock.getOrderDetailList("INCORRECT_SEARCH_QUERY");
        assertEquals(result, null);
    }
    
    //tests for method deleteOrderDetail(String orderId)
    @Test
    @Transactional
    @Rollback(true)
    public void deleteOrderDetail_UTCID01(){
        boolean result = orderDetailDaoMock.deleteOrderDetail(null);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void deleteOrderDetail_UTCID02(){
        boolean result = orderDetailDaoMock.deleteOrderDetail("c07793b7-60f3-11e9-96b3-9457a5ae8d38");
        assertEquals(result, true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void deleteOrderDetail_UTCID03(){
        boolean result = orderDetailDaoMock.deleteOrderDetail("INCORRECT_ID");
        assertEquals(result, false);
    }
}
