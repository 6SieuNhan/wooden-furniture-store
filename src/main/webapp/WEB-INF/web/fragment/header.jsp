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
    <p>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</p>
</div>
<!-- //top-header -->
<!-- header-bot-->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <!-- header-bot-->
        <div class="col-md-4 logo_agile">
            <h1>
                <a href="home">
                    <img style="width: 175px" src="<c:url value="/resource/images/homepage/logo2.jpg"/>" alt="Đồ gỗ Thủy Hằng ">
                </a>
            </h1>
        </div>
        <!-- header-bot -->
        <div class="col-md-8 header text-right">
            <!-- header lists -->
            <ul>
                <!-- display either user info, or login/register form -->
                <c:choose>
                    <c:when test="${not empty user}">
                        <li>
                            <div class="dropdown ">
                                <a href="#" class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Xin chào, ${user.username} <span class="caret"></span>
                                </a>
                                <div class="dropdown-menu pull-right" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="dashboard">Bảng điều khiển</a>
                                    <a class="dropdown-item" href="logout">Đăng xuất</a>
                                </div>
                            </div>
                        </li>

                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#myModal1">
                                <span class="fa fa-unlock-alt" aria-hidden="true"></span> Đăng nhập </a>
                        </li>
                        <li>
                            <a href="register">
                                <span class="fa fa-pencil-square-o" aria-hidden="true"></span> Đăng ký </a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <!-- //display either user info, or login/register form -->
            </ul>

            <!-- //header lists -->
            <!-- search -->
            <div class="agileits_search">
                <form action="productlist" method="get">
                    <input name="searchquery" type="search" placeholder="Tìm kiếm sản phẩm ...">
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
                        <h3 class="agileinfo_sign">Đăng nhập</h3>
                        <p>
                            Bạn chưa có tài khoản à?
                            <a href="register">
                                Đăng ký ngay</a>
                        </p>

                        <form:form id="loginForm" modelAttribute="login" action="login" method="post">
                            <div class="styled-input agile-styled-input-top">
                                <form:input path="username" placeholder = "Tên đăng nhập hoặc email" required="required" maxlength="50" 
                                            oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                            </div>
                            <div class="styled-input">
                                <form:password path="password" placeholder = "Mật khẩu" required="required" maxlength="16" 
                                               oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                            </div>
                            <a href="login">Quên mật khẩu?</a><br>
                            <input type="submit" value="Đăng nhập">
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