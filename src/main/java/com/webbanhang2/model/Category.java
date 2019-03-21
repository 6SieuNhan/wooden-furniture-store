/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.model;

/**
 *
 * @author fkien
 */
public class Category {
    //for the 4 category types
    public static final int PRODUCT_CATEGORY = 0;
    public static final int PRODUCT_MATERIAL = 1;
    public static final int PRODUCT_ORIGIN = 2;
    public static final int PRODUCT_ROOM = 3;
    
    //for order status
    public static final int ORDER_STATUS = 5;
    
    //for payment method
    public static final int PAYMENT_METHOD = 6;
    
    //for user role
    public static final int USER_ROLE = 7;
    
    private String categoryId, categoryName;
    private int categoryType;

    public Category() {
    }

    public Category(String categoryId, String categoryName, int categoryType) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryType = categoryType;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(int categoryType) {
        this.categoryType = categoryType;
    }
    
    
}
