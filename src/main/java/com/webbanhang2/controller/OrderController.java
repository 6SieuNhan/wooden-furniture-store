/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.EmailService;
import com.webbanhang2.service.OrderService;
import java.util.List;
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
public class OrderController {

    @Autowired
    EmailService emailService;

    @Autowired
    OrderService orderService;

    private String checkoutMailMessage;

    @RequestMapping(value = "docheckout")
    public ModelAndView doCheckout(HttpServletRequest request, @ModelAttribute("login") User user,
            @RequestParam(value = "paymentmethodid") Integer paymentMethodId
    ) {
        //Order detail is stored in session attribute
        List<Product> checkoutList = (List<Product>) request.getSession().getAttribute("checkoutList");
        if (checkoutList == null || checkoutList.isEmpty()) {
            return new ModelAndView("redirect:home");
        }
        //Get user ID from logged in; this is important for identifying order later on
        User loggedIn = (User) request.getSession().getAttribute("user");
        if (loggedIn != null && !loggedIn.getUserId().isEmpty()) {
            user.setUserId(loggedIn.getUserId());
        }
        //Dump order into db
        Order order = orderService.addOrder(checkoutList, user, paymentMethodId);
        //Send email
        String to = user.getEmail(),
                subject = "Test message for WebBanHang";
        checkoutMailMessage = getCheckoutMailMessage(request, checkoutList, order);
        System.out.println(checkoutMailMessage);
        boolean res = emailService.sendHTMLMessage(to, subject, checkoutMailMessage);
        System.out.println(res);
        //Return message view
        ModelAndView mav = new ModelAndView("message");
        if (res) {
            mav.addObject("message", "Mail sent");
        } else {
            mav.addObject("message", "Mail send failed");
        }
        return mav;
    }

    @RequestMapping(value = "validate")
    public ModelAndView doValidate(@RequestParam(value = "orderid", required = false) String orderId,
            @RequestParam(value = "validation", required = false) String validationCode) {
        boolean res;
        if (orderId == null || validationCode == null) {
            res = false;
        } else {
            res = orderService.validateOrder(orderId, validationCode);
        }
        ModelAndView mav = new ModelAndView("message");
        if (res) {
            mav.addObject("message", "Validation successful");
        } else {
            mav.addObject("message", "Validation failed");
        }
        return mav;
    }
    
    @RequestMapping(value = "changeorderstatus")
    public ModelAndView changeOrderStatus(@RequestParam(value = "orderid", required = false) String orderId,
            @RequestParam(value = "orderstatusid", required = false) Integer orderStatusId,
            HttpServletRequest request){
        //validation stuff
        User user = (User) request.getSession().getAttribute("user");
        if(user.getUserRoleId()!=User.ADMIN || orderId==null || orderId.isEmpty() || orderStatusId == null){
            return new ModelAndView("redirect:home");
        }
        else{
            boolean result = orderService.changeOrderStatus(orderId, orderStatusId);
            //do something with the result?
            ModelAndView mav = new ModelAndView("redirect:dashboard?action=orderdetail&orderid="+orderId);
            return mav;
        }
    }

    @RequestMapping(value = "deleteorder")
    public ModelAndView deleteOrder(@RequestParam(value = "orderid", required = false) String orderId,
            HttpServletRequest request) {
        //validation stuff
        //user: Can only delete pending order (orders in Unverified and Verified statuses,
        //belonging to the user in question
        //admin: Can always delete order
        User user = (User) request.getSession().getAttribute("user");
        boolean allow = false;
        if (user.getUserRoleId() == User.ADMIN) {
            allow = true;
        }
        else{
            Order o = orderService.getOrder(orderId);
            if((o.getOrderStatusId().equals("1")||o.getOrderStatusId().equals("2"))
                    && o.getUserId().equals(user.getUserId())){
                allow = true;
            }
        }
        if(allow){
            boolean res = orderService.deleteOrder(orderId);
        }
            //do something if delete fails?
        return new ModelAndView("redirect:dashboard?action=order");
    }

    public String getCheckoutMailMessage(HttpServletRequest request, List<Product> items, Order order) {
        String s = "<div>\n"
                + "            This is a test message for WebBanHang.<br/>\n"
                + "            This message is included with a copy of the receipt of the latest purchase attempt <br/>\n"
                + "            Do not mark this as spam.\n"
                + "        </div>\n"
                + "        <table>\n"
                + "            <tr>\n"
                + "                <th>SL No.</th>\n"
                + "                <th>Product</th>\n"
                + "                <th>Quantity</th>\n"
                + "                <th>Price</th>\n"
                + "            </tr>";
        for (int i = 0; i < items.size(); i++) {
            Product item = items.get(i);
            s += "<tr>\n";
            s += "<td>" + (i + 1) + "</td>\n";
            s += "<td>" + item.getProductName() + "</td>\n";
            s += "<td>" + item.getQuantity() + "</td>\n";
            s += "<td> $" + item.getPrice() + "</td>\n";
            s += "</tr>\n";
        }
        s += "</table>\n"
                + "        <div> <a href=\""
                + WBHConstants.ROOT_URL + "/validate?orderid=" + order.getOrderId() + "&validation=" + order.getValidationCode()
                + "\">Validation link</a> </div>"
                + "        <div>Copyright never.</div>";
        return s;
    }
}
