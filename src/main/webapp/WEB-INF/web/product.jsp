<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
        <jsp:include page="fragment/metadump.jsp" />
    </head>

    <body>
        <!-- fb stuff -->
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>
        <!-- //fb stuff -->

        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" >
            <jsp:param name="page" value="product" />
        </jsp:include>
        <!-- //navbar -->
        <!-- Single Page -->
        <div class="banner-bootom-w3-agileits">
            <div class="container">
                <div class="col-md-5 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                            <ul id="slides" class="slides">
                                <c:if test="${empty imgList}">
                                    <li data-thumb="<c:url value="resource/images/default/no-image-available-md.png"/>">
                                        <div class="thumb-image">
                                            <img src="<c:url value="resource/images/default/no-image-available-md.png"/>" class="img-responsive" alt=""> </div>
                                    </li>
                                </c:if>
                                <!-- Product images -->
                                <c:forEach var="img" items="${imgList}">
                                    <li data-thumb="<c:url value="resource/images/product_img/${product.productCode}/${img}"/>">
                                        <div class="thumb-image">
                                            <img src="<c:url value="resource/images/product_img/${product.productCode}/${img}"/>" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                    </li>
                                </c:forEach>
                                <!-- //Product images -->
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 single-right-left simpleCart_shelfItem">
                    <h3>${product.productName}</h3>
                    <p>
                        <span class="item_price number">${product.price}</span>
                        <span class="item_price">đ</span>
                        <!--                        <label>Free delivery</label>-->
                    </p>
                    <div class="single-infoagile">
                        <ul>
                            <li>
                                Chất liệu: <c style="font-style: italic;">
                                <c:forEach var="pci" items="${productMaterialList}">
                                    <c:if test="${pci.categoryId == product.productMaterialId}">
                                        ${pci.categoryName}
                                    </c:if>
                                </c:forEach>
                            </c>
                            </li>
                            <li>
                                Nơi sản xuất: Cửa Hàng Đồ Gỗ Thủy Hằng
                            </li>
                            <br/>
                            <li>
                                <b style="color:green">${product.quantity}</b> sản phẩm có sẵn
                            </li>
                        </ul>
                    </div>
                    <div class="product-single-w3l">
                        MÔ TẢ SẢN PHẨM
                        <br/><br/>
                        ${product.description}
                    </div>
                    <br/>
                    <div class="occasion-cart">
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
                                            <input type="hidden" name="currency_code" value="VND" />
                                            <input type="submit" name="submit" value="Thêm vào giỏ hàng" class="button" />
                                        </c:otherwise>
                                    </c:choose>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-numposts="5"></div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //Single Page -->
        <!-- special offers -->
        <!-- //special offers -->
        <!-- footer -->
        <jsp:include page="fragment/footer.jsp" />
        <!-- //footer -->
        <!-- copyright -->
        <jsp:include page="fragment/copyright.jsp" />
        <!-- //copyright -->

        <!-- js-files -->
        <jsp:include page="fragment/js/jsdump.jsp" />
        <!-- imagezoom -->
        <script src="<c:url value="/resource/js/imagezoom.js" />"></script>
        <!-- //imagezoom -->
        <!-- FlexSlider -->
        <jsp:include page="fragment/js/flexslider.jsp" />
        <!-- //FlexSlider-->
        <!-- flexisel (for special offers) -->
        <jsp:include page="fragment/js/flexisel.jsp" />
        <!-- //flexisel (for special offers) -->
        <!-- price range (top products) -->
        <jsp:include page="fragment/js/pricerange.jsp" />
        <!-- //price range (top products) -->


        <!-- //js-files -->
    </body>

</html>