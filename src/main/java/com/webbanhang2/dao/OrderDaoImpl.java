/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.stereotype.Component;

/**
 *
 * @author fkien
 */
@Component
public class OrderDaoImpl implements OrderDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Override
    public List<Order> getOrderList(int top, int count) {
        String sql = "select * from webbanhang.order limit " + top + ", " + count + " ;";
        List<Order> orderList = jdbcTemplate.query(sql, new OrderMapper());
        //don't need order details, this is for list view only
        /*for (Order o : orderList) {
            o.setOrderDetailList(orderDetailDao.getOrderDetailList(o.getOrderId()));
        }*/
        return orderList;
    }

    @Override
    public List<Order> getOrderList(String userId, int top, int count) {
        String sql = "select * from webbanhang.order "
                + "where user_id = '" + userId + "' "
                + "limit " + top + ", " + count + " ;";
        List<Order> orderList = jdbcTemplate.query(sql, new OrderMapper());
        //don't need order details, this is for list view only
        /*for (Order o : orderList) {
            o.setOrderDetailList(orderDetailDao.getOrderDetailList(o.getOrderId()));
        }*/
        return orderList;
    }
    
    @Override
    public int getOrderListPageCount(int size){
        String sql = "select COUNT(*) from webbanhang.order;";
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);
        List<Integer> rs = jdbcTemplate.query(sql, rowMapper);
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }
    }
    
    @Override
    public int getOrderListPageCount(String userId, int size){
        String sql = "select COUNT(*) from webbanhang.order where user_id = ?;";
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);
        List<Integer> rs = jdbcTemplate.query(sql, new Object[]{userId}, rowMapper);
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }
    }

    @Override
    public Order getOrder(String orderId) {
        String sql = "select * from webbanhang.order where order_id = '" + orderId + "';";
        List<Order> orderList = jdbcTemplate.query(sql, new OrderMapper());
        if (orderList == null || orderList.isEmpty()) {
            return null;
        } else {
            Order o = orderList.get(0);
            o.setOrderDetailList(orderDetailDao.getOrderDetailList(orderId));
            return o;
        }
    }

    @Override
    public boolean validateOrder(String orderId) {
        try {
            String sql = "UPDATE webbanhang.order SET order_status_id = '2' "
                    + "WHERE (order_id = ? "
                    + "and order_status_id = '1');";
            int i = jdbcTemplate.update(sql, orderId);
            return i != 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public Order addOrder(List<Product> items, User user, int paymentMethodId) {
        //begin by inserting into the order table
        String sql1;
        if (user.getUserId() == null || user.getUserId().isEmpty()) {
            sql1 = "insert into webbanhang.order(order_date, user_address, user_phone, user_email, payment_method_id)"
                    + "values (NOW(), ?, ?, ?, ?)";
            jdbcTemplate.update(sql1, user.getAddress(), user.getPhone(), user.getEmail(), paymentMethodId);
        } else {
            sql1 = "insert into webbanhang.order(user_id, order_date, user_address, user_phone, user_email, payment_method_id)"
                    + "values (?, NOW(), ?, ?, ?, ?)";
            jdbcTemplate.update(sql1, user.getUserId(), user.getAddress(), user.getPhone(), user.getEmail(), paymentMethodId);
        }
        //get last inserted ID
        String sql2;
        Order o;
        if (user.getUserId() == null || user.getUserId().isEmpty()) {
            //for Guest (no userID), need to search by email
            sql2 = "SELECT *, MAX(order_date) FROM webbanhang.order where user_email = ?;";
            o = jdbcTemplate.queryForObject(sql2, new Object[]{user.getEmail()}, new OrderMapper());
        } //for User, just search by userID
        else {
            sql2 = "SELECT *, MAX(order_date) FROM webbanhang.order where user_id = ?;";
            o = jdbcTemplate.queryForObject(sql2, new Object[]{user.getUserId()}, new OrderMapper());
        }
        //dump order detail lines
        if (o != null) {
            orderDetailDao.addOrderDetailList(o.getOrderId(), items);
        }
        return o;
    }

    class OrderMapper implements RowMapper<Order> {

        @Override
        public Order mapRow(ResultSet rs, int i) throws SQLException {
            Order order = new Order();
            order.setOrderId(rs.getString("order_id"));
            order.setUserId(rs.getString("user_id"));
            order.setOrderDate(rs.getDate("order_date"));
            order.setUserAddress(rs.getString("user_address"));
            order.setUserPhone(rs.getString("user_phone"));
            order.setUserEmail(rs.getString("user_email"));
            order.setOrderStatusId(rs.getString("order_status_id"));
            order.setValidationCode(rs.getString("validation_code"));
            order.setPaymentMethodId(rs.getInt("payment_method_id"));
            return order;
        }
    }
}
