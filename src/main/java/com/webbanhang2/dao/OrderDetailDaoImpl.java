/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

/**
 *
 * @author fkien
 */
@Component
public class OrderDetailDaoImpl implements OrderDetailDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    ProductDao productDao;

    @Override
    public OrderDetail getOrderDetail(String orderId, String productId) {
        String sql = "SELECT * FROM webbanhang.order_detail left join webbanhang.product\n"
                + "on order_detail.product_id = product.product_id\n"
                + "where order_id = ?;\n"
                + "and order_detail.product_id = ?;";
        List<OrderDetail> orderList = jdbcTemplate.query(sql, new Object[]{orderId, productId}, new OrderDetailMapper(true));
        if (orderList == null || orderList.isEmpty()) {
            return null;
        } else {
            return orderList.get(0);
        }
    }

    @Override
    public boolean addOrderDetail(String orderId, Product item) {
        try {
            String sql = "insert into webbanhang.order_detail(order_id, product_id, quantity, price) values(?, ?, ?, ?)";
            int i = jdbcTemplate.update(sql, orderId, item.getProductId(), item.getQuantity(), item.getPrice());
            return i != 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public List<OrderDetail> getOrderDetailList(String orderId) {
        String sql = "SELECT * FROM webbanhang.order_detail left join webbanhang.product\n"
                + "on order_detail.product_id = product.product_id\n"
                + "where order_id = ?;";
        return jdbcTemplate.query(sql, new Object[]{orderId}, new OrderDetailMapper(true));
    }

    @Override
    public boolean addOrderDetailList(String orderId, List<Product> items) {
        try {
            String sql = "insert into webbanhang.order_detail(order_id, product_id, quantity, price) values(?, ?, ?, ?)";
            OrderDetailPreparedStatementSetter odpss = new OrderDetailPreparedStatementSetter();
            odpss.setOrderId(orderId);
            odpss.setItems(items);
            jdbcTemplate.batchUpdate(sql, odpss);
            return true;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    class OrderDetailPreparedStatementSetter implements BatchPreparedStatementSetter {

        String orderId;
        private List<Product> items;

        public String getOrderId() {
            return orderId;
        }

        public void setOrderId(String orderId) {
            this.orderId = orderId;
        }

        public List<Product> getItems() {
            return items;
        }

        public void setItems(List<Product> items) {
            this.items = items;
        }

        @Override
        public void setValues(PreparedStatement ps, int i) throws SQLException {
            ps.setString(1, orderId);
            ps.setString(2, items.get(i).getProductId());
            ps.setInt(3, items.get(i).getQuantity());
            ps.setDouble(4, items.get(i).getPrice());
        }

        @Override
        public int getBatchSize() {
            return items.size();
        }

    }

    class OrderDetailMapper implements RowMapper<OrderDetail> {

        boolean getProduct;

        public OrderDetailMapper(boolean getProduct) {
            super();
            this.getProduct = getProduct;
        }

        @Override
        public OrderDetail mapRow(ResultSet rs, int i) throws SQLException {
            OrderDetail od = new OrderDetail();
            od.setOrderId(rs.getString("order_id"));
            od.setProductId(rs.getString("product_id"));
            od.setQuantity(rs.getInt("quantity"));
            od.setPrice(rs.getInt("price"));
            od.setTotal(rs.getInt("total"));
            //Do Product object
            if (getProduct) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setProductName(rs.getString("product_name"));
                od.setProduct(product);
            }
            return od;
        }
    }

}
