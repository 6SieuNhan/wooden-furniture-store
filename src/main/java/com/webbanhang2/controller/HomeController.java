/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.ProductService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * This controller handles all generic URL requests such as www.webbanhang.com/
 * or www.webbanhang.com/home, as well as all the session object required to
 * create forms.
 *
 * @author fkien
 */
@Controller

@SessionAttributes("login")
public class HomeController {

    @Autowired
    ProductService productService;

    /**
     * Sets up the login model attribute, to be used by various forms requiring
     * an User model, such as: + The Login and Register form on header.jsp + The
     * Password recovery form (upcoming)
     *
     * @return An empty User object for the login model.
     */
    @ModelAttribute("login")
    public User setUpUserForm() {
        return new User();
    }

    /**
     * Shows the index.jsp form.
     *
     * @return The String 'index', signaling the dispatcher to show the
     * index.jsp form.
     */
    @RequestMapping({"/", "home"})
    public String showIndex() {
        //Console print line, just for tracking purpose.
        System.out.println("showIndex");
        //Only the name of the jsp is needed, DispatcherServlet knows what to do.
        return "index";
    }

    @RequestMapping({"productlist"})
    public ModelAndView showProductList() {
        System.out.println("showProductList");
        ModelAndView mav = new ModelAndView("productlist");
            List<Product> productList = productService.getProductList(0, 15);
        if (productList.size() > 0) {
            for (Product p : productList) {
                System.out.println(p.getProductName());
                System.out.println(p.getThumbnail());
            }
        }
        mav.addObject("productList", productList);
        return mav;
    }
    
    @RequestMapping({"product"})
    public ModelAndView showProduct(@RequestParam("productid") String productId){
        System.out.println("showProduct with productId = "+productId);
        Product p = productService.getProduct(productId);
        System.out.println(p==null);
        ModelAndView mav = new ModelAndView("product");
        mav.addObject("product", p);
        return mav;
    }

}
