/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.model;

import java.util.ArrayList;

/**
 *
 * @author fkien
 */
public class Product {

    private String productId, productName, description;

    private int productTypeId, productMaterialId, productOriginId, quantity, price;
    
    private ArrayList<String> imgList;

    public Product() {
    }

    public Product(String productId, String productName, String description, int productTypeId, int productMaterialId, int productOriginId, int quantity, int price, ArrayList<String> imgList) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.productTypeId = productTypeId;
        this.productMaterialId = productMaterialId;
        this.productOriginId = productOriginId;
        this.quantity = quantity;
        this.price = price;
        this.imgList = imgList;
    }

    public ArrayList<String> getImgList() {
        return imgList;
    }

    public void setImgList(ArrayList<String> imgList) {
        this.imgList = imgList;
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

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
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
