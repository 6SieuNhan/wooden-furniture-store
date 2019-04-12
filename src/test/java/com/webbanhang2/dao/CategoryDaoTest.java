/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Category;
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
public class CategoryDaoTest extends TestCase {

    @Autowired
    WebApplicationContext webApplicationContext;

    @Autowired
    CategoryDao categoryDaoMock;

    //tests for method getCategoryList(int categoryType)
    @Test
    public void getCategoryListNull() {
        List<Category> result = categoryDaoMock.getCategoryList(-1);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryListProductCategory() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_CATEGORY);
        assertEquals(result.get(0).getCategoryName(), "Bàn");
    }

    @Test
    public void getCategoryListProductMaterial() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_MATERIAL
        );
        assertEquals(result.get(0).getCategoryName(), "Gỗ Cẩm lai");
    }

    @Test
    public void getCategoryListProductOrigin() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_ORIGIN
        );
        assertEquals(result.get(0).getCategoryName(), "Thủy Hằng");
    }

    @Test
    public void getCategoryListProductRoom() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_ROOM
        );
        assertEquals(result.get(0).getCategoryName(), "Phòng ăn");
    }

    @Test
    public void getCategoryListOrderStatus() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.ORDER_STATUS
        );
        assertEquals(result.get(0).getCategoryName(), "Unverified");
    }

    @Test
    public void getCategoryListPaymentMethod() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PAYMENT_METHOD
        );
        assertEquals(result.get(0).getCategoryName(), "cod");
    }

    @Test
    public void getCategoryListUserRole() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.USER_ROLE
        );
        assertEquals(result.get(0).getCategoryName(), "admin");
    }

}
