<%-- 
    Document   : header
    Created on : Feb 15, 2019, 9:21:54 AM
    Author     : fkien
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- top-header -->
<div class="header-most-top">
    <p>Grocery Offer Zone Top Deals & Discounts</p>
</div>
<!-- //top-header -->
<!-- header-bot-->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <!-- header-bot-->
        <div class="col-md-4 logo_agile">
            <h1>
                <a href="home">
                    <span>C</span>ửa <span>H</span>àng <span>Đ</span>ồ <span>G</span>ỗ 
                </a>
            </h1>
        </div>
        <!-- header-bot -->
        <div class="col-md-8 header text-right">
            <!-- header lists -->
            <ul>
                <li>
                    <a href="#" data-toggle="modal" data-target="#myModal1">
                        <span class="fa fa-truck" aria-hidden="true"></span>Track Order</a>
                </li>
                <li>
                    <span class="fa fa-phone" aria-hidden="true"></span> ${not empty user}
                </li>

                <!-- display either user info, or login/register form -->
                <c:choose>
                    <c:when test="${not empty user}">
                        <li>
                            <div class="dropdown ">
                                <a href="#" class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Welcome ${user.username} <span class="caret"></span>
                                </a>
                                <div class="dropdown-menu pull-right" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="dashboard">Dashboard</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="logout">Logout</a>
                                </div>
                            </div>
                        </li>

                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#myModal1">
                                <span class="fa fa-unlock-alt" aria-hidden="true"></span> Sign In </a>
                        </li>
                        <li>
                            <a href="register">
                                <span class="fa fa-pencil-square-o" aria-hidden="true"></span> Sign Up </a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <!-- //display either user info, or login/register form -->
            </ul>

            <!-- //header lists -->
            <!-- search -->
            <div class="agileits_search">
                <form action="productlist" method="get">
                    <input name="searchquery" type="search" placeholder="How can we help you today?" required="">
                    <button type="submit" class="btn btn-default" aria-label="Left Align">
                        <span class="fa fa-search" aria-hidden="true"> </span>
                    </button>
                </form>
            </div>
            <!-- //search -->
            <!-- cart details -->
            <div class="top_nav_right">
                <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                    <form action="#" method="post" class="last">
                        <input type="hidden" name="cmd" value="_cart">
                        <input type="hidden" name="display" value="1">
                        <button class="w3view-cart" type="submit" name="submit" value="">
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <!-- //cart details -->
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<!-- remove login/register form when logged in, just in case -->
<c:if test="${empty user}">
    <!-- signin Model -->
    <!-- Modal1 -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body modal-body-sub_agile">
                    <div class="main-mailposi">
                        <span class="fa fa-envelope-o" aria-hidden="true"></span>
                    </div>
                    <div class="modal_body_left modal_body_left1">
                        <h3 class="agileinfo_sign">Sign In </h3>
                        <p>
                            Sign In now, Let's start your Grocery Shopping. Don't have an account?
                            <a href="register">
                                Sign Up Now</a>
                        </p>

                        <form:form id="loginForm" modelAttribute="login" action="login" method="post">
                            <div class="styled-input agile-styled-input-top">
                                <form:input path="username" placeholder = "Username" required="required" />
                            </div>
                            <div class="styled-input">
                                <form:password path="password" placeholder = "Password" required="required" />
                            </div>
                            <a href="login">Forget your password?</a><br>
                            <input type="submit" value="Login">
                        </form:form>

                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- //Modal content-->
        </div>
    </div>
    <!-- //Modal1 -->
    <!-- //signin Model -->
    
</c:if>
<!-- //header-bot -->