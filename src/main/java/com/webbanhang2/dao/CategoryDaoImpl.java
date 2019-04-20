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
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

/**
 *
 * @author fkien
 */
@Component
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
        try {
            String sql = "select * from ";
            switch (categoryType) {
                case Category.PRODUCT_CATEGORY:
                    sql += "product_categories";
                    break;
                case Category.PRODUCT_MATERIAL:
                    sql += "product_material";
                    break;
                case Category.PRODUCT_ORIGIN:
                    sql += "product_origin";
                    break;
                case Category.PRODUCT_ROOM:
                    sql += "product_room";
                    break;
                case Category.PAYMENT_METHOD:
                    sql += "payment_method";
                    break;
                case Category.ORDER_STATUS:
                    sql += "order_status";
                    break;
                case Category.USER_ROLE:
                    sql += "user_role";
                    break;
                default:
                    return null;
            }
            List<Category> categoryList = jdbcTemplate.query(sql, new CategoryMapper(categoryType));
            return categoryList;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public List<Category> getCategoryListWithProductCount(int categoryType) {
        List<Category> cList = getCategoryList(categoryType);
        String sql;
        switch (categoryType) {
            case Category.PRODUCT_CATEGORY:
                sql = "select product_categories_id as category_id, count(*) as `count` from product group by product_categories_id;";
                break;
            case Category.PRODUCT_MATERIAL:
                sql = "select product_material_id as category_id, count(*) as `count` from product group by product_material_id;";
                break;
            case Category.PRODUCT_ORIGIN:
                sql = "select product_origin_id as category_id, count(*) as `count` from product group by product_origin_id;";
                break;
            case Category.PRODUCT_ROOM:
                sql = "select product_room_id as category_id, count(*) as `count` from product group by product_room_id;";
                break;
            default:
                return cList;
        }
        List<ProductCount> query = jdbcTemplate.query(sql, new ProductCountMapper());
        //x1 = category list size
        Category c;
        for (ProductCount pc : query) {
            for (int i = 0; i < cList.size(); i++) {
                c = cList.get(i);
                if (pc.getCategoryId() == c.getCategoryId()) {
                    c.setProductCount(pc.getProductCount());
                    break;
                }
            }
        }
        return cList;
    }

    @Override
    public Category getCategoryByName(String categoryName, int categoryType) {
        try {
            String sql = "select * from ";
            switch (categoryType) {
                case Category.PRODUCT_CATEGORY:
                    sql += "product_categories where categories_name = ?;";
                    break;
                case Category.PRODUCT_MATERIAL:
                    sql += "product_material where material_name = ?;";
                    break;
                case Category.PRODUCT_ORIGIN:
                    sql += "product_origin where origin_name = ?;";
                    break;
                case Category.PRODUCT_ROOM:
                    sql += "product_room where room_name = ?;";
                    break;
                case Category.PAYMENT_METHOD:
                    sql += "payment_method where payment_method_name = ?;";
                    break;
                case Category.ORDER_STATUS:
                    sql += "order_status where order_status_name = ?;";
                    break;
                case Category.USER_ROLE:
                    sql += "user_role where user_role_name = ?;";
                    break;
                default:
                    return null;
            }
            List<Category> categoryList = jdbcTemplate.query(sql, new Object[]{categoryName}, new CategoryMapper(categoryType));
            if (categoryList.isEmpty()) {
                return null;
            } else {
                Category c = categoryList.get(0);
                //get product count
                switch (categoryType) {
                    case Category.PRODUCT_CATEGORY:
                        sql = "select product_categories_id as category_id, count(*) as `count` from product where product_categories_id = ?;";
                        break;
                    case Category.PRODUCT_MATERIAL:
                        sql = "select product_material_id as category_id, count(*) as `count` from product where product_material_id = ?;";
                        break;
                    case Category.PRODUCT_ORIGIN:
                        sql = "select product_origin_id as category_id, count(*) as `count` from product where product_origin_id = ?;";
                        break;
                    case Category.PRODUCT_ROOM:
                        sql = "select product_room_id as category_id, count(*) as `count` from product where product_room_id = ?;";
                        break;
                    default:
                        return c;
                }
                List<ProductCount> query = jdbcTemplate.query(sql, new Object[]{c.getCategoryId()}, new ProductCountMapper());
                if (query.isEmpty()) {
                    c.setProductCount(0);
                } else {
                    c.setProductCount(query.get(0).getProductCount());
                }
                return c;
            }
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public boolean saveCategory(String oldCategory, String newCategory, int categoryType) {
        try {
            String sql;
            if (oldCategory == null || oldCategory.isEmpty()) {
                //case for insert
                switch (categoryType) {
                    case Category.PRODUCT_CATEGORY:
                        sql = "insert into product_categories(categories_name) values (?);";
                        break;
                    case Category.PRODUCT_MATERIAL:
                        sql = "insert into product_material(material_name) values (?);";
                        break;
                    case Category.PRODUCT_ORIGIN:
                        sql = "insert into product_origin(origin_name) values (?);";
                        break;
                    case Category.PRODUCT_ROOM:
                        sql = "insert into product_room(room_name) values (?);";
                        break;
                    case Category.PAYMENT_METHOD:
                        sql = "insert into payment_method(payment_method_name) values (?);";
                        break;
                    case Category.ORDER_STATUS:
                        sql = "insert into order_status(order_status_name) values (?);";
                        break;
                    case Category.USER_ROLE:
                        sql = "insert into user_role(user_role_name) values (?);";
                        break;
                    default:
                        return false;
                }
                return jdbcTemplate.update(sql, newCategory) > 0;
            } else {
                //case for update
                switch (categoryType) {
                    case Category.PRODUCT_CATEGORY:
                        sql = "update product_categories set categories_name = ? where categories_name = ?;";
                        break;
                    case Category.PRODUCT_MATERIAL:
                        sql = "update product_material set material_name = ? where material_name = ?;";
                        break;
                    case Category.PRODUCT_ORIGIN:
                        sql = "update product_origin set origin_name = ? where origin_name = ?;";
                        break;
                    case Category.PRODUCT_ROOM:
                        sql = "update product_room set room_name = ? where room_name = ?;";
                        break;
                    case Category.PAYMENT_METHOD:
                        sql = "update payment_method set payment_method_name = ? where payment_method_name = ?;";
                        break;
                    case Category.ORDER_STATUS:
                        sql = "update order_status set order_status_name = ? where order_status_name = ?;";
                        break;
                    case Category.USER_ROLE:
                        sql = "update user_role set user_role_name = ? where user_role_name = ?;";
                        break;
                    default:
                        return false;
                }
                return jdbcTemplate.update(sql, newCategory, oldCategory) > 0;
            }
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    /**
     * Responsible for binding the Category result set to the List.
     */
    class CategoryMapper implements RowMapper<Category> {

        public CategoryMapper(int categoryType) {
            super();
            this.categoryType = categoryType;
        }

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
                case Category.PRODUCT_CATEGORY:
                    getId = "categories_id";
                    getName = "categories_name";
                    break;
                case Category.PRODUCT_MATERIAL:
                    getId = "material_id";
                    getName = "material_name";
                    break;
                case Category.PRODUCT_ORIGIN:
                    getId = "origin_id";
                    getName = "origin_name";
                    break;
                case Category.PRODUCT_ROOM:
                    getId = "room_id";
                    getName = "room_name";
                    break;
                case Category.PAYMENT_METHOD:
                    getId = "payment_method_id";
                    getName = "payment_method_name";
                    break;
                case Category.ORDER_STATUS:
                    getId = "order_status_id";
                    getName = "order_status_name";
                    break;
                case Category.USER_ROLE:
                    getId = "user_role_id";
                    getName = "user_role_name";
                    break;
                default:
                    getId = null;
                    getName = null;
                    break;
            }
            pc.setCategoryType(categoryType);
            pc.setCategoryId(rs.getInt(getId));
            pc.setCategoryName(rs.getString(getName));
            return pc;
        }
    }

    @Override
    public boolean deleteCategory(String categoryName, int categoryType) {
        Category old = getCategoryByName(categoryName, categoryType);
        if(old==null){
            return true;
        }
        //reject delete if category still has products
        if (old.getProductCount() > 0) {
            return false;
        } else {
            String sql;
            switch (categoryType) {
                case Category.PRODUCT_CATEGORY:
                    sql = "delete from product_categories where categories_name = ?;";
                    break;
                case Category.PRODUCT_MATERIAL:
                    sql = "delete from product_material where material_name = ?;";
                    break;
                case Category.PRODUCT_ORIGIN:
                    sql = "delete from product_origin where origin_name = ?;";
                    break;
                case Category.PRODUCT_ROOM:
                    sql = "delete from product_room where room_name = ?;";
                    break;
                case Category.PAYMENT_METHOD:
                    sql = "delete from payment_method where payment_method_name = ?;";
                    break;
                case Category.ORDER_STATUS:
                    sql = "delete from order_status where order_status_name = ?;";
                    break;
                case Category.USER_ROLE:
                    sql = "delete from user_role where user_role_name = ?;";
                    break;
                default:
                    return false;
            }
            return jdbcTemplate.update(sql, categoryName) > 0;
        }
    }

    class ProductCountMapper implements RowMapper<ProductCount> {

        @Override
        public ProductCount mapRow(ResultSet rs, int i) throws SQLException {
            ProductCount c = new ProductCount();
            c.setCategoryId(rs.getInt("category_id"));
            c.setProductCount(rs.getInt("count"));
            return c;
        }

    }

    class ProductCount {

        private int categoryId, productCount;

        public int getCategoryId() {
            return categoryId;
        }

        public void setCategoryId(int categoryId) {
            this.categoryId = categoryId;
        }

        public int getProductCount() {
            return productCount;
        }

        public void setProductCount(int productCount) {
            this.productCount = productCount;
        }
    }
}
