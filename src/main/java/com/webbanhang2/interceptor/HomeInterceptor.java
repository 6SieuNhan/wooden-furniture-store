/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.interceptor;

import com.webbanhang2.model.Category;
import com.webbanhang2.model.Message;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author fkien
 */
public class HomeInterceptor extends HandlerInterceptorAdapter {
    
    @Autowired
    CategoryService categoryService;
    
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {
        //do session attribute stuff
        System.out.println("Inside pre handle");
        HttpSession session = request.getSession();
        if(session.getAttribute("login")==null){
            session.setAttribute("login", new User());
        }
        return true;
    }

}
