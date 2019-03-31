/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.User;
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
            String sql = "select * from user where username = '"
                    + user.getUsername()
                    + "' and password = '"
                    + user.getPassword()
                    + "';";
            List<User> users = jdbcTemplate.query(sql, new UserMapper());
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
            String sql1 = "update webbanhang.user\n"
                    + "set recovery_code = UUID() where user_id = ?";
            jdbcTemplate.update(sql1, user.getUserId());
            String sql2 = "select recovery_code from webbanhang.user where user_id = ?";
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
            String sql = "select * from webbanhang.user\n"
                    + "where user_id = ? and recovery_code = ?";
            return jdbcTemplate.query(sql, new Object[]{userId, recoveryCode}, new UserMapper()).size() > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean resetPassword(String userId, String password) {
        try {
            String sql = "update webbanhang.user\n"
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
            String sql = "update webbanhang.user\n"
                    + "set email = ?, address = ?, phone = ?\n"
                    + "where user_id = ?;";
            return jdbcTemplate.update(sql, user.getEmail(), user.getAddress(), user.getPhone(), user.getUserId()) > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
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
