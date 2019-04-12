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
            redir.addFlashAttribute("message", "Invalid edit request");
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
                redir.addFlashAttribute("message", "Invalid edit request");
                return mav;
        }
        System.out.println(oldCategory);
        System.out.println(newCategory);
        boolean result = categoryService.saveCategory(oldCategory, newCategory, categoryType);
        if (result) {
            List<Category> newList = categoryService.getCategoryList(categoryType);
            request.getSession().setAttribute(f, newList);
            redir.addFlashAttribute("message", "Edit successful.");
        } else {
            redir.addFlashAttribute("message", "Edit failed, name must be unique.");
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
            redir.addFlashAttribute("message", "Invalid delete request");
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
                redir.addFlashAttribute("message", "Invalid delete request");
                return mav;
        }
        boolean result = categoryService.deleteCategory(categoryName, categoryType);
        if (result) {
            List<Category> newList = categoryService.getCategoryList(categoryType);
            request.getSession().setAttribute(f, newList);
            redir.addFlashAttribute("message", "Delete successful.");
        } else {
            redir.addFlashAttribute("message", "Delete failed; cannot delete category when there are still products inside");
        }

        return mav;
    }
}
