/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.User;
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
public class UserDaoTest extends TestCase {

    @Autowired
    private UserDao userDaoMock;

    @Autowired
    WebApplicationContext webApplicationContext;

    User getMockUserRegister() {
        User test = new User();
        test.setUsername("andoan97");
        test.setPassword("abcde");
        test.setEmail("andoann97@gmail.com");
        test.setAddress("Lorem ipsum dolor sit amet, consectetur adipiscing elit");
        test.setPhone("123456789");
        return test;
    }
    
    User getMockUserEdit() {
        User test = new User();
        test.setUserId("defe4bf4-38cc-11e9-97d5-20474704b06e");
        test.setUsername("admin1");
        test.setPassword("12341234");
        test.setEmail("andoann97@gmail.com");
        test.setAddress("Lorem ipsum dolor sit amet, consectetur adipiscing elit");
        test.setPhone("123456789");
        return test;
    }

    //Tests for registerUser()
    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullAll() {
        User test = new User();
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullUsername() {
        User test = getMockUserRegister();
        test.setUsername(null);
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullPassword() {
        User test = getMockUserRegister();
        test.setPassword(null);
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullEmail() {
        User test = getMockUserRegister();
        test.setEmail(null);
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullAddress() {
        User test = getMockUserRegister();
        test.setAddress(null);
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNullPhone() {
        User test = getMockUserRegister();
        test.setPhone(null);
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserDupUsername() {
        User test = getMockUserRegister();
        test.setUsername("admin1");
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserDupEmail() {
        User test = getMockUserRegister();
        test.setEmail("admin1@gmail.com");
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void registerUserNormal() {
        User test = getMockUserRegister();
        boolean result = userDaoMock.registerUser(test);
        assertEquals(result, true);
    }

    //test for getUser()
    //Use account: (defe4bf4-38cc-11e9-97d5-20474704b06e, admin1, 123123)
    @Test
    public void getUserIncorrectAll() {
        User test = new User();
        test.setUsername("INCORRECT_USERNAME");
        test.setPassword("INCORRECT_PASSWORD");
        User result = userDaoMock.getUser(test);
        assertEquals(result, null);
    }

    @Test
    public void getUserIncorrectUsername() {
        User test = new User();
        test.setUsername("INCORRECT_USERNAME");
        test.setPassword("123123");
        User result = userDaoMock.getUser(test);
        assertEquals(result, null);
    }

    @Test
    public void getUserIncorrectPassword() {
        User test = new User();
        test.setUsername("admin1");
        test.setPassword("INCORRECT_PASSWORD");
        User result = userDaoMock.getUser(test);
        assertEquals(result, null);
    }

    @Test
    public void getUserCorrect() {
        User test = new User();
        test.setUsername("admin1");
        test.setPassword("123123");
        User result = userDaoMock.getUser(test);
        assertEquals(result.getUserId(), "defe4bf4-38cc-11e9-97d5-20474704b06e");
    }

    //tests for getUserByName(String username)
    //Use account: (defe4bf4-38cc-11e9-97d5-20474704b06e, admin1)
    @Test
    public void getUserByNameIncorrect() {
        User result = userDaoMock.getUserByName("admin1234");
        assertEquals(result, null);
    }

    @Test
    public void getUserByNameCorrect() {
        User result = userDaoMock.getUserByName("admin1");
        assertEquals(result.getUserId(), "defe4bf4-38cc-11e9-97d5-20474704b06e");
    }

    //tests for getUserByEmail(String email)
    //Use account: (defe4bf4-38cc-11e9-97d5-20474704b06e, admin1@gmail.com)
    @Test
    public void getUserByEmailIncorrect() {
        User result = userDaoMock.getUserByEmail("admin1234@gmail.com");
        assertEquals(result, null);
    }

    @Test
    public void getUserByEmailCorrect() {
        User result = userDaoMock.getUserByEmail("admin1@gmail.com");
        assertEquals(result.getUserId(), "defe4bf4-38cc-11e9-97d5-20474704b06e");
    }

    //tests for getUserByEmail(String email)
    //Uses account: defe4bf4-38cc-11e9-97d5-20474704b06e
    @Test
    @Transactional
    @Rollback(true)
    public void createRecoveryCodeIncorrect() {
        User test = new User();
        test.setUserId("GARBAGE_USER_ID");
        String result = userDaoMock.createRecoveryCode(test);
        assertEquals(result, null);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void createRecoveryCodeCorrect() {
        User test = new User();
        test.setUserId("defe4bf4-38cc-11e9-97d5-20474704b06e");
        String result = userDaoMock.createRecoveryCode(test);
        assertEquals((result.length() > 0), true);
    }

    //test for  public boolean validateRecovery(String userId, String recoveryCode)
    //Use account: defe4bf4-38cc-11e9-97d5-20474704b06e, test_recovery_code
    @Test
    @Transactional
    @Rollback(true)
    public void validateRecoveryIncorrectAll() {
        boolean result = userDaoMock.validateRecovery("WRONG_USER_ID", "WRONG_RECOVERY_CODE");
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void validateRecoveryIncorrectUserId() {
        boolean result = userDaoMock.validateRecovery("WRONG_USER_ID", "test_recovery_code");
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void validateRecoveryIncorrectRecoveryCode() {
        boolean result = userDaoMock.validateRecovery("defe4bf4-38cc-11e9-97d5-20474704b06e", "WRONG_RECOVERY_CODE");
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void validateRecoveryCorrect() {
        boolean result = userDaoMock.validateRecovery("defe4bf4-38cc-11e9-97d5-20474704b06e", "test_recovery_code");
        assertEquals(result, true);
    }
    
    //tests for resetPassword(String userId, String password)
    //Use account: defe4bf4-38cc-11e9-97d5-20474704b06e, testpassword
    @Test
    @Transactional
    @Rollback(true)
    public void resetPasswordNullAll(){
        boolean result = userDaoMock.changePassword(null, null);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void resetPasswordNullUser(){
        boolean result = userDaoMock.changePassword(null, "testpassword");
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void resetPasswordNullPassword(){
        boolean result = userDaoMock.changePassword("defe4bf4-38cc-11e9-97d5-20474704b06e", null);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void resetPasswordCorrect(){
        boolean result = userDaoMock.changePassword("defe4bf4-38cc-11e9-97d5-20474704b06e", "testpassword");
        assertEquals(result, true);
    }
    
    //tests for editUser(User user)
    //Use account: defe4bf4-38cc-11e9-97d5-20474704b06e
    @Test
    @Transactional
    @Rollback(true)
    public void editUserNullAll(){
        User test = new User();
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void editUserNullUserId(){
        User test = getMockUserEdit();
        test.setUserId(null);
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void editUserNullEmail(){
        User test = getMockUserEdit();
        test.setEmail(null);
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void editUserNullAddress(){
        User test = getMockUserEdit();
        test.setAddress(null);
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void editUserNullPhone(){
        User test = getMockUserEdit();
        test.setPhone(null);
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, false);
    }
    
    @Test
    @Transactional
    @Rollback(true)
    public void editUserCorrect(){
        User test = getMockUserEdit();
        boolean result = userDaoMock.editUser(test);
        assertEquals(result, true);
    }
    
}
