/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Order;
import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import com.webbanhang2.service.OrderService;
import com.webbanhang2.service.ProductService;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author fkien
 */
@Controller
public class DashboardController {
    
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    OrderService orderService;
    
    @RequestMapping("dashboard?action=productlist")
    public ModelAndView showProductList(
            @RequestParam(value = "searchquery", required = false) String searchQuery,
            @RequestParam(value = "productcategoryid", required = false) List<String> productCategoryIds,
            @RequestParam(value = "productmaterialid", required = false) List<String> productMaterialIds,
            @RequestParam(value = "productoriginid", required = false) List<String> productOriginIds,
            @RequestParam(value = "productroomid", required = false) List<String> productRoomIds,
            @RequestParam(value = "minprice", required = false) Double minPrice,
            @RequestParam(value = "maxprice", required = false) Double maxPrice,
            @RequestParam(value = "page", required = false) Integer page,
            HttpServletRequest request
    ) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return new ModelAndView("redirect:home");
        }

        //Pack the params into a hashmap
        HashMap<String, Object> params = new HashMap<>();
        params.put("searchQuery", searchQuery);
        params.put("productCategoryId", productCategoryIds);
        params.put("productMaterialId", productMaterialIds);
        params.put("productOriginId", productOriginIds);
        params.put("productRoomId", productRoomIds);
        params.put("minPrice", minPrice);
        params.put("maxPrice", maxPrice);

        if (page == null) {
            page = 1;
        }
        List<Product> productList = productService.getProductListForAdmin(params, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
        int pageCount = productService.getProductListPageCount(params, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
        ModelAndView mav = new ModelAndView("dashboardadmin_productlist");
        mav.addObject("productList", productList);
        mav.addObject("pageCount", pageCount);
        mav.addObject("pm", "fontBold");
        return mav;
    }
    
    
    
}
