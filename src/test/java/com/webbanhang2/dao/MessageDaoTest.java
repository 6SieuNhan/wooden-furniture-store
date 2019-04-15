/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Message;
import javax.transaction.Transactional;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author fkien
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-mvc-servlet.xml")
@ActiveProfiles("test")
@WebAppConfiguration
public class MessageDaoTest extends TestCase {
    
    @Autowired
    WebApplicationContext webApplicationContext;
    
    @Autowired
    MessageDao messageDaoMock;
    
    //tests for method boolean addMessage(Message message)
    Message getTestMessageAdd(){
        Message m = new Message();
        m.setSubject("Lorem ipsum dolor sit amet");
        m.setMessage("HELP ME");
        m.setSenderName("John Smith");
        m.setSenderEmail("test@gmail.com");
        return m;
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullSubject(){
        Message test = getTestMessageAdd();
        test.setSubject(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullMessage(){
        Message test = getTestMessageAdd();
        test.setMessage(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullSenderName(){
        Message test = getTestMessageAdd();
        test.setSenderName(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullSenderEmail(){
        Message test = getTestMessageAdd();
        test.setSenderEmail(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSubject(){
        Message test = getTestMessageAdd();
        test.setSubject("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongMessage(){
        Message test = getTestMessageAdd();
        test.setMessage("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSenderName(){
        Message test = getTestMessageAdd();
        test.setSenderName("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSenderEmail(){
        Message test = getTestMessageAdd();
        test.setSenderEmail("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void addMessageCorrect(){
        Message test = getTestMessageAdd();
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, true);
    }
}
