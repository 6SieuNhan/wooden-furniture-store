/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

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
public class UserDaoImpl implements UserDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public boolean registerUser(User user) {
        try {
            String sql = "insert into user(username, password, email, user_role_id, address, phone)"
                    + "values(?,?,?,2,?,?)\n";
            int res = jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getAddress(), user.getPhone());
            return res != 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public User getUser(User user) {
        try {
            String sql = "select * from user where (username = ? or email = ?) and password = ?";
            List<User> users = jdbcTemplate.query(sql, new Object[]{user.getUsername(), user.getUsername(), user.getPassword()}, new UserMapper());
            return users.size() > 0 ? users.get(0) : null;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public User getUserById(String userId) {
        try {
            String sql = "select * from user where user_id = ?";
            List<User> users = jdbcTemplate.query(sql, new Object[]{userId}, new UserMapper());
            return users.size() > 0 ? users.get(0) : null;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public User getUserByName(String username) {
        try {
            String sql = "select * from user where username = ?";
            List<User> users = jdbcTemplate.query(sql, new Object[]{username}, new UserMapper());
            return users.size() > 0 ? users.get(0) : null;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public User getUserByEmail(String email) {
        try {
            String sql = "select * from user where email = ?";
            List<User> users = jdbcTemplate.query(sql, new Object[]{email}, new UserMapper());
            return users.size() > 0 ? users.get(0) : null;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public String createRecoveryCode(User user) {
        try {
            String sql1 = "update user\n"
                    + "set recovery_code = UUID() where user_id = ?";
            jdbcTemplate.update(sql1, user.getUserId());
            String sql2 = "select recovery_code from user where user_id = ?";
            List<String> recoveryCode = jdbcTemplate.query(sql2, new Object[]{user.getUserId()}, new RecoveryCodeMapper());
            return recoveryCode.size() > 0 ? recoveryCode.get(0) : null;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public boolean validateRecovery(String userId, String recoveryCode) {
        try {
            String sql = "select * from user\n"
                    + "where user_id = ? and recovery_code = ?";
            return jdbcTemplate.query(sql, new Object[]{userId, recoveryCode}, new UserMapper()).size() > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean changePassword(String userId, String password) {
        try {
            String sql = "update user\n"
                    + "set password = ?,\n"
                    + "recovery_code = null\n"
                    + "where user_id = ?;";
            return jdbcTemplate.update(sql, password, userId) > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean editUser(User user) {
        try {
            if (user.getUserRoleId() != 0) {
                String sql = "update user\n"
                        + "set email = ?, address = ?, phone = ?, user_role_id = ?\n"
                        + "where user_id = ?;";
                return jdbcTemplate.update(sql, user.getEmail(), user.getAddress(), user.getPhone(), user.getUserRoleId(), user.getUserId()) > 0;
            } else {
                String sql = "update user\n"
                        + "set email = ?, address = ?, phone = ?\n"
                        + "where user_id = ?;";
                return jdbcTemplate.update(sql, user.getEmail(), user.getAddress(), user.getPhone(), user.getUserId()) > 0;
            }

        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public List<User> getUserList(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int top, int count) {
        String sql = "SELECT * FROM user " + getUserWhereString(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, top, count);
        //build param array
        ArrayList<Object> param = new ArrayList<>();
        if (userQuery != null && !userQuery.isEmpty()) {
            param.add("%" + userQuery + "%");
        }
        if (emailQuery != null && !emailQuery.isEmpty()) {
            param.add("%" + emailQuery + "%");
        }
        if (addressQuery != null && !addressQuery.isEmpty()) {
            param.add("%" + addressQuery + "%");
        }
        if (phoneQuery != null && !phoneQuery.isEmpty()) {
            param.add("%" + phoneQuery + "%");
        }
        if(userRoleId!=0){
            param.add(userRoleId);
        }
        if (top > 0 && count > 0) {
            param.add(top);
            param.add(count);
        }
        List<User> query = jdbcTemplate.query(sql, param.toArray(), new UserMapper());
        return query.size() > 0 ? query : null;
    }

    @Override
    public int getUserListPageCount(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int size) {
        String sql = "SELECT COUNT(*) FROM user " + getUserWhereString(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, 0, 0);
        //build param array
        ArrayList<Object> param = new ArrayList<>();
        if (userQuery != null && !userQuery.isEmpty()) {
            param.add(userQuery);
        }
        if (emailQuery != null && !emailQuery.isEmpty()) {
            param.add(emailQuery);
        }
        if (addressQuery != null && !addressQuery.isEmpty()) {
            param.add(addressQuery);
        }
        if (phoneQuery != null && !phoneQuery.isEmpty()) {
            param.add(phoneQuery);
        }
        if(userRoleId!=0){
            param.add(userRoleId);
        }
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);
        List<Integer> rs = jdbcTemplate.query(sql, param.toArray(), rowMapper);
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }
    }

    String getUserWhereString(String userQuery, String emailQuery, String addressQuery, String phoneQuery, int userRoleId, int top, int count) {
        String where = "";
        boolean first = false;
        if (userQuery != null && !userQuery.isEmpty()) {
            first = true;
            where += "where username like ? ";
        }
        if (emailQuery != null && !emailQuery.isEmpty()) {
            if (first) {
                where += "and ";
            } else {
                first = true;
                where += "where ";
            }
            where += "email like ? ";
        }
        if (addressQuery != null && !addressQuery.isEmpty()) {
            if (first) {
                where += "and ";
            } else {
                first = true;
                where += "where ";
            }
            where += "address like ? ";
        }
        if (phoneQuery != null && !phoneQuery.isEmpty()) {
            if (first) {
                where += "and ";
            } else {
                first = true;
                where += "where ";
            }
            where += "phone like ? ";
        }
        if(userRoleId!=0){
            if (first) {
                where += "and ";
            } else {
                where += "where ";
            }
            where += "user_role_id = ? ";
        }
        if (top > 0 && count > 0) {
            where += "limit ?, ?;";
        }
        return where;
    }

    class UserMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet rs, int arg1) throws SQLException {
            User user = new User();
            user.setUserId(rs.getString("user_id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setUserRoleId(rs.getInt("user_role_id"));
            user.setAddress(rs.getString("address"));
            user.setPhone(rs.getString("phone"));
            return user;
        }
    }

    class RecoveryCodeMapper implements RowMapper<String> {

        @Override
        public String mapRow(ResultSet rs, int arg1) throws SQLException {
            return rs.getString("recovery_code");
        }
    }
}
