/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Order;
import com.webbanhang2.model.Product;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 *
 * @author fkien
 */
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    public JavaMailSender emailSender;

    @Override
    public boolean sendSimpleMessage(String to, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);
            emailSender.send(message);
            return true;
        } catch (MailException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean sendHTMLMessage(String to, String subject, String text) {
        try {
            MimeMessage mimeMessage = emailSender.createMimeMessage();
            mimeMessage.setContent(text, "text/html");
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
            helper.setTo(to);
            helper.setSubject(subject);
            emailSender.send(mimeMessage);
            return true;
        } catch (MailException | MessagingException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
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
            s += "<td>" + (i+1) + "</td>\n";
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
