<%-- 
    Document   : userdashboard
    Created on : Mar 26, 2019, 3:01:02 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pci" value="${param.productcategoryid}" />
<c:set var="pmi" value="${param.productmaterialid}" />
<c:set var="poi" value="${param.productoriginid}" />
<c:set var="pri" value="${param.productroomid}" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
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
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><strong>bluebox</strong></a>
                </div>
            </nav>
            <!--/. NAV TOP  -->
            <jsp:include page="fragment/admindashboardnav.jsp" />
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Dashboard
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Order history
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <!-- search garbage -->
                                            <form action="dashboard?action=productlist" method="get"> 
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
                                            <!-- //search garbage -->
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Address</th>
                                                            <th>E-mail</th>
                                                            <th>Phone Number</th>
                                                            <th>Order Date</th>
                                                            <th>Order Status</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var = "product" items ="${productList}" varStatus = "loop">
                                                            <tr class="gradeA" >
                                                                <td>${product.productCode}</td>
                                                                <td>${product.productName}</td>
                                                                <td>${product.quantity}</td>
                                                                <td>${product.price}</td>
                                                                <td>
                                                                    <a href="edit?productid=${product.productId}">Edit</a>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <a href="delete?productid=${product.productId}" onclick="return confirm('Bạn có muốn xóa sản phẩm này?')">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <c:if test = "${empty productList}">
                                                    <div>
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


    </body>
</body>
</html>
