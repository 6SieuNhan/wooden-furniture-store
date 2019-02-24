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
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author fkien
 */
public class ProductDaoImpl implements ProductDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> getProductList(int top, int count) {
        String sql = "select bin_to_uuid(`product_id_bin`) as product_id, `product_name`, `thumbnail`, `price`"
                + " from product limit " + top + "," + count + ";";
        List<Product> productList = jdbcTemplate.query(sql, new ShortenedProductMapper());
        return productList;
    }

    @Override
    public Product getProduct(String productId) {
        String sql = "select *, bin_to_uuid(`product_id_bin`) as product_id from product where product_id_bin = uuid_to_bin('" + productId + "');";
        List<Product> productList = jdbcTemplate.query(sql, new ProductMapper());
        return productList.size() > 0 ? productList.get(0) : null;
    }

    class ImgNameMapper implements RowMapper<String> {

        @Override
        public String mapRow(ResultSet rs, int arg1) throws SQLException {
            return rs.getString("img_name");
        }

    }

    class ShortenedProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setThumbnail(rs.getString("thumbnail"));
            product.setPrice(rs.getInt("price"));
            return product;
        }
    }

    class ProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int arg1) throws SQLException {
            Product product = new Product();
            product.setProductId(rs.getString("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductTypeId(rs.getInt("product_type_product_type_id"));
            product.setProductMaterialId(rs.getInt("product_material_product_material_id"));
            product.setProductOriginId(rs.getInt("product_origin_product_origin_id"));
            product.setDescription(rs.getString("description"));
            product.setQuantity(rs.getInt("quantity"));
            product.setPrice(rs.getDouble("price"));
            String sql = "select * from webbanhang.product_img "
                    + "where`product_product_id_bin` = uuid_to_bin('"
                    + product.getProductId() + "');";
            product.setImgList(jdbcTemplate.query(sql, new ImgNameMapper()));
            return product;
        }
    }

}
