<%-- 
    Document   : userdashboard
    Created on : Mar 26, 2019, 3:01:02 PM
    Author     : fkien
--%>
<%@page import="java.text.DecimalFormat"%>
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pci" value="${param.productcategoryid}" />
<c:set var="pmi" value="${param.productmaterialid}" />
<c:set var="poi" value="${param.productoriginid}" />
<c:set var="pri" value="${param.productroomid}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Bluebox Free Bootstrap Admin Template</title>
        <!-- Bootstrap Styles-->
        <link href="<c:url value="/resource/css/bootstrap.css"/>" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="<c:url value="/resource/css/font-awesome.css"/>" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="<c:url value="/resource/js/dashboard/morris/morris-0.4.3.min.css"/>" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="<c:url value="/resource/css/dashboard/custom-styles.css"/>" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="simple.money.format.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
        <link href=" <c:url value="/resource/css/adminpage/admincss.css" />" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <c:choose>
                <c:when test="${user.userRoleId == 1}">
                    <jsp:include page="fragment/dashboardadminnav.jsp" >
                        <jsp:param name="page" value="productlist" />
                    </jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="fragment/dashboardusernav.jsp" >
                        <jsp:param name="page" value="productlist" />
                    </jsp:include>
                </c:otherwise>
            </c:choose>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Quản lý sản phẩm
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Danh sách sản phẩm
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <!-- search garbage -->
                                            <form action="dashboard?action=productlist" method="get" >
                                                <div class="search">
                                                    <input type="text" placeholder="Nhập từ khóa tìm kiếm"
                                                           name="searchquery" value="${param.searchquery}"/>
                                                    <input type="hidden" id="action" name="action" value="productlist"/>
                                                    <button type="submit" value=" "><i class="fa fa-search"></i></button>      
                                                </div>
                                                <div class="filCate">
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

                                                </div>
                                            </form> 
                                            <div class="floatRight">
                                                <a href="createProduct">
                                                    <button class="button">Create Product</button>
                                                </a>
                                            </div>


                                            <!-- //search garbage -->
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Hình ảnh</th>
                                                            <th>Số lượng</th>
                                                            <th>Giá (VNĐ)</th>
                                                            <th>Sản phẩm đặc biệt</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var = "product" items ="${productList}" varStatus = "loop">
                                                            <tr>

                                                                <td>${product.productCode}</td>
                                                                <td>${product.productName}</td>
                                                                <td class="imageWidth">
                                                                    <img class="resize" src="<c:url value="resource/images/product/${product.thumbnail}"/> " alt="">
                                                                </td>
                                                                <td>${product.quantity}</td>
                                                                <td>
                                                                    <span id="money">${product.price}</span>
                                                                </td>
                                                                <td width="5px">
                                                                    <c:if test="${product.product_top}">
                                                                         <input type="checkbox" checked disabled>
                                                                    </c:if>
                                                                    <c:if test="${!product.product_top}">
                                                                         <input type="checkbox" disabled>
                                                                    </c:if>
                                                                </td>
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
                                                    </tbody>
                                                </table>
                                                <c:if test = "${empty productList}">
                                                    <div class="notiSearch">
                                                        No product with this keyword can be found.
                                                    </div>
                                                </c:if>

                                                <div class="pagination-holder clearfix">
                                                    <div id="light-pagination" class="pagination pull-right"></div>
                                                </div>

                                            </div>


                                        </div>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p></footer>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap Js -->
        <script src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>

        <script src="<c:url value="/resource/js/jquery.simplePagination.js"/>"></script>
        <script>
                                                                        $('#light-pagination').pagination({
                                                                            pages: ${pageCount},
                                                                            currentPage: ${(empty param.page) ? '1': param.page},
                                                                            selectOnClick: false
                                                                        });

        </script>


        <!-- Metis Menu Js -->
        <script src="<c:url value="/resource/js/dashboard/jquery.metisMenu.js"/>"></script>
        <!-- Morris Chart Js -->
        <script src="<c:url value="/resource/js/dashboard/morris/raphael-2.1.0.min.js"/>"></script>
        <script src="<c:url value="/resource/js/dashboard/morris/morris.js"/>"></script>


        <script src="<c:url value="/resource/js/dashboard/easypiechart.js"/>"></script>
        <script src="<c:url value="/resource/js/dashboard/easypiechart-data.js"/>"></script>

        <script src="<c:url value="/resource/js/dashboard/Lightweight-Chart/jquery.chart.js"/>"></script>

        <!-- Custom Js -->
        <script src="<c:url value="/resource/js/dashboard/custom-scripts.js"/>"></script>

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
    </body>
</body>
</html>
