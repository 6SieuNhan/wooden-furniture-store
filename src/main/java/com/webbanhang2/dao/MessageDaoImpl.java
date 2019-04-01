/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Message;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 *
 * @author fkien
 */
@Component
public class MessageDaoImpl implements MessageDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public boolean addMessage(Message message) {
        try {
            String sql = "insert into webbanhang.message(subject, message, sender_name, sender_email, date)\n"
                    + "values (?,?,?,?,NOW());";
            return jdbcTemplate.update(sql, message.getSubject(), message.getMessage(), message.getSenderName(), message.getSenderEmail()) > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

}
