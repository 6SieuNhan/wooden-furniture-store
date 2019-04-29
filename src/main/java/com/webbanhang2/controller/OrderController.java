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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        for(Product p:checkoutList){
            System.out.println(p.getProductName());
        }
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
            mav.addObject("message", "Đơn hàng của bạn đã được ghi lại; xin mời bạn hãy kiểm tra địa chỉ email của mình để nhận link xác nhận đơn hàng.");
        } else {
            mav.addObject("message", "Có lỗi đã xảy ra trong việc ghi lại đơn hàng; xin mời bạn thử lại sau.");
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
            mav.addObject("message", "Xác nhận đơn hàng thành công.");
        } else {
            mav.addObject("message", "Xác nhận đơn hàng không thành công; bạn hãy trực tiếp liên hệ qua email hoặc trang Liên Hệ để thông báo với chúng tôi về vấn đề này.");
        }
        return mav;
    }

    @RequestMapping(value = "changeorderstatus")
    public ModelAndView changeOrderStatus(@RequestParam(value = "orderid", required = false) String orderId,
            @RequestParam(value = "orderstatusid", required = false) Integer orderStatusId,
            HttpServletRequest request) {
        //validation stuff
        User user = (User) request.getSession().getAttribute("user");
        if (user.getUserRoleId() != User.ADMIN || orderId == null || orderId.isEmpty() || orderStatusId == null) {
            return new ModelAndView("redirect:home");
        } else {
            boolean result = orderService.changeOrderStatus(orderId, orderStatusId);
            //do something with the result?
            ModelAndView mav = new ModelAndView("redirect:dashboard?action=orderdetail&orderid=" + orderId);
            return mav;
        }
    }

    @RequestMapping(value = "deleteorder")
    public ModelAndView deleteOrder(@RequestParam(value = "orderid", required = false) String orderId,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {
        //validation stuff
        //user: Can only delete pending order (orders in Unverified and Verified statuses,
        //belonging to the user in question
        //admin: Can always delete order
        User user = (User) request.getSession().getAttribute("user");
        boolean allow = false;
        if (user.getUserRoleId() == User.ADMIN) {
            allow = true;
        } else {
            Order o = orderService.getOrder(orderId);
            if ((o.getOrderStatusId().equals("1") || o.getOrderStatusId().equals("2"))
                    && o.getUserId().equals(user.getUserId())) {
                allow = true;
            }
        }
        if (allow) {
            boolean res = orderService.deleteOrder(orderId);
            if(res){
                redirectAttributes.addFlashAttribute("message", "Xóa đơn hàng thành công.");
            }
            else{
                redirectAttributes.addFlashAttribute("message", "Có lỗi trong việc xóa đơn hàng; xin mời bạn thử lại sau.");
            }
        }
        //do something if delete fails?
        return new ModelAndView("redirect:dashboard?action=order");
    }

    public String getCheckoutMailMessage(HttpServletRequest request, List<Product> items, Order order) {
        int total = 0;

        StringBuilder sb = new StringBuilder();
        sb.append("<div>\n");
        sb.append("            This is a test message for WebBanHang.<br/>\n");
        sb.append("            This message is included with a copy of the receipt of the latest purchase attempt <br/>\n");
        sb.append("            Do not mark this as spam.\n");
        sb.append("        </div>\n");
        sb.append("        <table>\n");
        sb.append("            <tr>\n");
        sb.append("                <th>SL No.</th>\n");
        sb.append("                <th>Product</th>\n");
        sb.append("                <th>Quantity</th>\n");
        sb.append("                <th>Price</th>\n");
        sb.append("                <th>Product total</th>\n");
        sb.append("            </tr>\n");
        for (int i = 0; i < items.size(); i++) {
            Product item = items.get(i);
            total += item.getPrice() * item.getQuantity();
            sb.append("<tr>\n");
            sb.append("<td>");
            sb.append((i + 1));
            sb.append("</td>\n");
            sb.append("<td>");
            sb.append(item.getProductName());
            sb.append("</td>\n");
            sb.append("<td>");
            sb.append(item.getQuantity());
            sb.append("</td>\n");
            sb.append("<td>");
            sb.append(item.getPrice());
            sb.append("</td>\n");
            sb.append("<td>");
            sb.append(item.getPrice() * item.getQuantity());
            sb.append("</td>\n");
            sb.append("</tr>\n");
        }
        sb.append("</table>\n");
        sb.append("<div> Total: ");
        sb.append(total);
        sb.append("đ </div>\n");
        sb.append("        <div> <a href=\"");
        sb.append("<div> Total: ");
        sb.append(total);
        sb.append("đ </div>\n");
        sb.append("        <div> <a href=\"");
        sb.append(WBHConstants.ROOT_URL);
        sb.append("/validate?orderid=");
        sb.append(order.getOrderId());
        sb.append("&validation=");
        sb.append(order.getValidationCode());
        sb.append("\">Validation link</a> </div>");
        sb.append("        <div>Copyright never.</div>");
        return sb.toString();
    }
}
