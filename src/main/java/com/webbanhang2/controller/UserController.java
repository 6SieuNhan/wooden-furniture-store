/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.User;
import com.webbanhang2.service.EmailService;
import com.webbanhang2.service.UserService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author fkien
 */
@Controller
public class UserController {

    @Autowired
    EmailService emailService;

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
    public ModelAndView processRegister(@ModelAttribute("login") User user) {
        ModelAndView mav;
        //check duplicate email
        User test = userService.getUserByEmail(user.getEmail());
        if (test != null) {
            mav = new ModelAndView("register");
            mav.addObject("message", "There is already an account associated with this e-mail address.");
        } else {
            //check username
            test = userService.getUserByName(user.getUsername());
            if (test != null) {
                mav = new ModelAndView("register");
                mav.addObject("message", "There is already an account with this username.");
            }
            else{
                boolean result = userService.registerUser(user);
                mav = new ModelAndView("message");
                if(result){
                    mav.addObject("message", "Register successful, please login to continue.");
                }
                else{
                    mav.addObject("message", "An unfortunate error has happened; please try again later.");
                }
                
            }
        }
        return mav;
    }

    /**
     * Processes a Login form. Attempts to find an User object with the relevant
     * username/password, then binds it to the Session if found. Success/failure
     * status is not returned for the current time.
     *
     * @param request The Session's current HttpServletRequest object
     * @param user The User object with the requested Username/Password data
     * @return Redirects to Home if login is successful; returns to the Login
     * page if login failed.
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView processLogin(HttpServletRequest request,
            @ModelAttribute("login") User user) {
        user = userService.validateUser(user);
        if (user == null) {
            ModelAndView mav = new ModelAndView(WBHConstants.LOGIN_VIEW_NAME);
            mav.addObject("message", WBHConstants.LOGIN_FAIL_MESSAGE);
            return mav;
        } else {
            request.getSession().setAttribute("user", user);
            return new ModelAndView("redirect:home");
        }
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
        request.getSession().setAttribute("user", null);
        return "redirect:home";
    }

    /**
     * WIP
     *
     * @param email
     * @return
     */
    @RequestMapping("/requestrecovery")
    public ModelAndView sendRecoveryCode(@RequestParam(value = "recoveryemail", required = false) String email) {
        boolean success;
        if (email == null) {
            return new ModelAndView("redirect:home");
        } else {
            //Search for user by email
            User user = userService.getUserByEmail(email);
            if (user == null) {
                success = false;
            } else {
                //Generate recovery code
                String recoveryCode = userService.createRecoveryCode(user);
                //send email
                String to = "kienntse04792@fpt.edu.vn",
                        subject = "Password recovery for WebBanHang";
                String recoveryMessage = getRecoveryMessage(user, recoveryCode);

                System.out.println(recoveryMessage);
                boolean res = emailService.sendHTMLMessage(to, subject, recoveryMessage);
                System.out.println(res);
                success = res;
            }
        }
        if (success) {
            ModelAndView mav = new ModelAndView("message");
            mav.addObject("message", "An email with the password recovery link has been sent to your email account.");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("message2", "No user with matching email can be found in the database");
            return mav;
        }
    }

    @RequestMapping("/resetpasswordform")
    public String showResetPassword(@RequestParam(value = "userid", required = false) String userId,
            @RequestParam(value = "recovery", required = false) String recoveryCode) {
        if (userId == null || recoveryCode == null) {
            return "redirect:home";
        } else {
            boolean result = userService.validateRecovery(userId, recoveryCode);
            if (result) {
                return "resetpasswordform";
            } else {
                return "redirect:home";
            }
        }
    }

    @RequestMapping("/resetpassword")
    public ModelAndView processPasswordReset(@RequestParam(value = "userid", required = false) String userId,
            @RequestParam(value = "recovery", required = false) String recoveryCode,
            @RequestParam(value = "password1", required = false) String password) {
        if (userId == null || recoveryCode == null || password == null) {
            return new ModelAndView("redirect:home");
        } else {
            ModelAndView mav = new ModelAndView("message");
            boolean success = userService.resetPassword(userId, password);
            if (success) {
                mav.addObject("message", "Reset password successful. You will now be redirected to the home page.");
            } else {
                mav.addObject("message", "The server is currently experiencing some difficulties. You will now be redirected to the home page.");
            }
            return mav;
        }
    }

    @RequestMapping("/editaccinfo")
    public ModelAndView processEditAccInfo(@ModelAttribute("login") User user, HttpServletRequest request, RedirectAttributes redir) {
        //validation
        ModelAndView mav = new ModelAndView("redirect:dashboard");
        User valid = userService.validateUser(user);
        if (valid == null) {
            redir.addFlashAttribute("message", "Inputted password is not valid; please try again.");
        } else {
            //set user Id
            User current = (User)request.getSession().getAttribute("user");
            user.setUserId(current.getUserId());
            boolean result = userService.editUser(user);
            //we do something?
            if (result) {
                redir.addFlashAttribute("message", "Edit successful.");
            } else {
                redir.addFlashAttribute("message", "Edit failed due to server having encounted an error.");
            }
            //reset user info
            user = userService.validateUser(user);
            request.getSession().setAttribute("user", user);
        }
        return mav;
    }

    @RequestMapping("/editpassword")
    public ModelAndView processEditPassword(@ModelAttribute("login") User user,
            @RequestParam(value = "password1", required = false) String newPassword,
            HttpServletRequest request, RedirectAttributes redir) {
        ModelAndView mav = new ModelAndView("redirect:dashboard?action=editpassword");
        User valid = userService.validateUser(user);
        if (valid == null) {
            redir.addFlashAttribute("message", "Inputted password is not valid; please try again.");
        } else {
            boolean result = userService.resetPassword(user.getUserId(), newPassword);
            //we do something?
            if (result) {
                redir.addFlashAttribute("message", "Edit successful.");
            } else {
                redir.addFlashAttribute("message", "Edit failed due to server having encounted an error.");
            }
        }
        return mav;

    }

    String getRecoveryMessage(User user, String recoveryCode) {
        return "<div>\n"
                + "            This mail was sent because somebody request a recovery email on this account<br/>\n"
                + "            The following link should be valid until another recovery request with the same email address is created<br/>\n"
                + "            Do not mark this as spam.<br/>\n"
                + "            <a href=\""
                + WBHConstants.ROOT_URL + "/resetpasswordform?userid=" + user.getUserId() + "&recovery=" + recoveryCode
                + "\">Recovery link</a> \n"
                + "        </div>\n";
    }
}
