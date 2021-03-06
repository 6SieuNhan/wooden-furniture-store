/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.dao.MessageDao;
import com.webbanhang2.model.Message;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author fkien
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    @Transactional
    @Override
    public boolean addMessage(Message message) {
        return messageDao.addMessage(message);
    }

    @Override
    public List<Message> getMessageList(String subjectQuery, int top, int count) {
        return messageDao.getMessageList(subjectQuery, top, count);
    }

    @Override
    public Message getMessage(String messageId) {
        return messageDao.getMessage(messageId);
    }

    @Override
    public int getMessageListPageCount(String subjectQuery, int size) {
        return messageDao.getMessageListPageCount(subjectQuery, size);
    }
    
    @Override
    public boolean deleteMessage(String messageId){
        return messageDao.deleteMessage(messageId);
    }
}
