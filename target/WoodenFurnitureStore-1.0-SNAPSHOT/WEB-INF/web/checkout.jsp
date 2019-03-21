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
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Checkout :: w3layouts</title>
        <jsp:include page="fragment/metadump.jsp" />
    </head>

    <body>
        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" />
        <!-- //navbar -->

        <!-- banner-2 -->
        <div class="page-head_agile_info_w3l">

        </div>
        <!-- //banner-2 -->
        <!-- checkout page -->
        <div class="privacy">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Checkout
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="checkout-right">
                    <h4>Your shopping cart contains:
                        <span>${checkoutList.size()} Products</span>
                    </h4>
                    <div class="table-responsive">
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>SL No.</th>
                                    <th>Product</th>
                                    <th>Quality</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${checkoutList}" varStatus="loop">
                                    <tr>
                                        <td class="invert">${loop.index+1}</td>
                                        <td class="invert-image">
                                            <a href="single2.html">
                                                <img src="<c:url value="resource/images/${item.thumbnail}"/>" alt="${item.productName}" class="img-responsive">
                                            </a>
                                        </td>
                                        <td class="invert">
                                            <div class="quantity">
                                                <div class="quantity-select">
                                                    <span>${item.quantity}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="invert">${item.productName}</td>
                                        <td class="invert">$${item.price}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="checkout-left">
                    <div class="address_form_agile">
                        <h4>Add a new Details</h4>
                        <form:form id="checkoutForm" modelAttribute="login" action="docheckout" method="post" cssClass="creditly-card-form agileinfo_form">
                            <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                                <div class="information-wrapper">
                                    <div class="first-row">
                                        <div class="controls">
                                            <form:input path="email" placeholder = "Email" required="required"/>
                                        </div>
                                        <div class="controls">
                                            <form:input path="phone" placeholder = "Telephone number" required="required"/>
                                        </div>
                                        <div class="controls">
                                            <form:input path="address" placeholder = "Delivery Address" required="required"/>
                                        </div>
                                    </div>
                                    <b>Payment method:</b>
                                    <div class="funkyradio">
                                        <c:forEach var="pm" items="${paymentMethodList}" varStatus="loop">
                                            <div class="funkyradio-primary">
                                                <input type="radio" name="paymentmethodid" id="paymentmethod${pm.categoryId}" value="${pm.categoryId}" 
                                                       <c:if test="${loop.index==0}">
                                                           checked
                                                       </c:if>
                                                       />
                                                <label for="paymentmethod${pm.categoryId}">${pm.categoryName}</label>
                                            </c:forEach>
                                        </div>
                                        <button class="submit check_out" onsubmit="clearCart()" >Delivery to this Address</button>
                                        <script>
                                            function clearCart() {
                                                paypalm.minicartk.cart.destroy();
                                            }
                                        </script>
                                    </div>

                                </div>
                            </form:form>
                            <div class="checkout-right-basket">
                                <a href="#" onclick="clearCart()">Make a Payment
                                    <span class="fa fa-hand-o-right" aria-hidden="true"></span>
                                </a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //checkout page -->
            <!-- footer -->
            <jsp:include page="fragment/footer.jsp" />
            <!-- //footer -->
            <!-- copyright -->
            <jsp:include page="fragment/copyright.jsp" />
            <!-- //copyright -->
            <!-- js-files -->
            <jsp:include page="fragment/js/jsdump.jsp" />
            <!-- //js-files -->
    </body>

</html>