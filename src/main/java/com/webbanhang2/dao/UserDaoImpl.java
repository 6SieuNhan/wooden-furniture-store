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

/**
 *
 * @author fkien
 */
public class UserDaoImpl implements UserDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public boolean registerUser(User user) {
        String sql = "insert into user (username, password)"
                + "values('"+user.getUsername()+"'"
                + ", '"+user.getPassword()+"');";
        try{
            int res = jdbcTemplate.update(sql);
            return res!=0;
        } catch (DataAccessException ex){
            return false;
        }
    }

    @Override
    public User validateUser(User user) {
        String sql = "select * from user where username = '"
                + user.getUsername()
                + "' and password = '"
                + user.getPassword()
                + "';";
        List<User> users = jdbcTemplate.query(sql, new UserMapper());
        return users.size() > 0 ? users.get(0) : null;
    }

    class UserMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet rs, int arg1) throws SQLException {
            User user = new User();
            user.setUserId(rs.getString("userid"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            return user;
        }
    }
}