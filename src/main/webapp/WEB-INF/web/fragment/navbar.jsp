<%-- 
    Document   : navbar
    Created on : Feb 15, 2019, 8:08:16 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- navigation -->
<div class="ban-top">
    <div class="container">
        <div style="margin:auto;">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1" >
                        <ul class="nav navbar-nav menu__list">
                            <li class="
                                <c:if test= "${param.page == 'index'}">active</c:if>
                                ">
                                <a class="nav-stylehead" href="home">Trang chủ</a>
                            </li>
                            <li class="
                                <c:if test= "${param.page == 'product'}">active</c:if>
                                ">
                                <a class="nav-stylehead" href="productlist">Sản phẩm</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Danh mục
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-lg-6">
                                            <ul class="multi-column-dropdown">
                                                <c:forEach var="pci" items="${productCategoryList}" varStatus="loop">
                                                    <li>
                                                        <a href="productlist?productcategoryid=${pci.categoryId}">${pci.categoryName}</a>
                                                    </li>
                                                    <!-- Split list at 50% -->
                                                    <c:if test="${loop.index+1 >= productCategoryList.size()/2}">
                                                    </ul>
                                                </div>
                                                <div class="col-lg-6">
                                                    <ul class="multi-column-dropdown">
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Chất liệu
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-lg-12">
                                            <ul class="multi-column-dropdown">
                                                <c:forEach var="pci" items="${productMaterialList}" varStatus="loop">
                                                    <li>
                                                        <a href="productlist?productmaterialid=${pci.categoryId}">${pci.categoryName}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Không gian
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-lg-12">
                                            <ul class="multi-column-dropdown">
                                                <c:forEach var="pci" items="${productRoomList}">
                                                    <li>
                                                        <a href="productlist?productroomid=${pci.categoryId}">${pci.categoryName}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="
                                <c:if test= "${param.page == 'about'}">active</c:if>
                                ">
                                <a class="nav-stylehead" href="about">Giới thiệu</a>
                            </li>
                            <li class="
                                <c:if test= "${param.page == 'contact'}">active</c:if>
                                ">
                                <a class="nav-stylehead" href="contact">Liên hệ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- //navigation -->
