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
import com.webbanhang2.service.MessageService;
import com.webbanhang2.service.OrderService;
import com.webbanhang2.service.ProductService;
import com.webbanhang2.service.UserService;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    "paymentMethodList", "orderStatusList", "userRoleList"})
public class HomeController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    OrderService orderService;

    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

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

    @ModelAttribute("userRoleList")
    public List<Category> setUpUserRoleList() {
        return categoryService.getCategoryList(Category.USER_ROLE);
    }

    /*   @ModelAttribute("productlistByTop")
    public List<Product> showProductListByTop() {
        return productService.getProductListByTop();
    }*/
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

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String showRegister() {
        return "register";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String showLogin() {
        return "login";
    }

    /**
     * Shows the index.jsp form.
     *
     * @param model
     * @param request
     * @return The String 'index', signaling the dispatcher to show the
     * index.jsp form.
     */
    @RequestMapping({"/", "home"})
    public String showIndex(Model model, HttpServletRequest request) {

        List<Product> productlistByTop = productService.getProductListByTop();
        model.addAttribute("productlistByTop", productlistByTop);
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
     * @param request
     * @return If product ID is not available or the product is not found,
     * redirect to home. Otherwise returns a ModelAndView for product.jsp, with
     * the relevant information.
     */
    @RequestMapping({"product"})
    public ModelAndView showProduct(@RequestParam(value = "productid", required = false) String productId, HttpServletRequest request) {
        System.out.println("showProduct with productId = " + productId);
        if (productId == null || productId.isEmpty()) {
            return new ModelAndView("redirect:home");
        } else {
            Product p = productService.getProduct(productId);

            if (p == null) {
                return new ModelAndView("redirect:home");
            } else {
                //get image list
                ArrayList<String> imgList = new ArrayList<>();
                StringBuilder path3 = new StringBuilder("/resource/images/product_img/");
                path3.append(p.getProductCode());
                path3.append("/");
                String path2 = request.getSession().getServletContext().getRealPath(path3.toString());
                try (Stream<Path> paths = Files.walk(Paths.get(path2))) {
                    paths.filter(Files::isRegularFile).forEach(path -> {
                        System.out.println(path.getFileName());
                        imgList.add(path.getFileName().toString());
                    });
                } catch (Exception ex) {
                    Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
                }

                ModelAndView mav = new ModelAndView("product");
                mav.addObject("product", p);
                if (!imgList.isEmpty()) {
                    mav.addObject("imgList", imgList);
                }
                return mav;
            }
        }
    }

    @RequestMapping(value = "checkout")
    public ModelAndView showCheckout(HttpServletRequest request) {
        int i = 1, total = 0;
        Integer quantity;
        String itemId, quantityString;
        ArrayList<Product> checkoutList = new ArrayList<>(), existing;
        do {
            itemId = request.getParameter("id_" + i);

            if (itemId != null) {
                quantityString = request.getParameter("quantity_" + i);
                try {
                    quantity = Integer.parseInt(quantityString);
                } catch (NumberFormatException ex) {
                    return new ModelAndView("redirect:home");
                }
                
                Product p = productService.getShortenedProduct(itemId);
                p.setQuantity(quantity);
                //Tracking line
                System.out.println(itemId + ": " + p.getProductName() + ": " + quantity);
                
                checkoutList.add(p);
            }

            i++;
        } while (itemId != null);

        existing = (ArrayList<Product>) request.getSession().getAttribute("checkoutList");

        //checks item quantity status
        if (existing == null || existing.isEmpty()) {
            boolean hasItem = productService.checkStock(checkoutList);
            if (!hasItem) {
                ModelAndView mav = new ModelAndView("message");
                mav.addObject("message", "Không đủ sản phẩm trong kho hàng, xin mời kiểm tra lại đơn hàng và sửa lại nếu cần");
                return mav;
            }
        }

        //redirects to home if no product is found
        if (checkoutList.isEmpty() && (existing == null || existing.isEmpty())) {
            return new ModelAndView("redirect:home");
        } else {
            //binds checkout list to result; gets the total price in the meantime
            if (!checkoutList.isEmpty()) {
                request.getSession().setAttribute("checkoutList", checkoutList);
                for (Product p : checkoutList) {
                    total += p.getPrice() * p.getQuantity();
                }
            } //else get total price from existing list
            else {
                for (Product p : existing) {
                    total += p.getPrice() * p.getQuantity();
                }
            }
            ModelAndView mav = new ModelAndView("checkout");
            mav.addObject("total", total);
            return mav;
        }
    }

    @RequestMapping("dashboard")
    public ModelAndView showDashboard(
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "searchquery", required = false) String searchQuery,
            @RequestParam(value = "productcategoryid", required = false) List<String> productCategoryIds,
            @RequestParam(value = "productmaterialid", required = false) List<String> productMaterialIds,
            @RequestParam(value = "productoriginid", required = false) List<String> productOriginIds,
            @RequestParam(value = "productroomid", required = false) List<String> productRoomIds,
            @RequestParam(value = "minprice", required = false) Double minPrice,
            @RequestParam(value = "maxprice", required = false) Double maxPrice,
            @RequestParam(value = "orderid", required = false) String orderId,
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "messageid", required = false) String messageId,
            @RequestParam(value = "userid", required = false) String userId,
            @RequestParam(value = "userquery", required = false) String userQuery,
            @RequestParam(value = "emailquery", required = false) String emailQuery,
            @RequestParam(value = "addressquery", required = false) String addressQuery,
            @RequestParam(value = "phonequery", required = false) String phoneQuery,
            @RequestParam(value = "categorytype", required = false) Integer categoryType,
            @RequestParam(value = "userroleid", required = false) Integer userRoleId,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView mav;
        int pageCount;
        if (user == null) {
            return new ModelAndView("redirect:home");
        }
        if (action == null) {
            return new ModelAndView("dashboardaccinfo");
        }
        switch (action) {
            case "accountinfo":
                mav = new ModelAndView("dashboardaccinfo");
                //admin edit form stuff
                if (user.getUserRoleId() == User.ADMIN && userId != null && !userId.isEmpty()) {
                    User user2 = userService.getUserById(userId);
                    mav.addObject("user2", user2);
                }
                return mav;
            case "editpassword":
                return new ModelAndView("dashboardeditpassword");
            case "order":
                if (page == null) {
                    page = 1;
                }
                List<Order> orderList;
                if (user.getUserRoleId() == User.ADMIN) {
                    //do something for admin
                    if (userId != null && !userId.isEmpty()) {
                        orderList = orderService.getOrderList(userId, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                        pageCount = orderService.getOrderListPageCount(userId, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    } else {
                        if (searchQuery != null && !searchQuery.isEmpty()) {
                            searchQuery = "%" + searchQuery + "%";
                        }
                        orderList = orderService.getOrderListSearch(searchQuery, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                        pageCount = orderService.getOrderListSearchPageCount(searchQuery, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    }
                } else {
                    //do something for user
                    orderList = orderService.getOrderList(user.getUserId(), (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    pageCount = orderService.getOrderListPageCount(user.getUserId(), WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                }
                if (orderList != null && !orderList.isEmpty()) {
                    System.out.println(orderList.get(0).getUsername());
                }
                mav = new ModelAndView("dashboardorder");
                mav.addObject("orderList", orderList);
                mav.addObject("pageCount", pageCount);
                return mav;
            case "orderdetail":
                Order o = orderService.getOrder(orderId);
                //validation stuff; prevent non-admin users from viewing other's order info
                if (o == null
                        || ((o.getUserId() == null || !o.getUserId().equals(user.getUserId()))
                        && user.getUserRoleId() != User.ADMIN)) {
                    return new ModelAndView("redirect:dashboard?action=order");
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
            //admin stuff
            case "categorylist":
                if (user.getUserRoleId() == User.ADMIN) {
                    if (categoryType == null) {
                        categoryType = Category.PRODUCT_CATEGORY;
                    }
                    List<Category> categoryList = categoryService.getCategoryListWithProductCount(categoryType);
                    mav = new ModelAndView("dashboardadmin_categorylist");
                    mav.addObject("categoryList", categoryList);
                    mav.addObject("categoryType", categoryType);
                    return mav;
                }
            case "userlist":
                if (user.getUserRoleId() == User.ADMIN) {
                    if (page == null) {
                        page = 1;
                    }
                    if (userRoleId == null) {
                        userRoleId = 0;
                    }
                    List<User> userList = userService.getUserList(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    pageCount = userService.getUserListPageCount(userQuery, emailQuery, addressQuery, phoneQuery, userRoleId, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    mav = new ModelAndView("dashboardadmin_userlist");
                    mav.addObject("userList", userList);
                    mav.addObject("pageCount", pageCount);
                    return mav;
                }
            case "productlist":
                if (user.getUserRoleId() == User.ADMIN) {
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
                    pageCount = productService.getProductListPageCount(params, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                    mav = new ModelAndView("dashboardadmin_productlist");
                    mav.addObject("productList", productList);
                    mav.addObject("pageCount", pageCount);
                    return mav;
                }
            case "messagelist":
                if (page == null) {
                    page = 1;
                }
                List<Message> messageList = messageService.getMessageList(searchQuery, (page - 1) * WBHConstants.PRODUCT_LIST_PAGE_SIZE, WBHConstants.PRODUCT_LIST_PAGE_SIZE);
                pageCount = messageService.getMessageListPageCount(searchQuery, WBHConstants.PRODUCT_LIST_PAGE_SIZE);

                mav = new ModelAndView("dashboardadmin_messagelist");
                mav.addObject("messageList", messageList);
                mav.addObject("pageCount", pageCount);
                return mav;
            case "message":
                Message m = messageService.getMessage(messageId);
                if (m == null) {
                    //what do I do here
                    mav = new ModelAndView("message");
                    mav.addObject("message", "Không tìm được tin nhắn nào có ID tương ứng.");
                } else {
                    mav = new ModelAndView("dashboardadmin_message");
                    mav.addObject("messageObject", m);
                }
                return mav;
            default:
                return new ModelAndView("dashboardaccinfo");
        }
    }
}
