/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Order;
import java.util.List;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
public class OrderDaoTest extends TestCase {
    @Autowired
    WebApplicationContext webApplicationContext;
    
    @Autowired
    OrderDao orderDaoMock;
    
    //test for method public List<Order> getOrderListSearch(String query, int top, int count)
    @Test
    public void getOrderListSearchWithQuery(){
        List<Order> result = orderDaoMock.getOrderListSearch("%user1%", 0, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
        assertEquals(result.get(0).getOrderId(),"c28457a9-60f3-11e9-96b3-9457a5ae8d38");
        assertEquals(result.get(0).getUsername(),"user1");
    }
}
