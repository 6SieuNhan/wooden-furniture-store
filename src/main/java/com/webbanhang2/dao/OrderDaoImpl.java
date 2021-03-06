/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Order;
import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    ProductDao productDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    @Override
    public List<Order> getOrderList(String userId, int top, int count) {
        String sql = "SELECT * FROM `order` left join \n"
                + "(SELECT user_id, username from user) a1\n"
                + "on `order`.user_id = a1.user_id\n"
                + "where a1.user_id = ?\n"
                + "order by order_date desc limit ?, ?;";
        List<Order> orderList = jdbcTemplate.query(sql, new Object[]{userId, top, count}, new OrderMapper());
        return orderList;
    }

    @Override
    public List<Order> getOrderListSearch(String query, int top, int count) {
        List<Order> orderList;
        String sql;
        if (query != null && !query.isEmpty()) {
            sql = "SELECT * FROM `order` left join \n"
                    + "(SELECT user_id, username from user) a1\n"
                    + "on `order`.user_id = a1.user_id\n"
                    + "where a1.username like ?\n"
                    + "order by order_date desc limit ?, ?;";
            orderList = jdbcTemplate.query(sql, new Object[]{query, top, count}, new OrderMapper(true));
        } else {
            sql = "SELECT * FROM `order` left join \n"
                    + "(SELECT user_id, username from user) a1\n"
                    + "on `order`.user_id = a1.user_id order by order_date desc limit ?, ?;";
            orderList = jdbcTemplate.query(sql, new Object[]{top, count}, new OrderMapper(true));
        }
        return orderList;
    }

    @Override
    public int getOrderListPageCount(int size) {
        String sql = "select COUNT(*) from `order`;";
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
    public int getOrderListPageCount(String userId, int size) {
        String sql = "select COUNT(*) from `order` where user_id = ?;";
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
    public int getOrderListSearchPageCount(String username, int size) {
        String sql = "SELECT COUNT(*) FROM `order` left join user \n"
                + "on `order`.user_id = user.user_id\n"
                + "where user.username like ?;";
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);
        List<Integer> rs = jdbcTemplate.query(sql, new Object[]{username}, rowMapper);
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }
    }

    @Override
    public Order getOrder(String orderId) {
        String sql = "select * from `order` where order_id = '" + orderId + "';";
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
            Order o = getOrder(orderId);
            //check stock; prevents validation if there's not enough
            ArrayList<Product> productList = new ArrayList<>();
            for (OrderDetail od : o.getOrderDetailList()) {
                Product p = od.getProduct();
                p.setQuantity(od.getQuantity());
                productList.add(p);
            }
            if (!productDao.checkStock(productList)) {
                return false;
            }
            String sql = "UPDATE `order` SET order_status_id = '2', validation_code = null "
                    + "WHERE (order_id = ? "
                    + "and order_status_id = '1');";
            int i = jdbcTemplate.update(sql, orderId);
            //if validation is successful, start removing items
            if (i != 0) {
                return productDao.updateStock(productList, false);
            } else {
                return false;
            }
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean changeOrderStatus(String orderId, int orderStatusId) {
        try {
            //get order
            //only allows 1 way modification: unverified -> verified -> completed
            //As a result, new status ID should be higher than old status ID
            Order o = getOrder(orderId);
            int oldStatusId = Integer.parseInt(o.getOrderStatusId());
            if(orderStatusId < oldStatusId){
                return false;
            }
            //if new = old, there's nothing to change so return true
            if(orderStatusId == oldStatusId){
                return true;
            }
            //remove item from stock for unverified -> verified or complete action
            if(oldStatusId == 1){
                ArrayList<Product> productList = new ArrayList<>();
                for (OrderDetail od : o.getOrderDetailList()) {
                    Product p = od.getProduct();
                    p.setQuantity(od.getQuantity());
                    productList.add(p);
                }
                productDao.updateStock(productList, false);
            }
            //the actual change status ID part
            String sql;
            try {
                if (Integer.parseInt(orderId) == Order.COMPLETE) {
                    sql = "UPDATE `order` SET order_status_id = ?, complete_date = NOW() "
                            + "WHERE order_id = ?;";
                } else {
                    sql = "UPDATE `order` SET order_status_id = ? "
                            + "WHERE order_id = ?;";
                }
            } catch (NumberFormatException ex) {
                sql = "UPDATE `order` SET order_status_id = ? "
                        + "WHERE order_id = ?;";
            }
            return jdbcTemplate.update(sql, orderStatusId, orderId) > 0;
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
            sql1 = "insert into `order`(order_date, user_address, user_phone, user_email, payment_method_id)"
                    + "values (NOW(), ?, ?, ?, ?)";
            jdbcTemplate.update(sql1, user.getAddress(), user.getPhone(), user.getEmail(), paymentMethodId);
        } else {
            sql1 = "insert into `order`(user_id, order_date, user_address, user_phone, user_email, payment_method_id)"
                    + "values (?, NOW(), ?, ?, ?, ?)";
            jdbcTemplate.update(sql1, user.getUserId(), user.getAddress(), user.getPhone(), user.getEmail(), paymentMethodId);
        }
        //get last inserted ID
        String sql2;
        Order o;
        if (user.getUserId() == null || user.getUserId().isEmpty()) {
            //for Guest (no userID), need to search by email
            sql2 = "SELECT * FROM `order` where order_date in \n"
                    + "(select MAX(order_date) FROM `order` where user_email = ?);";
            o = jdbcTemplate.queryForObject(sql2, new Object[]{user.getEmail()}, new OrderMapper());
        } //for User, just search by userID
        else {
            sql2 = "SELECT * FROM `order` where order_date in \n"
                    + "(select MAX(order_date) FROM `order` where user_id = ?);";
            o = jdbcTemplate.queryForObject(sql2, new Object[]{user.getUserId()}, new OrderMapper());
        }
        //dump order detail lines
        if (o != null) {
            orderDetailDao.addOrderDetailList(o.getOrderId(), items);
        }
        return o;
    }

    @Override
    public boolean deleteOrder(String orderId) {
        //get order to prepare for verified delete
        Order o = getOrder(orderId);
        if (o.getOrderStatusId().equals("2")) {
            ArrayList<Product> productList = new ArrayList<>();
            for (OrderDetail od : o.getOrderDetailList()) {
                Product p = od.getProduct();
                p.setQuantity(od.getQuantity());
                productList.add(p);
            }
            //returns stock from verified order
            productDao.updateStock(productList, true);
        }
        boolean result2 = orderDetailDao.deleteOrderDetail(orderId);
        if (result2) {
            String sql = "DELETE FROM `order` where order_id = ?";
            int result = jdbcTemplate.update(sql, orderId);
            return result > 0;
        } else {
            return false;
        }
    }

    class OrderMapper implements RowMapper<Order> {

        boolean hasUsername;

        public OrderMapper() {
            super();
            hasUsername = false;
        }

        public OrderMapper(boolean hasUsername) {
            super();
            this.hasUsername = hasUsername;
        }

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
            if (hasUsername) {
                order.setUsername(rs.getString("username"));
                System.out.println(order.getUsername());
            }
            return order;
        }
    }
}
