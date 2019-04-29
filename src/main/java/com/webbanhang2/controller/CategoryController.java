/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.controller;

import com.webbanhang2.model.Category;
import com.webbanhang2.model.User;
import com.webbanhang2.service.CategoryService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author fkien
 */
@Controller
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping("savecategory")
    public ModelAndView saveCategory(@RequestParam(value = "oldcategory", required = false) String oldCategory,
            @RequestParam(value = "newcategory", required = false) String newCategory,
            @RequestParam(value = "categorytype", required = false) Integer categoryType,
            HttpServletRequest request, RedirectAttributes redir) {
        //validation
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return new ModelAndView("redirect:home");
        }
        ModelAndView mav = new ModelAndView("redirect:dashboard?action=categorylist&categorytype=" + categoryType);
        if (categoryType == null) {
            redir.addFlashAttribute("message", "Yêu cầu sửa danh mục không hợp lệ.");
        }
        String f = null;
        switch (categoryType) {
            case Category.PRODUCT_CATEGORY:
                f = "productCategoryList";
                break;
            case Category.PRODUCT_MATERIAL:
                f = "productMaterialList";
                break;
            case Category.PRODUCT_ORIGIN:
                f = "productOriginList";
                break;
            case Category.PRODUCT_ROOM:
                f = "productRoomList";
                break;
            default:
                redir.addFlashAttribute("message", "Yêu cầu sửa danh mục không hợp lệ.");
                return mav;
        }
        System.out.println(oldCategory);
        System.out.println(newCategory);
        boolean result = categoryService.saveCategory(oldCategory, newCategory, categoryType);
        if (result) {
            List<Category> newList = categoryService.getCategoryList(categoryType);
            request.getSession().setAttribute(f, newList);
            redir.addFlashAttribute("message", "Sửa danh mục thành công.");
        } else {
            redir.addFlashAttribute("message", "Sửa danh mục không thành công; tên danh mục mới không được trùng với tên của một danh mục sẵn có.");
        }

        return mav;
    }

    @RequestMapping("deletecategory")
    public ModelAndView deleteCategory(
            @RequestParam(value = "categoryname", required = false) String categoryName,
            @RequestParam(value = "categorytype", required = false) Integer categoryType,
            HttpServletRequest request, RedirectAttributes redir) {
        //validation
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getUserRoleId() != User.ADMIN) {
            return new ModelAndView("redirect:home");
        }
        ModelAndView mav = new ModelAndView("redirect:dashboard?action=categorylist&categorytype=" + categoryType);
        if (categoryType == null) {
            redir.addFlashAttribute("message", "Yêu cầu xóa danh mục không hợp lệ.");
        }
        String f = null;
        switch (categoryType) {
            case Category.PRODUCT_CATEGORY:
                f = "productCategoryList";
                break;
            case Category.PRODUCT_MATERIAL:
                f = "productMaterialList";
                break;
            case Category.PRODUCT_ORIGIN:
                f = "productOriginList";
                break;
            case Category.PRODUCT_ROOM:
                f = "productRoomList";
                break;
            default:
                redir.addFlashAttribute("message", "Yêu cầu xóa danh mục không hợp lệ.");
                return mav;
        }
        boolean result = categoryService.deleteCategory(categoryName, categoryType);
        if (result) {
            List<Category> newList = categoryService.getCategoryList(categoryType);
            request.getSession().setAttribute(f, newList);
            redir.addFlashAttribute("message", "Xóa danh mục thành công.");
        } else {
            redir.addFlashAttribute("message", "Xóa danh mục không thành công; không thể xóa danh mục vẫn còn chứa sản phẩm bên trong.");
        }

        return mav;
    }
}
