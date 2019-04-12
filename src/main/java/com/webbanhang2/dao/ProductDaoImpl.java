/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.stereotype.Component;

/**
 *
 * @author fkien
 */
@Component
public class ProductDaoImpl implements ProductDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * Gets the Product information with the requested ID.
     *
     * @param productId A string containing the requested ID.
     * @return A Product object with all the relevant information, including
     * product images. Returns null if product is not found.
     */
    @Override
    public Product getProduct(String productId) {
        String sql = "select * from product where product_id = '" + productId + "';";
        List<Product> productList = jdbcTemplate.query(sql, new ProductMapper());
        return productList.size() > 0 ? productList.get(0) : null;
    }

    @Override
    public boolean checkProduct(String productId) {
        String sql = "select * from product where product_id = '" + productId + "';";
        List<Product> productList = jdbcTemplate.query(sql, new ProductMapper());
        return productList.size() > 0;
    }

    /**
     * A shortened version of the getProduct() methods which only retrieves
     * certain information about the Product. The retrieved information
     * includes: ID, name, short name, thumbnail and price
     *
     * @param productId A string containing the requested ID.
     * @return A Product object with only the aforementioned information.
     * Returns null if product is not found.
     */
    @Override
    public Product getShortenedProduct(String productId) {
        String sql = "SELECT product_id, product_name, thumbnail, price, quantity "
                + "FROM webbanhang.product where product_id = '" + productId + "';";
        List<Product> productList = jdbcTemplate.query(sql, new ShortenedProductMapper());
        return productList.size() > 0 ? productList.get(0) : null;
    }

    /**
     * Gets a List of Products according to the parameter map. The map can
     * containing any of the following parameters, or none at all: searchQuery
     * (String), productTypeID, productMaterialID, productOriginID (String
     * lists), minPrice, maxPrice (double)
     *
     * @param params A Map containing all the parameters needed for the search.
     * @param top The index of the first product to be fetched (first product is
     * number 0)
     * @param count The amount of product items needed. Should be set to
     * HomeController.PAGE_SIZE all the time.
     * @return
     */
    @Override
    public List<Product> getProductList(Map<String, Object> params, int top, int count) {
        String sql = "SELECT product_id, product_name, thumbnail, price, quantity "
                + "FROM webbanhang.product " + getSQLParamString(params, top, count);
        System.out.println(sql);
        List<Product> productList = jdbcTemplate.query(sql, new ShortenedProductMapper());
        return productList;
    }

    /**
     * Gets the page count for the parameter map. The map can containing any of
     * the following parameters, or none at all: searchQuery (String),
     * productTypeID, productMaterialID, productOriginID (String lists),
     * minPrice, maxPrice (double)
     *
     * @param params A Map containing all the parameters needed for the search.
     * @param size The page size, use HomeController.PAGE_SIZE for this
     * parameter.
     * @return The page count for the relevant parameter map.
     */
    @Override
    public int getProductListPageCount(Map<String, Object> params, int size) {
        String sql = "SELECT COUNT(*) FROM webbanhang.product " + getSQLParamString(params);
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);

        List<Integer> rs = jdbcTemplate.query(sql, rowMapper);
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }
    }

    /**
     * Gets a SQL parameter string for the page count method, based on the
     * parameter map. The result should be immediately appended to a generic
     * "SELECT COUNT(*) FROM webbanhang.product " statement.
     *
     * @param params Map to dump parameters into.
     * @return A string with the needed params.
     */
    String getSQLParamString(Map<String, Object> params) {
        String sql = " ";
        boolean first = false;
        //just in case params list is null
        if (params != null) {

            //Append search query
            String searchQuery = (String) params.get("searchQuery");
            if (searchQuery != null && !searchQuery.isEmpty()) {
                first = true;
                sql += "where product_name like '%" + searchQuery + "%' "
                        + "or product_code like '%" + searchQuery + "%' ";
            }

            //Append Category ID list
            List<String> productCategoryIds = (List<String>) params.get("productCategoryId");
            if (productCategoryIds != null && !productCategoryIds.isEmpty()) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                first = true;
                sql += "product_categories_id in " + getArrayString(productCategoryIds) + " ";
            }

            //Append material ID list
            List<String> productMaterialIds = (List<String>) params.get("productMaterialId");
            if (productMaterialIds != null && !productMaterialIds.isEmpty()) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                first = true;
                sql += "product_material_id in " + getArrayString(productMaterialIds) + " ";
            }
            //Append origin ID list
            List<String> productOriginIds = (List<String>) params.get("productOriginId");
            if (productOriginIds != null && !productOriginIds.isEmpty()) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                first = true;
                sql += "product_origin_id in " + getArrayString(productOriginIds) + " ";
            }
            //Append room ID list
            List<String> productRoomIds = (List<String>) params.get("productRoomId");
            if (productRoomIds != null && !productRoomIds.isEmpty()) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                first = true;
                sql += "product_room_id in " + getArrayString(productRoomIds) + " ";
            }

            //Append min price and max price
            Double minPrice = (Double) params.get("minPrice");
            Double maxPrice = (Double) params.get("maxPrice");
            if (minPrice != null) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                first = true;
                sql += "price >= '" + minPrice + "' ";
            }

            if (maxPrice != null) {
                if (first) {
                    sql += "and ";
                } else {
                    sql += "where ";
                }
                sql += "price <= '" + maxPrice + "' ";
            }
        }
        return sql;
    }

    /**
     * Gets a SQL parameter string for the product list method, based on the
     * parameter map. The result should be immediately appended to a generic
     * "SELECT * FROM webbanhang.product " statement.
     *
     * @param params Map to dump the params into
     * @param top The index of the first item (starting from 0)
     * @param count The amount of items to retrieve
     * @return A string with the needed params.
     */
    String getSQLParamString(Map<String, Object> params, int top, int count) {
        String sql = getSQLParamString(params);
        //Append top, count
        sql += "limit " + top + "," + count + ";";
        return sql;
    }

    String getArrayString(List<String> params) {
        if (params == null || params.isEmpty()) {
            return null;
        } else {
            return params.toString().replaceAll("\\[", "(").replaceAll("\\]", ")");
        }
    }

    @Override
    public List<Product> getProductListForAdmin(Map<String, Object> params, int top, int count) {
        String sql = "SELECT product_id,product_code, product_name, thumbnail, quantity,price "
                + "FROM webbanhang.product " + getSQLParamString(params, top, count);
        System.out.println(sql);
        List<Product> productList = jdbcTemplate.query(sql, new ProductForAdmin());
        return productList;
    }

    @Override
    public boolean deleteProduct(String productId) {
        String sql = "delete from product where product_id = '" + productId + "';";
        return (jdbcTemplate.update(sql)> 0);
    }

    @Override
    public boolean addProduct(Product p) {
        System.out.println(p.getProductName());
        String productCode = p.getProductCode();
        String productName = p.getProductName();
        int productCategoryId = p.getProductCategoryId();
        int productMaterialId = p.getProductMaterialId();
        int productRoomId = p.getProductRoomId();
        String thumbnail = p.getThumbnail();
        String descipt = p.getDescription();
        int quantity = p.getQuantity();
        double price = p.getPrice();
        String sql = "insert into product"
                + "(product_code, product_name,product_categories_id,product_material_id,product_room_id,thumbnail,description,quantity,price) "
                + "values(?,?,?,?,?,?,?,?,?)";
        int res = jdbcTemplate.update(sql, productCode, productName, productCategoryId, productMaterialId, productRoomId, thumbnail, descipt, quantity, price);
        return (res>0);
    }

    @Override
    public boolean updateProduct(Product p) {
        System.out.println(p.getProductName());
        String productCode = p.getProductCode();
        String productName = p.getProductName();
        int productCategoryId = p.getProductCategoryId();
        int productMaterialId = p.getProductMaterialId();
        int productRoomId = p.getProductRoomId();
        String thumbnail = p.getThumbnail();
        String descipt = p.getDescription();
        int quantity = p.getQuantity();
        double price = p.getPrice();
        String sql = "Update product set product_name = '" + productName + "'"
                + ",product_categories_id= '" + productCategoryId + "'"
                + ",product_material_id ='" + productMaterialId + "'"
                + ",product_room_id='" + productRoomId + "'"
                + ",thumbnail='" + thumbnail + "'"
                + ",description='" + descipt + "'"
                + ",quantity='" + quantity + "'"
                + ",price='" + price + "'"
                + "where product_code='" + productCode + "'";
        return (jdbcTemplate.update(sql) > 0);
    }

    /**
     * A simplified version of the Product Mapper class, intended to only be
     * used for fetching product list pages. Unnecessary components like
     * description and images are not fetched.
     */
    class ShortenedProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setThumbnail(rs.getString("thumbnail"));
            product.setPrice(rs.getInt("price"));
            product.setQuantity(rs.getInt("quantity"));
            return product;
        }
    }

    /**
     * Responsible for mapping all info from product result set.
     */
    class ProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductCode(rs.getString("product_code"));
            product.setProductCategoryId(rs.getInt("product_categories_id"));
            product.setProductMaterialId(rs.getInt("product_material_id"));
            product.setProductOriginId(rs.getInt("product_origin_id"));
            product.setProductRoomId(rs.getInt("product_room_id"));
            product.setDescription(rs.getString("description"));
            product.setQuantity(rs.getInt("quantity"));
            product.setPrice(rs.getInt("price"));
            return product;
        }
    }

    /**
     * Responsible for mapping image names from product_img result sets.
     */
    class ImgNameMapper implements RowMapper<String> {

        @Override
        public String mapRow(ResultSet rs, int arg1) throws SQLException {
            return rs.getString("img_name");
        }
    }

    class ProductForAdmin implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("product_id"));
            product.setProductCode(rs.getString("product_code"));
            product.setProductName(rs.getString("product_name"));
            product.setThumbnail(rs.getString("thumbnail"));
//            String sql = "select * from webbanhang.product_img "
//                    + "where`product_code` = '"
//                    + product.getProductId() + "';";
//            product.setImgList(jdbcTemplate.query(sql, new ImgNameMapper()));
            product.setQuantity(rs.getInt("quantity"));
            product.setPrice(rs.getInt("price"));
            return product;
        }
    }
}
