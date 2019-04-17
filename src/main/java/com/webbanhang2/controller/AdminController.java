/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import com.webbanhang2.service.ProductService;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Đào Minh Quang
 */
@Controller
public class AdminController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("adminpage")
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
        ModelAndView mav = new ModelAndView("adminpage");
        mav.addObject("productList", productList);
        mav.addObject("pageCount", pageCount);
        mav.addObject("pm", "fontBold");
        return mav;
    }

    private String formProduct(Model model, Product p) {
        model.addAttribute("productForm", p);
        model.addAttribute("pm", "fontBold");
        if (p.getProductId() == null || p.getProductCode() == null) {
            model.addAttribute("formTitle", "Thêm mới");
        } else {
            model.addAttribute("formTitle", "Sửa sản phẩm");
        }

        return "dashboardadmin_formproduct";
    }

    @RequestMapping("/createProduct")
    public String createProduct(Model model, HttpServletRequest request) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return "redirect:home";
        }
        Product p = new Product();
        return this.formProduct(model, p);
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "productid", required = false) String productId, HttpServletRequest request) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return "redirect:home";
        }
        if (productId != null) {
            productService.deleteProduct(productId);
        }
        return "redirect:dashboard?action=productlist";
    }

    @RequestMapping(value = "edit")
    public String editProduct(Model model, @RequestParam(value = "productid", required = false) String productId, HttpServletRequest request) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return "redirect:home";
        }
        if (productId == null) {
            return "redirect:dashboard?action=productlist";
        } else {
            Product p = productService.getProduct(productId);
            return this.formProduct(model, p);
        }
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(Model model, //
            @ModelAttribute("productForm") @Validated Product p, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes,
            HttpServletRequest request) {
        //Authorization
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return "redirect:home";
        }
        // Nếu validate có lỗi.
        if (result.hasErrors()) {
            return this.formProduct(model, p);
        }
        boolean saveResult = this.productService.saveProduct(p);

        //case of insertion fail (most likely due to duplicate key)
        if (saveResult) {
            // Add message to flash scope
            redirectAttributes.addFlashAttribute("message", "Save Product Successful");

            return "redirect:dashboard?action=productlist"; 
        } else {
            redirectAttributes.addFlashAttribute("message", "Duplicate product code");
            if(p.getProductId()==null||p.getProductId().isEmpty()){
                return "redirect:createProduct";
            }
            else{
                return "redirect:edit?productid="+p.getProductId();
            }
        }
        // Important!!: Need @EnableWebMvc

    }

}
