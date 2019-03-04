/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Category;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author fkien
 */
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * Gets a Category List of the desired category type. 3 types are available
     * at the current date: Material, Origin, Type (Use the static variables
     * from the Category class to set)
     *
     * @param categoryType The category type to get.
     * @return A List containing all the relevant Category information.
     */
    @Override
    public List<Category> getCategoryList(int categoryType) {
        String sql = "select * from ";
        switch (categoryType) {
            case Category.PRODUCT_MATERIAL:
                sql += "product_material";
                break;
            case Category.PRODUCT_ORIGIN:
                sql += "product_origin";
                break;
            case Category.PRODUCT_TYPE:
                sql += "product_type";
                break;
        }

        CategoryMapper cm = new CategoryMapper();
        cm.setCategoryType(categoryType);

        List<Category> categoryList = jdbcTemplate.query(sql, cm);
        return categoryList;
    }

    /**
     * Responsible for binding the Category result set to the List.
     */
    class CategoryMapper implements RowMapper<Category> {

        private int categoryType;

        public int getCategoryType() {
            return categoryType;
        }

        public void setCategoryType(int categoryType) {
            this.categoryType = categoryType;
        }

        @Override
        public Category mapRow(ResultSet rs, int i) throws SQLException {
            Category pc = new Category();
            String getId, getName;
            switch (categoryType) {
                case Category.PRODUCT_MATERIAL:
                    getId = "product_material_id";
                    getName = "product_material_name";
                    break;
                case Category.PRODUCT_ORIGIN:
                    getId = "product_origin_id";
                    getName = "product_origin_name";
                    break;
                case Category.PRODUCT_TYPE:
                    getId = "product_type_id";
                    getName = "product_type_name";
                    break;
                default:
                    getId = null;
                    getName = null;
                    break;
            }
            pc.setCategoryType(categoryType);
            pc.setCategoryId(rs.getString(getId));
            pc.setCategoryName(rs.getString(getName));
            return pc;
        }

    }

}
