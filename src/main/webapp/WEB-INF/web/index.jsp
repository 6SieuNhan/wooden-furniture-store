<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
        <jsp:include page="fragment/metadump.jsp" />
        <!--        <style> 
                    body {
                        background-image: url("resource/images/homepage/untitled.png");
                        background-repeat: repeat;
                        background-color:white;
                    }
                </style>-->
    </head>

    <body>
        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" >
            <jsp:param name="page" value="index" />
        </jsp:include>
        <!-- //navbar -->
        <!-- banner -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                <li data-target="#myCarousel" data-slide-to="3" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Sang Trọng
                                <span></span>
                            </h3>
<!--                            <p>Get flat
                                <span>10%</span> Cashback</p>-->
                            <a class="button2" href="productlist">Mua ngay </a>
                        </div>
                    </div>
                </div>
                <div class="item item2">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Cao Cấp
                                <span></span>
                            </h3>
<!--                            <p>Get Upto
                                <span>30%</span> Off</p>-->
                            <a class="button2" href="productlist">Mua ngay </a>
                        </div>
                    </div>
                </div>
                <div class="item item3">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Chất Lượng
                                <span></span>
                            </h3>
<!--                            <p>Get Best Offer Upto
                                <span>20%</span>
                            </p>-->
                            <a class="button2" href="productlist">Mua ngay </a>
                        </div>
                    </div>
                </div>
                <div class="item item4">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Tinh Tế
                                <span></span>
                            </h3>
<!--                            <p>Get Now
                                <span>40%</span> Discount</p>-->
                            <a class="button2" href="productlist">Mua ngay </a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- //banner -->

        <!--         special offers -->        
        <div class="featured-section" id="projects">
            <div class="container">
                <!-- tittle heading  --> 
                <h3 class="tittle-w3l">Sản phẩm đặc biệt
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- tittle heading  --> 
                <div class="content-bottom-in">
                    <ul id="flexiselDemo1">
                        <c:forEach var = "product" items ="${productlistByTop}" varStatus = "loop">
                            <li>
                                <div class="w3l-specilamk">
                                    <div class="speioffer-agile imageHeight">
                                        <a href="product?productid=${product.productId}">
                                            <img class="resize" src="resource/images/product_img/${product.thumbnail}" alt="" onerror="this.src='<c:url value="resource/images/default/no-image-available-md.png"/>';">
                                        </a>
                                    </div>
                                    <div class="product-name-w3l">
                                        <h4>
                                            <a href="product?productid=${product.productId}">${product.productName}</a>
                                        </h4>
                                        <div class="w3l-pricehkj">
                                            <h6><span class="item_price number">${product.price}</span>
                                                <span class="item_price">đ</span></h6>
                                        </div>
                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                            <form action="#" method="post">
                                                <fieldset>
                                                    <c:choose>
                                                        <c:when test="${product.quantity == 0}">
                                                            <input type="submit" name="submit" value="Hết hàng" class="button" disabled />
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
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!--//special offers -->

        <!-- top Products -->
        <div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <!-- tittle heading -->
                <!-- product right -->
                <div class="agileinfo-ads-display">
                    <div class="wrapper">

                        <div class="product-sec1 w3l-welcome-info">
                            <div class="col-sm-6 col-xs-6 welcome-grids">
                                <div class="welcome-img">
                                    <a href="productlist?productroomid=1">
                                        <img src="<c:url value="resource/images/homepage/phong-khach.jpg"/>" class="img-responsive zoom-img" alt="">
                                        <p class="absolute-text"> Xem Mẫu Phòng Khách</p>    
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 welcome-grids">
                                <div class="welcome-img">
                                    <a href="productlist?productroomid=5">
                                        <img src="<c:url value="resource/images/homepage/phong-ngu.jpg"/>" class="img-responsive zoom-img" alt="">
                                        <p class="absolute-text"> Xem Mẫu Phòng Ngủ</p> 
                                    </a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                            <br/>
                            <div class="col-sm-6 col-xs-6 welcome-grids">
                                <div class="welcome-img">
                                    <a href="productlist?productroomid=3">
                                        <img src="<c:url value="resource/images/homepage/phong-bep.jpg"/>" class="img-responsive zoom-img" alt="">
                                        <p class="absolute-text">Xem Mẫu Phòng Bếp</p> 
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 welcome-grids">
                                <div class="welcome-img">
                                    <a href="productlist?productroomid=2">
                                        <img src="<c:url value="resource/images/homepage/phong-lam-viec.jpg"/>" class="img-responsive zoom-img" alt="">
                                        <p class="absolute-text">Xem Mẫu Phòng Làm Việc</p> 
                                    </a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-- //second section (nuts special) -->

                    </div>
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

        <!-- flexisel (for special offers) -->
        <jsp:include page="fragment/js/flexisel.jsp" />
        <!-- //flexisel (for special offers) -->
        <!-- //js-files -->


    </body>

</html>