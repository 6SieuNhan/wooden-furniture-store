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
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryDao categoryDao;
    
    @Transactional
    @Override
    public List<Category> getCategoryList(int categoryType) {
        return categoryDao.getCategoryList(categoryType);
    }
    
}
