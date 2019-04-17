/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Message;
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
public class MessageDaoImpl implements MessageDao {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public boolean addMessage(Message message) {
        try {
            String sql = "insert into message(subject, message, sender_name, sender_email, date)\n"
                    + "values (?,?,?,?,NOW());";
            return jdbcTemplate.update(sql, message.getSubject(), message.getMessage(), message.getSenderName(), message.getSenderEmail()) > 0;
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Message> getMessageList(String subjectQuery, int top, int count) {
        String sql;
        List<Message> messageList;
        if (subjectQuery == null || subjectQuery.isEmpty()) {
            sql = "SELECT * FROM message order by date desc, sender_name desc limit ?, ?;";
            messageList = jdbcTemplate.query(sql, new Object[]{top, count}, new ShortenedMessageMapper());
        } else {
            subjectQuery = "%" + subjectQuery + "%";
            sql = "SELECT * FROM message where subject like ? \n"
                    + "order by date desc, sender_name desc limit ?, ?;";
            messageList = jdbcTemplate.query(sql, new Object[]{subjectQuery, top, count}, new ShortenedMessageMapper());
        }
        return messageList.size() > 0 ? messageList : null;
    }

    @Override
    public int getMessageListPageCount(String subjectQuery, int size) {

        String sql;
        SingleColumnRowMapper rowMapper = new SingleColumnRowMapper(Integer.class);
        List<Integer> rs;
        if (subjectQuery == null || subjectQuery.isEmpty()) {
            sql = "SELECT COUNT(*) FROM message;";
            rs = jdbcTemplate.query(sql, rowMapper);
        } else {
            subjectQuery = "%" + subjectQuery + "%";
            sql = "SELECT COUNT(*) FROM message where subject like ?;";
            rs = jdbcTemplate.query(sql, new Object[]{subjectQuery}, rowMapper);
        }
        int count = rs.get(0);
        if (count % size == 0) {
            return count / size;
        } else {
            return count / size + 1;
        }

    }

    @Override
    public Message getMessage(String messageId) {
        String sql = "SELECT * FROM message where message_id = ?;";
        List<Message> messageList = jdbcTemplate.query(sql, new Object[]{messageId}, new MessageMapper());
        return messageList.size() > 0 ? messageList.get(0) : null;
    }
    
    @Override
    public boolean deleteMessage(String messageId) {
        String sql = "DELETE FROM message where message_id = ?;";
        int res = jdbcTemplate.update(sql, messageId);
        return (res>0);
    }

    class ShortenedMessageMapper implements RowMapper<Message> {

        @Override
        public Message mapRow(ResultSet rs, int i) throws SQLException {
            Message m = new Message();

            m.setMessageId(rs.getString("message_id"));
            m.setSubject(rs.getString("subject"));
            m.setSenderEmail(rs.getString("sender_email"));
            m.setSenderName(rs.getString("sender_name"));
            m.setDate(rs.getDate("Date"));
            return m;
        }
    }

    class MessageMapper implements RowMapper<Message> {

        @Override
        public Message mapRow(ResultSet rs, int i) throws SQLException {
            Message m = new Message();

            m.setMessageId(rs.getString("message_id"));
            m.setSubject(rs.getString("subject"));
            m.setMessage(rs.getString("message"));
            m.setSenderEmail(rs.getString("sender_email"));
            m.setSenderName(rs.getString("sender_name"));
            m.setDate(rs.getDate("Date"));

            return m;
        }
    }

}
