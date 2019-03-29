<%-- 
    Document   : AdminPage
    Created on : Mar 10, 2019, 1:49:12 AM
    Author     : Đào Minh Quang
--%>
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pci" value="${param.productcategoryid}" />
<c:set var="pmi" value="${param.productmaterialid}" />
<c:set var="poi" value="${param.productoriginid}" />
<c:set var="pri" value="${param.productroomid}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Page</title>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href=" <c:url value="/resource/css/adminpage/styles.css" />" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div id="page-wrapper">

            <div id="wrapper">
                <div id="header-most-top">
                    <p>Grocery Offer Zone Top Deals & Discounts</p>
                </div>
                <div class="header-top">
                    <div class="csslogout">
                        <span> Welcome: ${user.username} </span>
                        <br>
                        <a href="logout">Sign Out</a>
                    </div>
                    <div class="col-12 logo_agile">
                        <h1>
                            <a href="index.html">
                                <span>A</span>DMIN
                                <span>P</span>AGE
                                <img src="images/logo2.png" alt=" ">
                            </a>
                        </h1>
                        <%@include file="fragment/menubar.jsp" %>
                    </div>
                </div>

                <div class="col-12">

                    <table border="1" cellpadding="1">
                        <caption>
                            <h2>List of Products</h2>
                            <c:if test="${not empty message}">
                                <div class=" col-6 message">${message}</div>
                            </c:if>
                            <form action="adminpage" method="get"> 
                                <div class="col-3 search">
                                    <input type="text" placeholder="Nhập từ khóa tìm kiếm"
                                           name="searchquery" value="${param.searchquery}">
                                    <button type="submit" value=" "><i class="fa fa-search"></i></button>      
                                </div>
                                <div class="col-6 filCate">
                                    <select name="productcategoryid" id="first">
                                        <option value="" selected="selected">Danh mục (Tất cả)</option>
                                        <optgroup>
                                            <c:forEach var="pcm" items="${productCategoryList}" >
                                                <option value="${pcm.categoryId}"
                                                        <c:if test="${pcm.categoryId==pci}">
                                                            selected="selected"
                                                        </c:if>
                                                        >${pcm.categoryName}
                                                </option>
                                            </c:forEach>
                                        </optgroup>
                                    </select>
                                    <select name="productmaterialid" id="second">
                                        <option value="" selected>Chất liệu (Tất cả)</option>
                                        <optgroup >
                                            <c:forEach var="pcm" items="${productMaterialList}" >
                                                <option value="${pcm.categoryId}"
                                                        <c:if test="${pcm.categoryId==pmi}">
                                                            selected="selected"
                                                        </c:if>
                                                        >${pcm.categoryName}</option>
                                            </c:forEach>
                                        </optgroup>
                                    </select>
                                    <select name="productroomid" id="three">
                                        <option value="" selected>Phòng (Tất cả)</option>
                                        <optgroup >
                                            <c:forEach var="pcm" items="${productRoomList}" >
                                                <option value="${pcm.categoryId}"
                                                        <c:if test="${pcm.categoryId==pri}">
                                                            selected="selected"
                                                        </c:if>
                                                        >${pcm.categoryName}</option>
                                            </c:forEach>
                                        </optgroup>
                                    </select>
                                    <select name="productoriginid">
                                        <c:forEach var="pcm" items="${productOriginList}" >
                                            <option value="${pcm.categoryId}"
                                                    <c:if test="${pcm.categoryId==poi}">
                                                        selected="selected"
                                                    </c:if>
                                                    >${pcm.categoryName}</option>
                                        </c:forEach>
                                    </select>
                            </form>
                            </div>  

                            <div class="floatRight">
                                <a href="createProduct"><button class="button">Create Product</button></a>
                            </div>
                        </caption>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>

                        </tr>
                        <c:forEach var = "product" items ="${productList}" varStatus = "loop">
                            <tr>
                                <td><c:out value="${product.productCode}" /></td>
                                <td><c:out value="${product.productName}" /></td>



                                <td><c:out value="${product.quantity}" /></td>
                                <td><c:out value="${product.price}" /></td>

                                <td>
                                    <a href="edit?productid=${product.productId}">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                    <a href="delete?productid=${product.productId}" onclick="return confirm('Bạn có muốn xóa sản phẩm này?')">Delete</a>

                                </td>
                            </tr>
                            <c:if test="${(loop.index + 1)!= fn:length(productList) && (loop.index+1) % 3 == 0}">
                                <div class="clearfix"></div>
                                <div class="product-sec1"></div>
                            </c:if>
                        </c:forEach>

                    </table>
                    <div class="pagination-holder clearfix">
                        <c:if test = "${empty productList}">
                            <div class="notiSearch">
                                No product with this keyword can be found.
                            </div>
                        </c:if>
                        <div id="light-pagination" class="pagination"></div>
                    </div>
                </div>

            </div>
        </div>

        <!-- jquery -->
        <script src="<c:url value="/resource/js/jquery-2.1.4.min.js"/>"></script>
        <!-- //jquery -->

        <!-- paging -->
        <script src="<c:url value="/resource/js/jquery.simplePagination.js"/>"></script>
        <script>
                                        $('#light-pagination').pagination({
                                            pages: ${pageCount},
                                            currentPage: ${(empty param.page) ? '1': param.page},
                                            selectOnClick: false
                                        });

        </script>
        <script>
            $(function () {
                $('optgroup').each(function () {
                    var
                            optgroup = $(this),
                            options = optgroup.children().toArray().sort(function (a, b) {
                        return $(a).text() < $(b).text() ? 1 : -1;
                    });
                    $.each(options, function (i, v) {
                        optgroup.prepend(v);
                    });

                });
            });
        </script>
        <!-- //paging -->


    </body>
</html>
