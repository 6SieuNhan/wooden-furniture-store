/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Product;
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
public class ProductDaoTest extends TestCase {

    @Autowired
    private ProductDao productDaoMock;

    @Autowired
    WebApplicationContext webApplicationContext;

    Product getMockProductAdd() {
        Product p = new Product();
        p.setProductCode("ASDF-1234");
        p.setProductName("Bàn siêu nhỏ");
        p.setProductCategoryId(1);
        p.setProductMaterialId(1);
        p.setProductRoomId(1);
        p.setThumbnail("2019-03-16_19-41-32.png");
        p.setDescription("Sed volutpat lacus orci, at sollicitudin ipsum sollicitudin non.\n"
                + "Quisque ut risus id diam hendrerit facilisis. Integer ac venenatis purus, in lobortis nunc.");
        p.setPrice(9999);
        p.setQuantity(9999);
        return p;
    }
    
    Product getMockProductUpdate(){
        Product p = getMockProductAdd();
        p.setProductId("1457473f-4036-11e9-91dc-448a5bec6a0c");
        return p;
    }

    //tests for method getProduct(String productId)
    @Test
    public void getProductNullId() {
        Product result = productDaoMock.getProduct(null);
        assertEquals(result, null);
    }

    @Test
    public void getProductIncorrectId() {
        Product result = productDaoMock.getProduct("INCORRECT_PRODUCT_ID");
        assertEquals(result, null);
    }

    @Test
    public void getProductCorrect() {
        Product result = productDaoMock.getProduct("1457473f-4036-11e9-91dc-448a5bec6a0c");
        assertEquals(result.getProductName(), "Thang Bộ 1");
    }

    //tests for method getShortenedProduct(String productId)
    @Test
    public void getShortenedProductNullId() {
        Product result = productDaoMock.getShortenedProduct(null);
        assertEquals(result, null);
    }

    @Test
    public void getShortenedProductIncorrectId() {
        Product result = productDaoMock.getShortenedProduct("INCORRECT_PRODUCT_ID");
        assertEquals(result, null);
    }

    @Test
    public void getShortenedProductCorrect() {
        Product result = productDaoMock.getShortenedProduct("1457473f-4036-11e9-91dc-448a5bec6a0c");
        assertEquals(result.getProductName(), "Thang Bộ 1");
    }

    //tests for method checkProduct(String productId)
    @Test
    public void checkProductNullId() {
        boolean result = productDaoMock.checkProduct(null);
        assertEquals(result, false);
    }

    @Test
    public void checkProductIncorrectId() {
        boolean result = productDaoMock.checkProduct("INCORRECT_PRODUCT_ID");
        assertEquals(result, false);
    }

    @Test
    public void checkProductCorrect() {
        boolean result = productDaoMock.checkProduct("1457473f-4036-11e9-91dc-448a5bec6a0c");
        assertEquals(result, true);
    }
/*
    //tests for method deleteProduct(String productId)
    @Test
    @Transactional
    @Rollback(true)
    public void deleteProductNullId() {
        boolean result = productDaoMock.checkProduct(null);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteProductIncorrectId() {
        boolean result = productDaoMock.deleteProduct("INCORRECT_PRODUCT_ID");
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteProductCorrect() {
        boolean result = productDaoMock.deleteProduct("1457473f-4036-11e9-91dc-448a5bec6a0c");
        assertEquals(result, true);
    }

    //tests for method addProduct(Product p)
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullAll(){
        boolean result = productDaoMock.addProduct(new Product());
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullProductCode(){
        Product p = getMockProductAdd();
        p.setProductCode(null);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullProductName(){
        Product p = getMockProductAdd();
        p.setProductName(null);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullProductCategory(){
        Product p = getMockProductAdd();
        p.setProductCategoryId(0);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullProductMaterial(){
        Product p = getMockProductAdd();
        p.setProductMaterialId(0);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullProductRoom(){
        Product p = getMockProductAdd();
        p.setProductRoomId(0);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullThumbnail(){
        Product p = getMockProductAdd();
        p.setThumbnail(null);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullDescription(){
        Product p = getMockProductAdd();
        p.setDescription(null);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullPrice(){
        Product p = getMockProductAdd();
        p.setPrice(0);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductNullQuantity(){
        Product p = getMockProductAdd();
        p.setQuantity(0);
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addProductCorrect(){
        Product p = getMockProductAdd();
        boolean result = productDaoMock.addProduct(p);
        assertEquals(result,true);
    }
    
    //tests for method updateProduct(Product p)
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullAll(){
        boolean result = productDaoMock.updateProduct(new Product());
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductId(){
        Product p = getMockProductUpdate();
        p.setProductId(null);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductIncorrectProductId(){
        Product p = getMockProductUpdate();
        p.setProductId("INCORRECT_PRODUCT_ID");
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductCode(){
        Product p = getMockProductUpdate();
        p.setProductCode(null);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductName(){
        Product p = getMockProductUpdate();
        p.setProductName(null);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductCategory(){
        Product p = getMockProductUpdate();
        p.setProductCategoryId(0);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductMaterial(){
        Product p = getMockProductUpdate();
        p.setProductMaterialId(0);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullProductRoom(){
        Product p = getMockProductUpdate();
        p.setProductRoomId(0);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullThumbnail(){
        Product p = getMockProductUpdate();
        p.setThumbnail(null);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullDescription(){
        Product p = getMockProductUpdate();
        p.setDescription(null);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullPrice(){
        Product p = getMockProductUpdate();
        p.setPrice(0);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductNullQuantity(){
        Product p = getMockProductUpdate();
        p.setQuantity(0);
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result,true);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void updateProductCorrect(){
        Product p = getMockProductUpdate();
        boolean result = productDaoMock.updateProduct(p);
        assertEquals(result,true);
    }*/
}
