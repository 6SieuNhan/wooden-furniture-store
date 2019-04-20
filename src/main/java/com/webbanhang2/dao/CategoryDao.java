/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Category;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface CategoryDao {
    List<Category> getCategoryList(int categoryType);
    
    List<Category> getCategoryListWithProductCount(int categoryType);
    
    Category getCategoryByName(String categoryName, int categoryType);
    
    boolean saveCategory(String oldCategory, String newCategory, int categoryType); 
    
    boolean deleteCategory(String categoryName, int categoryType);
}
