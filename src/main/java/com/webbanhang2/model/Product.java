/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.model;

import java.util.List;

/**
 *
 * @author fkien
 */
public class Product {

    private String productId, productName, description, thumbnail, shortName, productCode;

    private int productCategoryId, productMaterialId, productOriginId, productRoomId, quantity;

    private int price;
    
    private boolean product_top;

    public boolean isProduct_top() {
        return product_top;
    }

    public void setProduct_top(boolean product_top) {
        this.product_top = product_top;
    }

    public Product() {
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(int productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public int getProductRoomId() {
        return productRoomId;
    }

    public void setProductRoomId(int productRoomId) {
        this.productRoomId = productRoomId;
    }

    public int getProductMaterialId() {
        return productMaterialId;
    }

    public void setProductMaterialId(int productMaterialId) {
        this.productMaterialId = productMaterialId;
    }

    public int getProductOriginId() {
        return productOriginId;
    }

    public void setProductOriginId(int productOriginId) {
        this.productOriginId = productOriginId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
