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
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | About Us :: w3layouts</title>
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
                        <li>About Us</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- about page -->
        <!-- welcome -->
        <div class="welcome">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Welcome to our Site
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="w3l-welcome-info">
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/about.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/about2.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="w3l-welcome-text">
                    <p>Nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus
                        omnis optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.Sed ut perspiciatis unde omnis iste
                        natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis
                        et quasi architecto beatae vitae </p>
                    <p>libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus
                        omnis optio cumque nihil impedit </p>
                </div>
            </div>
        </div>
        <!-- //welcome -->
        <!-- video -->
        <div class="about">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Our Video
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="about-tp">
                    <div class="col-md-8 about-agileits-w3layouts-left">
                        <iframe src="https://player.vimeo.com/video/15520702?color=ffffff&title=0&byline=0"></iframe>
                    </div>
                    <div class="col-md-4 about-agileits-w3layouts-right">
                        <div class="img-video-about">
                            <img src="<c:url value="resource/images/videoimg2.png"/>" alt="">
                        </div>
                        <h4>Grocery Shoppy</h4>
                        <p>No.1 Leading E-commerce marketplace with over 70 million Products</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- //video-->
        <!-- //about page -->
        <!-- newsletter -->
        <jsp:include page="fragment/newsletter.jsp" />
        <!-- //newsletter -->
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