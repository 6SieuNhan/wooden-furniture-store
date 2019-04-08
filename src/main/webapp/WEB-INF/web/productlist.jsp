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



<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Kitchen Products :: w3layouts</title>
        <jsp:include page="fragment/metadump.jsp" />
        <!-- paging -->
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" >
            <jsp:param name="page" value="product" />
        </jsp:include>
        <!-- //navbar -->
        <!-- top Products -->
        <div class="ads-grid">
            <div class="container">
                <!-- product list left -->
                <jsp:include page="fragment/productlistleft.jsp" />
                <!-- //product list left -->
                <!-- product right -->
                <div class="agileinfo-ads-display col-md-9 w3l-rightpro">
                    <div class="wrapper">
                        <!-- product list -->
                        <div class="product-sec1">
                            <!-- Just return some error message if no product is found or something -->
                            <c:if test = "${empty productList}">
                                <div class="text-center">
                                    Không tìm được sản phẩm nào.
                                </div>
                            </c:if>
                            <c:forEach var = "product" items ="${productList}" varStatus = "loop">

                                <div class="col-xs-4 product-men">
                                    <div class="men-pro-item simpleCart_shelfItem">
                                        <div class="men-thumb-item">
                                            <img src="<c:url value="resource/images/default/no-image-available-md.png"/>" alt="">
                                            <div class="men-cart-pro">
                                                <div class="inner-men-cart-pro">
                                                    <a href="product?productid=${product.productId}" class="link-product-add-cart">Xem nhanh</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-info-product ">
                                            <h4>
                                                <a href="product?productid=${product.productId}">${product.productName}</a>
                                            </h4>
                                            <div class="info-product-price">
                                                <span class="item_price number">${product.price}</span>
                                                <span class="item_price">đ</span>
                                            </div>
                                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                                <form action="#" method="post">
                                                    <fieldset>
                                                        <c:choose>
                                                            <c:when test="${product.quantity == 0}">
                                                                <input type="submit" name="submit" value="Out of stock" class="button" disabled />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="hidden" name="cmd" value="_cart" />
                                                                <input type="hidden" name="id" value="${product.productId}" />
                                                                <input type="hidden" name="item_name" value="${product.productName}" />
                                                                <input type="hidden" name="amount" value="${product.price}" />
                                                                <input type="hidden" name="href" value="product?productid=${product.productId}" />
                                                                <input type="hidden" name="add" value="1" />
                                                                <input type="hidden" name="currency_code" value="USD" />
                                                                <input type="submit" name="submit" value="Thêm vào giỏ hàng" class="button" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </fieldset>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- begin new product-sec1 div after every 3rd item that is not the last item -->
                                <c:if test="${(loop.index + 1)!= fn:length(productList) && (loop.index+1) % 3 == 0}">
                                    <div class="clearfix"></div>
                                </div>
                                <div class="product-sec1">
                                </c:if>
                            </c:forEach>
                            <!-- //product list -->
                            <div class="clearfix"></div>
                        </div>
                        <!-- //paging -->
                        <br/>
                        <div class="pagination-holder clearfix">
                            <div id="light-pagination" class="pagination" style="display: inline-block;"></div>
                        </div>
                        <br/>
                    </div>
                    <!-- //product right -->
                </div>
            </div>
            <!-- //top products -->
            <!-- footer -->
            <jsp:include page="fragment/footer.jsp" />
            <!-- //footer -->
            <!-- copyright -->
            <jsp:include page="fragment/copyright.jsp" />
            <!-- //copyright -->
            <!-- js-files -->
            <jsp:include page="fragment/js/jsdump.jsp" />
            <!-- paging -->
            <script src="<c:url value="/resource/js/jquery.simplePagination.js"/>"></script>
            <script>
                $('#light-pagination').pagination({
                    pages: ${pageCount},
                    currentPage: ${(empty param.page) ? '1': param.page},
                    selectOnClick: false
                });

            </script>
            <!-- //paging -->

            <!-- price range (top products) -->
            <jsp:include page="fragment/js/pricerange.jsp" />
            <!-- //price range (top products) -->

            <!-- flexisel (for special offers) -->
            <jsp:include page="fragment/js/flexisel.jsp" />
            <!-- //flexisel (for special offers) -->
            <!-- //js-files -->

    </body>

</html>