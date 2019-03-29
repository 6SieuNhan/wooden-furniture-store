/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.config.WBHConstants;
import com.webbanhang2.model.Category;
import com.webbanhang2.model.Message;
import com.webbanhang2.model.Order;
import com.webbanhang2.model.OrderDetail;
import com.webbanhang2.model.Product;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import com.webbanhang2.service.OrderService;
import com.webbanhang2.service.ProductService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

@SessionAttributes(value = {"login", "messageForm", "productCategoryList",
    "productMaterialList", "productOriginList", "productRoomList",
    "paymentMethodList", "orderStatusList"})
public class HomeController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    OrderService orderService;

    /**
     * Sets up the login model attribute, to be used by various forms requiring
     * an User model, such as: The Login and Register form on header.jsp, the
     * checkout form, the Password recovery form (upcoming)
     *
     * @return An empty User object for the login model.
     */
    @ModelAttribute("login")
    public User setUpUserForm() {
        return new User();
    }

    @ModelAttribute("messageForm")
    public Message setUpMessageForm() {
        return new Message();
    }

    @ModelAttribute("productCategoryList")
    public List<Category> setUpCategoryMaterialList() {
        List<Category> pml = categoryService.getCategoryList(Category.PRODUCT_CATEGORY);
        return pml;
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

    @ModelAttribute("productRoomList")
    public List<Category> setUpProductRoomList() {
        return categoryService.getCategoryList(Category.PRODUCT_ROOM);
    }

    @ModelAttribute("paymentMethodList")
    public List<Category> setUpPaymentMethodList() {
        return categoryService.getCategoryList(Category.PAYMENT_METHOD);
    }

    @ModelAttribute("orderStatusList")
    public List<Category> setUpOrderStatusList() {
        return categoryService.getCategoryList(Category.ORDER_STATUS);
    }

    @RequestMapping("about")
    public String showAbout() {
        return "about";
    }

    @RequestMapping("message")
    public String showMessage() {
        return "message";
    }

    @RequestMapping("contact")
    public String showContact() {
        return "contact";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String showLogin() {
        return "login";
    }

    /**
     * Shows the index.jsp form.
     *
     * @param request
     * @return The String 'index', signaling the dispatcher to show the
     * index.jsp form.
     */
    @RequestMapping({"/", "home"})
    public String showIndex(HttpServletRequest request) {
        return "index";
    }

    /**
     * Shows the product list page. Can take a number of (optional) search
     * parameters, such as search query, product category IDs, min/max price.
     *
     * @param searchQuery
     * @param productCategoryIds
     * @param productMaterialIds
     * @param productOriginIds
     * @param productRoomIds
     * @param minPrice
     * @param maxPrice
     * @param page
     * @return A ModelAndView for productlist.jsp, along with the relevant
     * product list and page count (for pagination purpose)
     */
    @RequestMapping({"productlist"})
    public ModelAndView showProductList(
            @RequestParam(value = "searchquery", required = false) String searchQuery,
            @RequestParam(value = "productcategoryid", required = false) List<String> productCategoryIds,
            @RequestParam(value = "productmaterialid", required = false) List<String> productMaterialIds,
            @RequestParam(value = "productoriginid", required = false) List<String> productOriginIds,
            @RequestParam(value = "productroomid", required = false) List<String> productRoomIds,
            @RequestParam(value = "minprice", required = false) Double minPrice,
            @RequestParam(value = "maxprice", required = false) Double maxPrice,
            @RequestParam(value = "page", required = false) Integer page
    ) {
        //Prints stuff to console
        System.out.println("showProductList");

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
        List<Product> productList = productService.getProductList(params, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
        int pageCount = productService.getProductListPageCount(params, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
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

    @RequestMapping(value = "checkout")
    public ModelAndView showCheckout(HttpServletRequest request) {
        int i = 1;
        Integer quantity;
        String itemId;
        ArrayList<Product> checkoutList = new ArrayList<>(), existing;
        do {
            itemId = request.getParameter("id_" + i);

            if (itemId != null) {
                quantity = Integer.parseInt(request.getParameter("quantity_" + i));
                //Tracking line
                System.out.println(itemId + ": " + quantity);

                Product p = productService.getShortenedProduct(itemId);
                p.setQuantity(quantity);
                checkoutList.add(p);
            }

            i++;
        } while (itemId != null);

        //redirects to home if no product is found
        existing = (ArrayList<Product>) request.getSession().getAttribute("checkoutList");
        if (checkoutList.isEmpty() && (existing == null || existing.isEmpty())) {
            return new ModelAndView("redirect:home");
        } else {
            //binds checkout list to result
            if (!checkoutList.isEmpty()) {
                request.getSession().setAttribute("checkoutList", checkoutList);
            }
            ModelAndView mav = new ModelAndView("checkout");
            return mav;
        }
    }

    @RequestMapping("dashboard")
    public ModelAndView showDashboard(
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "orderid", required = false) String orderId,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView mav;
        if (user == null) {
            return new ModelAndView("redirect:home");
        }
        if (action == null) {
            return new ModelAndView("dashboardaccinfo");
        }
        switch (action) {
            case "accountinfo":
                return new ModelAndView("dashboardaccinfo");
            case "editpassword":
                return new ModelAndView("dashboardeditpassword");
            case "order":
                if (page == null) {
                    page = 1;
                }
                mav = new ModelAndView("dashboardorder");
                List<Order> orderList = orderService.getOrderList(user.getUserId(), (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                int pageCount = orderService.getOrderListPageCount(user.getUserId(), WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                mav.addObject("orderList", orderList);
                mav.addObject("pageCount", pageCount);
                return mav;
            case "orderdetail":
                Order o = orderService.getOrder(orderId);
                //validation stuff; prevent users from viewing other's order info
                if (o == null || !o.getUserId().equals(user.getUserId())) {
                    return new ModelAndView("redirect:home");
                } else {
                    int total = 0;
                    for (OrderDetail od : o.getOrderDetailList()) {
                        total += od.getTotal();
                    }
                    mav = new ModelAndView("dashboardorderinfo");
                    mav.addObject("order", o);
                    mav.addObject("total", total);
                    return mav;
                }
            default:
                return new ModelAndView("dashboardaccinfo");
        }
    }
}
