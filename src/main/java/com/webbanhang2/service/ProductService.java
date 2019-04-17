/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author fkien
 */
public interface ProductService {
    
    public List<Product> getProductList(Map<String, Object> params, int top, int count);

    public List<Product> getProductListByTop();
    
    public Product getShortenedProduct(String productId);
    
    public Product getProduct(String productId);
    
    public int getProductListPageCount(Map<String, Object> params, int size);
    
    public List<Product> getProductListForAdmin(Map<String, Object> params, int top, int count);

    public void deleteProduct(String productId);

    public boolean saveProduct(Product p);
}
