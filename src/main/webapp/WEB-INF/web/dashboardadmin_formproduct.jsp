<%-- 
    Document   : dashboardadmin_formproduct
    Created on : Apr 1, 2019, 10:33:13 AM
    Author     : Đào Minh Quang
--%>
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
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
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href=" <c:url value="/resource/css/adminpage/admincss.css" />" rel="stylesheet" type="text/css" media="all" />

        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home"><strong>Cửa hàng đồ gỗ</strong></a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li style="color: white;">
                        Welcome ${user.username}
                    </li>
                    <li>
                        <a href="logout">Sign Out</a>
                    </li>
                </ul>
            </nav>
            <!--/. NAV TOP  -->
            <jsp:include page="fragment/dashboardadminnav.jsp" />
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
                                    ${formTitle}
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form:form action="saveProduct" method="POST" modelAttribute="productForm">
                                                <form:hidden path="productId" />
                                                <div class="col-6">
                                                    <p>      
                                                        <label class="w3-text-brown"><b>Mã sản phẩm</b></label>
                                                        <c:if test="${not empty message}">
                                                        <div class="simple-alert-msg" >
                                                            ${message}
                                                        </div>
                                                        </c:if>
                                                    <form:input class="form-control" path="productCode" required="required"/>

                                                    </p>   
                                                    <p>
                                                        <label class="w3-text-brown"><b>Tên sản phẩm</b></label>
                                                        <form:input class="form-control" path="productName" required="required"/>
                                                    </p>
                                                    <p><form:errors path="productName" class="error-message" /></p>

                                                    <div id="myform">
                                                        <label class="w3-text-brown"><b>Hình đại diện</b></label>
                                                        <form:input id="img-txt" class="form-control" path="thumbnail" placeholder="CT-1/1.jpg" maxlength="45"/>
                                                        <img id="img-preview" src="resource/images/product_img/${productForm.thumbnail}" class="preview1" alt="Image not found"/>

                                                    </div>                 
                                                    <p>
                                                        <label class="w3-text-brown"><b>Mô tả sản phẩm</b></label>
                                                        <br>
                                                        <form:textarea  path="description" placeholder="Giới thiệu về sản phẩm" rows="5" cols="80" required="required"/>
                                                    </p>
                                                </div>
                                                <div class="col-6 right_side">
                                                    <p>
                                                        <label class="w3-text-brown"><b>Thuộc danh mục</b></label>
                                                        <br>
                                                        <form:select path="productCategoryId" cssClass="form-control">
                                                            <c:forEach var="pcm" items="${productCategoryList}" >
                                                                <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </p>
                                                    <p>
                                                        <label class="w3-text-brown"><b>Thuộc chất liệu</b></label>
                                                        <br>
                                                        <form:select path="productMaterialId" cssClass="form-control">
                                                            <c:forEach var="pcm" items="${productMaterialList}" >
                                                                <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </p>
                                                    <p>
                                                        <label class="w3-text-brown"><b>Thuộc phòng</b></label>
                                                        <br>
                                                        <form:select path="productRoomId" cssClass="form-control">
                                                            <c:forEach var="pcm" items="${productRoomList}" >
                                                                <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </p>
                                                    <p>
                                                        <label class="w3-text-brown"><b>Nơi sản xuất</b></label>
                                                        <br>
                                                        <form:select path="productOriginId" cssClass="form-control">
                                                            <c:forEach var="pcm" items="${productOriginList}" >
                                                                <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </p>
                                                    <p>
                                                        <label class="w3-text-brown"><b>Giá bán (VNĐ)</b></label>
                                                        <form:input type="number" class="form-control" path="price" required="required"/>
                                                    </p>
                                                    <p>
                                                        <label class="w3-text-brown"><b>Số lượng</b></label>
                                                        <form:input type="number" min="0" step="1" class="form-control" path="quantity" pattern="\d+" required="required"/>
                                                    </p>
                                                    <p class="floatLeft">
                                                        <button class="w3-btn w3-blue submit"><i class="fa fa-save"></i> Lưu Dữ Liệu</button>
                                                    </p>
                                                </div>
                                            </form:form>
                                            <p class="floatRight">
                                                <a href="dashboard?action=productlist" onclick="return confirm('Bạn có muốn thoát không?')">
                                                    <button class="w3-btn w3-blue" ><i class="fa fa fa-sign-out"></i> Thoát</button>
                                                </a>
                                            </p>

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
                                                    $('#img-txt').on('input', function () {
                                                        $('#img-preview').attr("src", 'resource/images/product_img/' + $(this).val());
                                                    });

        </script>

    </body>
</html>
