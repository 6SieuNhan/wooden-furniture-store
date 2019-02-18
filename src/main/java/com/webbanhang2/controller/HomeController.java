/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author fkien
 */
@Controller

@SessionAttributes("login")
public class HomeController {
    @ModelAttribute("login")
    public User setUpUserForm() {
        return new User();
    }
    
    @RequestMapping({"/","home"})
    public String showIndex() {
        System.out.println("showIndex");
        return "index";
    }
}
