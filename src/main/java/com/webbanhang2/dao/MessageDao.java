/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Message;
import java.util.List;

/**
 *
 * @author fkien
 */
public interface MessageDao {
    boolean addMessage(Message message);
    
    public List<Message> getMessageList(String subjectQuery, int top, int count);
    
    public int getMessageListPageCount(String subjectQuery, int size);
    
    public Message getMessage(String messageId);
    
    public boolean deleteMessage(String messageId);
}
