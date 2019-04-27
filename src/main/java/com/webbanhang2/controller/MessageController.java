/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.Message;
import com.webbanhang2.model.User;
import com.webbanhang2.service.MessageService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author fkien
 */
@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("/sendcontactmessage")
    public ModelAndView processMessage(@ModelAttribute("message") Message message) {
        //bogus request
        if (message == null) {
            return new ModelAndView("redirect:home");
        } else {
            //start the insert
            boolean result = messageService.addMessage(message);
            ModelAndView mav = new ModelAndView("message");
            if (result) {
                mav.addObject("message", "Your enquiry has been recorded. You will now be redirected to homepage.");
            } else {
                mav.addObject("message", "An error has occured. You will now be redirected to homepage.");
            }
            return mav;
        }
    }

    @RequestMapping("/deletemessage")
    public ModelAndView deleteMessage(@RequestParam(value = "messageid", required = false) String messageId,
            HttpServletRequest request) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return new ModelAndView("redirect:home");
        }
        ModelAndView mav;
        boolean result = messageService.deleteMessage(messageId);
        //do something for result?
        mav = new ModelAndView("redirect:dashboard?action=messagelist");
        if (result) {
            mav.addObject("message", "Delete successful");
        } else {
            mav.addObject("message", "Delete failed");
        }
        return mav;
    }
}
