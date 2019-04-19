/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.ProductDao;
import com.webbanhang2.model.Product;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDao;
    
    @Transactional
    @Override
    public List<Product> getProductList(Map<String, Object> params, int top, int count) {
        return productDao.getProductList(params, top, count);
    }
    
    @Transactional
    @Override
    public List<Product> getProductListByTop(){
        return productDao.getProductListByTop();
    }

    @Transactional
    @Override
    public Product getProduct(String productId) {
        return productDao.getProduct(productId);
    }

    @Transactional
    @Override
    public int getProductListPageCount(Map<String, Object> params, int size) {
        return productDao.getProductListPageCount(params, size);
    }

    @Transactional
    @Override
    public Product getShortenedProduct(String productId) {
        return productDao.getShortenedProduct(productId);
    }
    
    @Transactional
    @Override
    public boolean deleteProduct(String productId) {
        return productDao.deleteProduct(productId);
    }

    @Transactional
    @Override
    public boolean saveProduct(Product p) {
        boolean hasProduct = productDao.checkProduct(p.getProductId());
        if(!hasProduct){
            return productDao.addProduct(p);
        }
        else{
            return productDao.updateProduct(p);
        }
    }
    
    @Override
    public List<Product> getProductListForAdmin(Map<String, Object> params, int top, int count) {
        return productDao.getProductListForAdmin(params, top, count);
    }
    
    @Override
    public boolean checkStock(List<Product> productList){
        return productDao.checkStock(productList);
    }
    
    @Transactional
    @Override
    public boolean updateStock(List<Product> productList, boolean addMode){
        return productDao.updateStock(productList, addMode);
    }
}
