<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
        <jsp:include page="fragment/metadump.jsp" />
    </head>

    <body>
        <!-- checkout page -->
        <div class="privacy">
            <div class="container">
                <a href="home">
                    <button class="back"><i class="fa fa-arrow-left" aria-hidden="true"></i>Trở về trang chủ</button>
                </a>
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Thanh toán
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="checkout-right">
                    <h4>Giỏ hàng bao gồm:
                        <span>${checkoutList.size()} Sản phẩm</span>
                    </h4>
                    <div class="table-responsive">
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Hình ảnh sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${checkoutList}" varStatus="loop">
                                    <tr>
                                        <td class="invert">${loop.index+1}</td>
                                        <td width="550px" class="invert-image men-thumb-item">
                                            <a href="product?productid=${item.productId}">
                                                <img src="<c:url value="resource/images/product_img/${item.thumbnail}"/>" alt="${item.productName}" class="img-responsive">
                                            </a>
                                        </td>
                                        <td class="invert">${item.productName}</td>
                                        <td class="invert">
                                            <div class="quantity">
                                                <div class="quantity-select">
                                                    <span>${item.quantity}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="number">${item.price}</span><span>đ</span></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td class="text-left" colspan="4">Tổng cộng:</td>
                                    <td><span class="number">${total}</span><span>đ</span></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="checkout-left">
                    <div class="address_form_agile">

                        <form:form id="checkoutForm" modelAttribute="login" action="docheckout" method="post" cssClass="creditly-card-form agileinfo_form">
                            <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                                <div class="information-wrapper">
                                    <div class="first-row col-md-6">
                                        <h4>Thông tin khách hàng</h4>
                                        <div class="controls">
                                            <form:input type="email" path="email" placeholder = "Email" required="required" value="${user.email}" maxlength="50"/>
                                        </div>
                                        <div class="controls">
                                            <form:input type="number" path="phone" placeholder = "Số điện thoại" required="required" value="${user.phone}" maxlength="12"/>
                                        </div>
                                        <div class="controls">
                                            <form:input path="address" placeholder = "Địa chỉ nhận hàng (Xã, Phường/Tỉnh, Thành Phố)" required="required" value="${user.address}" maxlength="100"/>
                                        </div>
                                    </div>

                                </div>
                            </form:form>
                            <div class="funkyradio col-md-6">
                                <h3>Phương Thức Thanh Toán</h3>
                                <c:forEach var="pm" items="${paymentMethodList}" varStatus="loop">
                                    <div class="funkyradio-primary">
                                        <input type="radio" name="paymentmethodid" id="paymentmethod${pm.categoryId}" value="${pm.categoryId}" 
                                               <c:if test="${loop.index==0}">
                                                   checked
                                               </c:if>
                                               />
                                        <label for="paymentmethod${pm.categoryId}">${pm.categoryName}</label>
                                    </div>
                                </c:forEach>
                                <button class="submit check_out" onsubmit="clearCart()" >Delivery to this Address</button>
                                <script>
                                    function clearCart() {
                                        paypalm.minicartk.cart.destroy();
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //checkout page -->
            <!-- copyright -->
            <jsp:include page="fragment/copyright.jsp" />
            <!-- //copyright -->
            <!-- js-files -->
            <jsp:include page="fragment/js/jsdump.jsp" />
            <!-- //js-files -->

            <script>
                window.onload = function () {
                    document.getElementById("password3").setCustomValidity("Mật khẩu phải từ 4 đến 16 ký tự");
                    document.getElementById("email").setCustomValidity("Trường không được để trống");
                    document.getElementById("phone").setCustomValidity("Bạn chưa điền số điện thoại");

                    document.getElementById("password3").oninput = validatePassword;
                    document.getElementById("password4").oninput = validatePassword;
                    document.getElementById("email").oninput = validateEmail;
                    document.getElementById("phone").oninput = validatePhone;
                };
            </script>
    </body>

</html>