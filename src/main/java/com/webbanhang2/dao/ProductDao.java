/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author fkien
 */
public interface ProductDao {

    Product getProduct(String productId);
    
    Product getShortenedProduct(String productId);
    
    List<Product> getProductList(Map<String, Object> params, int top, int count);
    
    int getProductListPageCount(Map<String, Object> params, int size);
    
    List<Product> getProductListForAdmin(Map<String, Object> params, int top, int count);
    
    public boolean checkProduct(String productId);
    //add, edit, delete product
    public void deleteProduct(String productId);
    
    public void addProduct(Product p);
    
    public void updateProduct(Product p);
}
