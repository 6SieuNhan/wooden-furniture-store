/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.Category;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import com.webbanhang2.service.ProductService;
import java.util.HashMap;
import java.util.List;
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

@SessionAttributes(value = {"login", "productMaterialList", "productOriginList", "productTypeList"})
public class HomeController {

    public static final int PAGE_SIZE = 15;

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

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
     * Sets up the Product Material category list. This list will be used for
     * various purposes, such as populating the Product dropdown list and the
     * Search menu.
     *
     * @return A list containing all the categories in the Material list
     */
    @ModelAttribute("productMaterialList")
    public List<Category> setUpProductMaterialList() {
        List<Category> pml = categoryService.getCategoryList(Category.PRODUCT_MATERIAL);
        return pml;
    }

    /**
     * Sets up the Product Origin category list. This list will be used for
     * various purposes, such as populating the Product dropdown list and the
     * Search menu.
     *
     * @return A list containing all the categories in the Origin list
     */
    @ModelAttribute("productOriginList")
    public List<Category> setUpProductOriginList() {
        return categoryService.getCategoryList(Category.PRODUCT_ORIGIN);
    }

    /**
     * Sets up the Product Type category list. This list will be used for
     * various purposes, such as populating the Product dropdown list and the
     * Search menu.
     *
     * @return A list containing all the categories in the Type list
     */
    @ModelAttribute("productTypeList")
    public List<Category> setUpProductTypeList() {
        return categoryService.getCategoryList(Category.PRODUCT_TYPE);
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

    /**
     * Shows the product list page. Can take a number of (optional) search
     * parameters, such as search query, product category IDs, min/max price.
     *
     * @param searchQuery
     * @param productTypeIds
     * @param productMaterialIds
     * @param productOriginIds
     * @param minPrice
     * @param maxPrice
     * @return A ModelAndView for productlist.jsp, along with the relevant
     * product list and page count (for pagination purpose)
     */
    @RequestMapping({"productlist"})
    public ModelAndView showProductList(
            @RequestParam(value = "searchquery", required = false) String searchQuery,
            @RequestParam(value = "producttypeid", required = false) List<String> productTypeIds,
            @RequestParam(value = "productmaterialid", required = false) List<String> productMaterialIds,
            @RequestParam(value = "productoriginid", required = false) List<String> productOriginIds,
            @RequestParam(value = "minprice", required = false) Double minPrice,
            @RequestParam(value = "maxprice", required = false) Double maxPrice
    ) {
        //Prints stuff to console
        System.out.println("showProductList");

        //Pack the params into a hashmap
        HashMap<String, Object> params = new HashMap<>();
        params.put("searchQuery", searchQuery);
        params.put("productTypeId", productTypeIds);
        params.put("productMaterialId", productMaterialIds);
        params.put("productOriginId", productOriginIds);
        params.put("minPrice", minPrice);
        params.put("maxPrice", maxPrice);

        List<Product> productList = productService.getProductList(params, 0, PAGE_SIZE);
        int pageCount = productService.getProductListPageCount(params, PAGE_SIZE);
        ModelAndView mav = new ModelAndView("productlist");
        mav.addObject("productList", productList);
        mav.addObject("pageCount", pageCount);
        return mav;
    }

    /**
     * Shows the Product page with the relevant productId. The product ID is not
     * necessary for the sake of preventing error, but doing that is pointless
     * because the method will just redirect to Home anyway.
     *
     * @param productId The product's ID.
     * @return If product ID is not available or the product is not found,
     * redirect to home. Otherwise returns a ModelAndView for product.jsp, with
     * the relevant information.
     */
    @RequestMapping({"product"})
    public ModelAndView showProduct(@RequestParam(value = "productid", required = false) String productId) {
        System.out.println("showProduct with productId = " + productId);
        if (productId == null || productId.isEmpty()) {
            return new ModelAndView("redirect:home");
        } else {
            Product p = productService.getProduct(productId);
            if (p == null) {
                return new ModelAndView("redirect:home");
            } else {
                ModelAndView mav = new ModelAndView("product");
                mav.addObject("product", p);
                return mav;
            }
        }

    }

}
