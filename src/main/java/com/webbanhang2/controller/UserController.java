/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.User;
import com.webbanhang2.service.UserService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author fkien
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    /**
     * Processes a Register form. Takes the username and password then tries to
     * insert into the database. Success/failure status is not returned for the
     * current time.
     *
     * @param user The User object with the requested Username/Password data
     * @return Redirects to Home, regardless of result.
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("login") User user) {
        System.out.println("processRegister with acc " + user.getUsername() + " - " + user.getPassword());
        System.out.println("Update result: " + userService.registerUser(user));
        return "redirect:home";
    }

    /**
     * Processes a Login form. Attempts to find an User object with the relevant
     * username/password, then binds it to the Session if found. Success/failure
     * status is not returned for the current time.
     *
     * @param request The Session's current HttpServletRequest object
     * @param user The User object with the requested Username/Password data
     * @return Redirects to Home, regardless of result.
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String processLogin(HttpServletRequest request,
            @ModelAttribute("login") User user) {
        System.out.println("processLogin with acc " + user.getUsername() + " - " + user.getPassword());
        user = userService.validateUser(user);
        request.getSession().setAttribute("user", user);
        return "redirect:home";
    }

    /**
     * Processes a Logout form. Unbinds the User object from the current
     * Session. Success/failure status is not returned for the current time.
     *
     * @param request The Session's current HttpServletRequest object
     * @return Redirects to Home, regardless of result.
     */
    @RequestMapping("/logout")
    public String processLogout(HttpServletRequest request) {
        System.out.println("processLogout");
        request.getSession().setAttribute("user", null);
        return "redirect:home";
    }

}
