/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.CategoryDao;
import com.webbanhang2.model.Category;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryDao categoryDao;
    
    @Override
    public List<Category> getCategoryList(int categoryType) {
        return categoryDao.getCategoryList(categoryType);
    }
    
    @Override
    public List<Category> getCategoryListWithProductCount(int categoryType){
        return categoryDao.getCategoryListWithProductCount(categoryType);
    }
    
    @Override
    public Category getCategoryByName(String categoryName, int categoryType){
        return categoryDao.getCategoryByName(categoryName, categoryType);
    }
    
    @Transactional
    @Override
    public boolean saveCategory(String oldCategory, String newCategory, int categoryType){
        return categoryDao.saveCategory(oldCategory, newCategory, categoryType);
    }
    
    @Transactional
    @Override
    public boolean deleteCategory(String categoryName, int categoryType){
        return categoryDao.deleteCategory(categoryName, categoryType);
    }
}
