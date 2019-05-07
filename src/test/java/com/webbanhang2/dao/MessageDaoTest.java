/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Message;
import java.util.List;
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
    Message getTestMessageAdd() {
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
    public void addMessageNullSubject() {
        Message test = getTestMessageAdd();
        test.setSubject(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullMessage() {
        Message test = getTestMessageAdd();
        test.setMessage(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullSenderName() {
        Message test = getTestMessageAdd();
        test.setSenderName(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageNullSenderEmail() {
        Message test = getTestMessageAdd();
        test.setSenderEmail(null);
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSubject() {
        Message test = getTestMessageAdd();
        test.setSubject("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongMessage() {
        Message test = getTestMessageAdd();
        test.setMessage("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSenderName() {
        Message test = getTestMessageAdd();
        test.setSenderName("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageLongSenderEmail() {
        Message test = getTestMessageAdd();
        test.setSenderEmail("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void addMessageCorrect() {
        Message test = getTestMessageAdd();
        boolean result = messageDaoMock.addMessage(test);
        assertEquals(result, true);
    }

    //tests for method getMessageList(String subjectQuery, int top, int count)
    @Test
    public void getMessageListNoQuery() {
        List<Message> result = messageDaoMock.getMessageList(null, 0, 2);
        assertEquals(result.size(), 2);
        assertEquals(result.get(0).getSubject(), "Test message");
    }

    @Test
    public void getMessageListTestCount() {
        List<Message> result = messageDaoMock.getMessageList(null, 0, 3);
        assertEquals(result.size(), 3);
        assertEquals(result.get(0).getSubject(), "Test message");
    }

    @Test
    public void getMessageListTestTop() {
        List<Message> result = messageDaoMock.getMessageList(null, 1, 2);
        assertEquals(result.size(), 2);
        assertEquals(result.get(0).getSubject(), "Also a test message");
    }

    @Test
    public void getMessageListSearch() {
        List<Message> result = messageDaoMock.getMessageList("test message", 0, 2);
        assertEquals(result.size(), 2);
        assertEquals(result.get(0).getSubject(), "Test message");
    }

    @Test
    public void getMessageListIncorrectQuery() {
        List<Message> result = messageDaoMock.getMessageList("INCORRECT_SEARCH_QUERY", 0, 2);
        assertEquals(result, null);
    }

    //tests for method public int getMessageListPageCount(String subjectQuery, int size)
    @Test
    public void getMessageListPageCountNoQuery() {
        int result = messageDaoMock.getMessageListPageCount(null, 2);
        assertEquals(result, 4);
    }

    @Test
    public void getMessageListPageCountPageSizeTest() {
        int result = messageDaoMock.getMessageListPageCount(null, 3);
        assertEquals(result, 3);
    }

    @Test
    public void getMessageListPageCountWithQuery() {
        int result = messageDaoMock.getMessageListPageCount("test message", 2);
        assertEquals(result, 3);
    }

    @Test
    public void getMessageListPageCountIncorrectQuery() {
        int result = messageDaoMock.getMessageListPageCount("INCORRECT_SEARCH_QUERY", 2);
        assertEquals(result, 0);
    }

    //tests for method getMessage(String messageId)
    @Test
    public void getMessageNullId() {
        Message result = messageDaoMock.getMessage(null);
        assertEquals(result, null);
    }

    @Test
    public void getMessageNormal() {
        Message result = messageDaoMock.getMessage("5bb86f18-6507-11e9-8b82-20474704b06e");
        assertEquals(result.getSubject(), "Test message");
    }

    @Test
    public void getMessageIncorrectId() {
        Message result = messageDaoMock.getMessage("INCORRECT_ID");
        assertEquals(result, null);
    }

    //tests for method getMessage(String messageId)
    @Test
    @Transactional
    @Rollback(true)
    public void deleteMessageNullId() {
        boolean result = messageDaoMock.deleteMessage(null);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteMessageNormal() {
        boolean result = messageDaoMock.deleteMessage("5bb86f18-6507-11e9-8b82-20474704b06e");
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteMessageIncorrectId() {
        boolean result = messageDaoMock.deleteMessage("INCORRECT_ID");
        assertEquals(result, false);
    }
}
