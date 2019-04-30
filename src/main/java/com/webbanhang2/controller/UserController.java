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
            mav.addObject("message", "Đã có một người dùng khác với tài khoản email này rồi.");
        } else {
            //check username
            test = userService.getUserByName(user.getUsername());
            if (test != null) {
                mav = new ModelAndView("register");
                mav.addObject("message", "Đã có một người dùng khác với tên đăng nhập này rồi");
            } else {
                boolean result = userService.registerUser(user);
                mav = new ModelAndView("message");
                if (result) {
                    mav.addObject("message", "Đăng ký tài khoản thành công; bạn vui lòng đăng nhập để tiếp tục.");
                } else {
                    mav.addObject("message", "Đã có lỗi xảy ra trong quá trình đăng ký, xin mời bạn thử lại sau.");
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
        user = userService.getUser(user);
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
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/requestrecovery")
    public ModelAndView sendRecoveryCode(@RequestParam(value = "recoveryemail", required = false) String email, RedirectAttributes redirectAttributes) {
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
                String to = email,
                        subject = "Về việc đặt lại mật khẩu ở cửa hàng đồ gỗ Thủy Hằng";
                String recoveryMessage = getRecoveryMessage(user, recoveryCode);

                System.out.println(recoveryMessage);
                boolean res = emailService.sendHTMLMessage(email, subject, recoveryMessage);
                System.out.println(res);
                success = res;
            }
        }
        if (success) {
            ModelAndView mav = new ModelAndView("message");
            mav.addObject("message", "Yêu cầu đặt lại mật khẩu đã được ghi nhận; bạn hãy kiểm tra tài khoản email của mình để nhận link đặt lại mật khẩu");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("redirect:login");
            redirectAttributes.addFlashAttribute("message2", "Không tìm được tài khoản nào có email tương ứng");
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
            boolean success = userService.changePassword(userId, password);
            if (success) {
                mav.addObject("message", "Thay đổi mật khẩu thành công; bạn vui lòng đăng nhập để tiếp tục.");
            } else {
                mav.addObject("message", "Đã có lỗi xảy ra trong quá trình đặt lại mật khẩu, xin mời bạn thử lại sau.");
            }
            return mav;
        }
    }

    @RequestMapping("/editaccinfo")
    public ModelAndView processEditAccInfo(@ModelAttribute("login") User user, HttpServletRequest request, RedirectAttributes redir) {
        //validation
        ModelAndView mav = new ModelAndView("redirect:dashboard");
        User valid = userService.getUser(user);
        if (valid == null) {
            redir.addFlashAttribute("message", "Mật khẩu không đúng, xin mời bạn thử lại.");
        } else {
            //set user Id
            User current = (User) request.getSession().getAttribute("user");
            user.setUserId(current.getUserId());
            boolean result = userService.editUser(user);
            //we do something?
            if (result) {
                redir.addFlashAttribute("message", "Thay đổi thông tin tài khoản thành công.");
            } else {
                redir.addFlashAttribute("message", "Đã có lỗi xảy ra trong quá trình thay đổi thông tin tài khoản, xin mời bạn thử lại sau.");
            }
            //reset user info
            user = userService.getUser(user);
            request.getSession().setAttribute("user", user);
        }
        return mav;
    }

    @RequestMapping("/editaccinfoadmin")
    public ModelAndView processEditAccInfoAdmin(@ModelAttribute("login") User user2,
            @RequestParam(value = "userRoleId", required = false) Integer userRoleId,
            HttpServletRequest request, RedirectAttributes redir) {

        //admin validation
        User current = (User) request.getSession().getAttribute("user");
        if (current == null || current.getUserRoleId() != User.ADMIN) {
            return new ModelAndView("redirect:home");
        } else {
            ModelAndView mav = new ModelAndView("redirect:dashboard?action=accountinfo&userid=" + user2.getUserId());
            if(userRoleId!= null && userRoleId != 0){
                user2.setUserRoleId(userRoleId);
            }
            boolean result = userService.editUser(user2);
            //we do something?
            if (result) {
                redir.addFlashAttribute("message", "Thay đổi thông tin tài khoản thành công.");
            } else {
                redir.addFlashAttribute("message", "Đã có lỗi xảy ra trong quá trình thay đổi thông tin tài khoản, xin mời bạn thử lại sau.");
            }
            //in case user2 = current
            if(user2.getUserId().equals(current.getUserId())){
                current = userService.getUser(current);
                request.getSession().setAttribute("user",current);
            }
            return mav;
        }
        
    }

    @RequestMapping("/editpassword")
    public ModelAndView processEditPassword(@ModelAttribute("login") User user,
            @RequestParam(value = "password1", required = false) String newPassword,
            HttpServletRequest request, RedirectAttributes redir) {
        ModelAndView mav = new ModelAndView("redirect:dashboard?action=editpassword");
        User valid = userService.getUser(user);
        if (valid == null) {
            redir.addFlashAttribute("message", "Mật khẩu cũ không đúng, xin mời bạn thử lại.");
        } else {
            boolean result = userService.changePassword(user.getUserId(), newPassword);
            //we do something?
            if (result) {
                redir.addFlashAttribute("message", "Thay đổi mật khẩu thành công.");
            } else {
                redir.addFlashAttribute("message", "Đã có lỗi xảy ra trong quá trình thay đổi mật khẩu, xin mời bạn thử lại sau.");
            }
        }
        return mav;

    }

    String getRecoveryMessage(User user, String recoveryCode) {
        StringBuilder sb = new StringBuilder();
        sb.append("<div>\n");
        sb.append("            Chúng tôi xin phép được gửi bạn link để đặt lại mật khẩu tài khoản của bạn tại cửa hàng đồ gỗ Thủy Hằng.<br/>\n");
        sb.append("            Nếu có vấn đề gì, xin mời bạn liên hệ với chúng tôi qua trang web, hoặc trực tiếp qua mail.<br/>\n");
        
        sb.append("        <div> <a href=\"");
        sb.append(WBHConstants.ROOT_URL);
        sb.append("/resetpasswordform?userid=");
        sb.append(user.getUserId());
        sb.append("&recovery=");
        sb.append(recoveryCode);
        sb.append("\">Link đặt lại mật khẩu</a> </div>");
        sb.append("<br/>\n");
        
        //contact
        sb.append("<div>\n");
        sb.append("Cửa hàng đồ gỗ Thủy Hằng<br/>\n");
        sb.append("Website: <a href=\"");
        sb.append(WBHConstants.ROOT_URL);
        sb.append("\"> ");
        sb.append(WBHConstants.ROOT_URL);
        sb.append("\"</a><br/>\n");
        sb.append("Email: ");
        sb.append(WBHConstants.MAIL_SENDER_ADDRESS);
        sb.append("<br/>");
        sb.append("Số 2, Kho Sau - Van Diem - Thuong Tin - Ha Noi<br/>");
        sb.append("0347545020 - 0913076724<br/>");
        sb.append("+1 888 888 4444<br/>");
        sb.append("</div>\n");
        
        return sb.toString();
        
        
    }
}
