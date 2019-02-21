/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.model.Product;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface ProductService {
    
    public List<Product> getProductList(int top, int count);

    public Product getProduct(String productId);
}
