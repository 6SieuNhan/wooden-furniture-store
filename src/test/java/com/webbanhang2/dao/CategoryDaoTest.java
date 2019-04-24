/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.dao;

import com.webbanhang2.model.Category;
import java.util.List;
import javax.transaction.Transactional;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author fkien
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-mvc-servlet.xml")
@ActiveProfiles("test")
@WebAppConfiguration
public class CategoryDaoTest extends TestCase {

    @Autowired
    WebApplicationContext webApplicationContext;

    @Autowired
    CategoryDao categoryDaoMock;

    //tests for method getCategoryList(int categoryType)
    @Test
    public void getCategoryListNull() {
        List<Category> result = categoryDaoMock.getCategoryList(-1);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryListProductCategory() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_CATEGORY);
        assertEquals(result.get(0).getCategoryName(), "Bàn Ghế");
    }

    @Test
    public void getCategoryListProductMaterial() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_MATERIAL
        );
        assertEquals(result.get(0).getCategoryName(), "Gỗ Gụ");
    }

    @Test
    public void getCategoryListProductOrigin() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_ORIGIN
        );
        assertEquals(result.get(0).getCategoryName(), "Thủy Hằng");
    }

    @Test
    public void getCategoryListProductRoom() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PRODUCT_ROOM
        );
        assertEquals(result.get(0).getCategoryName(), "Phòng khách");
    }

    @Test
    public void getCategoryListOrderStatus() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.ORDER_STATUS
        );
        assertEquals(result.get(0).getCategoryName(), "unverified");
    }

    @Test
    public void getCategoryListPaymentMethod() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.PAYMENT_METHOD
        );
        assertEquals(result.get(0).getCategoryName(), "cod");
    }

    @Test
    public void getCategoryListUserRole() {
        List<Category> result = categoryDaoMock.getCategoryList(Category.USER_ROLE
        );
        assertEquals(result.get(0).getCategoryName(), "admin");
    }

    //tests for method List<Category> getCategoryListWithProductCount(int categoryType);
    @Test
    public void getCategoryListWithProductCountProductCategory() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.PRODUCT_CATEGORY);
        assertEquals(result.get(0).getCategoryName(), "Bàn Ghế");
        assertEquals(result.get(0).getProductCount(), 8);
    }

    @Test
    public void getCategoryListWithProductCountProductMaterial() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.PRODUCT_MATERIAL
        );
        assertEquals(result.get(0).getCategoryName(), "Gỗ Gụ");
        assertEquals(result.get(0).getProductCount(), 21);
    }

    @Test
    public void getCategoryListWithProductCountProductOrigin() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.PRODUCT_ORIGIN
        );
        assertEquals(result.get(0).getCategoryName(), "Thủy Hằng");
        assertEquals(result.get(0).getProductCount(), 100);
    }

    @Test
    public void getCategoryListWithProductCountProductRoom() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.PRODUCT_ROOM
        );
        assertEquals(result.get(0).getCategoryName(), "Phòng khách");
        assertEquals(result.get(0).getProductCount(), 28);
    }

    @Test
    public void getCategoryListWithProductCountOrderStatus() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.ORDER_STATUS
        );
        assertEquals(result.get(0).getCategoryName(), "unverified");
        assertEquals(result.get(0).getProductCount(), 0);
    }

    @Test
    public void getCategoryListWithProductCountPaymentMethod() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.PAYMENT_METHOD
        );
        assertEquals(result.get(0).getCategoryName(), "cod");
        assertEquals(result.get(0).getProductCount(), 0);
    }

    @Test
    public void getCategoryListWithProductCountUserRole() {
        List<Category> result = categoryDaoMock.getCategoryListWithProductCount(Category.USER_ROLE
        );
        assertEquals(result.get(0).getCategoryName(), "admin");
        assertEquals(result.get(0).getProductCount(), 0);
    }

    //Tests for method getCategoryByName(String categoryName, int categoryType)
    @Test
    public void getCategoryByNameCategoryIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.PRODUCT_CATEGORY);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameMaterialIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.PRODUCT_MATERIAL);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameOriginIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.PRODUCT_ORIGIN);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameRoomIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.PRODUCT_ROOM);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameOrderStatusIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.ORDER_STATUS);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNamePaymentMethodIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.PAYMENT_METHOD);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameUserRoleIncorrectName() {
        Category result = categoryDaoMock.getCategoryByName("INCORRECT_NAME", Category.USER_ROLE);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameIncorrectCategoryType() {
        Category result = categoryDaoMock.getCategoryByName("Bàn Ghế", -1);
        assertEquals(result, null);
    }

    @Test
    public void getCategoryByNameCategoryCorrect() {
        Category result = categoryDaoMock.getCategoryByName("Bàn Ghế", Category.PRODUCT_CATEGORY);
        assertEquals(result.getCategoryName(), "Bàn Ghế");
        assertEquals(result.getProductCount(), 8);
    }

    @Test
    public void getCategoryByNameMaterialCorrect() {
        Category result = categoryDaoMock.getCategoryByName("Gỗ Gụ", Category.PRODUCT_MATERIAL);
        assertEquals(result.getCategoryName(), "Gỗ Gụ");
        assertEquals(result.getProductCount(), 21);
    }

    @Test
    public void getCategoryByNameOriginCorrect() {
        Category result = categoryDaoMock.getCategoryByName("Thủy Hằng", Category.PRODUCT_ORIGIN);
        assertEquals(result.getCategoryName(), "Thủy Hằng");
        assertEquals(result.getProductCount(), 100);
    }

    @Test
    public void getCategoryByNameRoomCorrect() {
        Category result = categoryDaoMock.getCategoryByName("Phòng khách", Category.PRODUCT_ROOM);
        assertEquals(result.getCategoryName(), "Phòng khách");
        assertEquals(result.getProductCount(), 28);
    }

    @Test
    public void getCategoryByNameOrderStatusCorrect() {
        Category result = categoryDaoMock.getCategoryByName("unverified", Category.ORDER_STATUS);
        assertEquals(result.getCategoryName(), "unverified");
        assertEquals(result.getProductCount(), 0);
    }

    @Test
    public void getCategoryByNamePaymentMethodCorrect() {
        Category result = categoryDaoMock.getCategoryByName("cod", Category.PAYMENT_METHOD);
        assertEquals(result.getCategoryName(), "cod");
        assertEquals(result.getProductCount(), 0);
    }

    @Test
    public void getCategoryByNameUserRoleCorrect() {
        Category result = categoryDaoMock.getCategoryByName("admin", Category.USER_ROLE);
        assertEquals(result.getCategoryName(), "admin");
        assertEquals(result.getProductCount(), 0);
    }

    //tests for method saveCategory(String oldCategory, String newCategory, int categoryType); 
    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryIncorrectCategoryType() {
        boolean result = categoryDaoMock.saveCategory("Bàn Ghế", "NEW_NAME", -1);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductCategoryIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.PRODUCT_CATEGORY);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductMaterialIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.PRODUCT_MATERIAL);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductOriginIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.PRODUCT_ORIGIN);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductRoomIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.PRODUCT_ROOM);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryOrderStatusIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.ORDER_STATUS);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductPaymentMethodIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.PAYMENT_METHOD);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryUserRoleIncorrectName() {
        boolean result = categoryDaoMock.saveCategory("INCORRECT_NAME", "NEW_NAME", Category.USER_ROLE);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductCategoryDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("Bàn Ghế", "Bàn Ăn", Category.PRODUCT_CATEGORY);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductMaterialDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("Gỗ Gụ", "Gỗ Hương", Category.PRODUCT_MATERIAL);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductOriginDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("Thủy Hằng", "Ba Sa", Category.PRODUCT_ORIGIN);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductRoomDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("Phòng khách", "Phòng thờ", Category.PRODUCT_ROOM);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryOrderStatusDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("unverified", "verified", Category.ORDER_STATUS);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductPaymentMethodDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("cod", "cash", Category.PAYMENT_METHOD);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryUserRoleDuplicateName() {
        boolean result = categoryDaoMock.saveCategory("admin", "user", Category.USER_ROLE);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductCategoryCorrect() {
        boolean result = categoryDaoMock.saveCategory("Bàn Ghế", "NEW_NAME", Category.PRODUCT_CATEGORY);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductMaterialCorrect() {
        boolean result = categoryDaoMock.saveCategory("Gỗ Gụ", "NEW_NAME", Category.PRODUCT_MATERIAL);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductOriginCorrect() {
        boolean result = categoryDaoMock.saveCategory("Thủy Hằng", "NEW_NAME", Category.PRODUCT_ORIGIN);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductRoomCorrect() {
        boolean result = categoryDaoMock.saveCategory("Phòng khách", "NEW_NAME", Category.PRODUCT_ROOM);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryOrderStatusCorrect() {
        boolean result = categoryDaoMock.saveCategory("unverified", "NEW_NAME", Category.ORDER_STATUS);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryProductPaymentMethodCorrect() {
        boolean result = categoryDaoMock.saveCategory("cod", "NEW_NAME", Category.PAYMENT_METHOD);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void saveCategoryUserRoleCorrect() {
        boolean result = categoryDaoMock.saveCategory("admin", "NEW_NAME", Category.USER_ROLE);
        assertEquals(result, true);
    }

    //tests for method deleteCategory(String categoryName, int categoryType)
    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryIncorrectCategoryType() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", -1);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryOrderStatus() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.ORDER_STATUS);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryPaymentMethod() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.PAYMENT_METHOD);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryUserRole() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.USER_ROLE);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductCategoryIncorrectName() {
        boolean result = categoryDaoMock.deleteCategory("INCORRECT_NAME", Category.PRODUCT_CATEGORY);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductMaterialIncorrectName() {
        boolean result = categoryDaoMock.deleteCategory("INCORRECT_NAME", Category.PRODUCT_MATERIAL);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductOriginIncorrectName() {
        boolean result = categoryDaoMock.deleteCategory("INCORRECT_NAME", Category.PRODUCT_ORIGIN);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductRoomIncorrectName() {
        boolean result = categoryDaoMock.deleteCategory("INCORRECT_NAME", Category.PRODUCT_ROOM);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductCategoryOccupied() {
        boolean result = categoryDaoMock.deleteCategory("Bàn Ghế", Category.PRODUCT_CATEGORY);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductMaterialOccupied() {
        boolean result = categoryDaoMock.deleteCategory("Gỗ Gụ", Category.PRODUCT_MATERIAL);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductOriginOccupied() {
        boolean result = categoryDaoMock.deleteCategory("Thủy Hằng", Category.PRODUCT_ORIGIN);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductRoomOccupied() {
        boolean result = categoryDaoMock.deleteCategory("Phòng khách", Category.PRODUCT_ROOM);
        assertEquals(result, false);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductCategoryCorrect() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.PRODUCT_CATEGORY);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductMaterialCorrect() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.PRODUCT_MATERIAL);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductOriginCorrect() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.PRODUCT_ORIGIN);
        assertEquals(result, true);
    }

    @Test
    @Transactional
    @Rollback(true)
    public void deleteCategoryProductRoomCorrect() {
        boolean result = categoryDaoMock.deleteCategory("BLANK_CATEGORY", Category.PRODUCT_ROOM);
        assertEquals(result, true);
    }
}
