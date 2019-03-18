<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Single :: w3layouts</title>
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
        <!-- page -->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">
                <div class="container">
                    <ul class="w3_short">
                        <li>
                            <a href="index.html">Home</a>
                            <i>|</i>
                        </li>
                        <li>Single Page</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- Single Page -->
        <div class="banner-bootom-w3-agileits">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Single Page
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="col-md-5 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                            <ul class="slides">
                                <c:if test="${empty product.imgList}">
                                    <li data-thumb="<c:url value="resource/images/default/no-image-available-md.png"/>">
                                        <div class="thumb-image">
                                            <img src="<c:url value="resource/images/default/no-image-available-md.png"/>" class="img-responsive" alt=""> </div>
                                    </li>
                                </c:if>
                                <!-- Product images -->
                                <c:forEach var="img" items="${product.imgList}">
                                    <li data-thumb="<c:url value="resource/images/${img}"/>">
                                        <div class="thumb-image">
                                            <img src="<c:url value="resource/images/${img}"/>" data-imagezoom="true" class="img-responsive" alt=""> </div>
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
                        <span class="item_price">$${product.price}</span>
                        <label>Free delivery</label>
                    </p>
                    <div class="single-infoagile">
                        <ul>
                            <li>
                                Cash on Delivery Eligible.
                            </li>
                            <li>
                                Shipping Speed to Delivery.
                            </li>
                            <li>
                                Sold and fulfilled by Supple Tek (3.6 out of 5 | 8 ratings).
                            </li>
                            <li>
                                ${product.quantity} in stock at
                                <span class="item_price">$${product.price}</span>
                            </li>
                        </ul>
                    </div>
                    <div class="product-single-w3l">
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
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </c:otherwise>
                                    </c:choose>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //Single Page -->
        <!-- special offers -->
        <div class="featured-section" id="projects">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Add More
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="content-bottom-in">
                    <ul id="flexiselDemo1">
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single.html">
                                        <img src="images/s1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single.html">Aashirvaad, 5g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$220.00</h6>
                                        <p>Save $40.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Aashirvaad, 5g" />
                                                <input type="hidden" name="amount" value="220.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single.html">
                                        <img src="images/s4.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single.html">Kissan Tomato Ketchup, 950g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$99.00</h6>
                                        <p>Save $20.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Kissan Tomato Ketchup, 950g" />
                                                <input type="hidden" name="amount" value="99.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single.html">
                                        <img src="images/s2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single.html">Madhur Pure Sugar, 1g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$69.00</h6>
                                        <p>Save $20.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Madhur Pure Sugar, 1g" />
                                                <input type="hidden" name="amount" value="69.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single2.html">
                                        <img src="images/s3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single2.html">Surf Excel Liquid, 1.02L</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$187.00</h6>
                                        <p>Save $30.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Surf Excel Liquid, 1.02L" />
                                                <input type="hidden" name="amount" value="187.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single.html">
                                        <img src="images/s8.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single.html">Cadbury Choclairs, 655.5g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$160.00</h6>
                                        <p>Save $60.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Cadbury Choclairs, 655.5g" />
                                                <input type="hidden" name="amount" value="160.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single2.html">
                                        <img src="images/s6.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single2.html">Fair & Lovely, 80 g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$121.60</h6>
                                        <p>Save $30.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Fair & Lovely, 80 g" />
                                                <input type="hidden" name="amount" value="121.60" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single.html">
                                        <img src="images/s5.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single.html">Sprite, 2.25L (Pack of 2)</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$180.00</h6>
                                        <p>Save $30.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Sprite, 2.25L (Pack of 2)" />
                                                <input type="hidden" name="amount" value="180.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="single2.html">
                                        <img src="images/s9.jpg" alt="">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="single2.html">Lakme Eyeconic Kajal, 0.35 g</a>
                                    </h4>
                                    <div class="w3l-pricehkj">
                                        <h6>$153.00</h6>
                                        <p>Save $40.00</p>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Lakme Eyeconic Kajal, 0.35 g" />
                                                <input type="hidden" name="amount" value="153.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
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