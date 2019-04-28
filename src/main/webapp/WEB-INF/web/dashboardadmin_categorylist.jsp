<%-- 
    Document   : dashboardadmin_categorylist
    Created on : Apr 10, 2019, 2:53:41 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
        <link href=" <c:url value="/resource/css/adminpage/admincss.css" />" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <jsp:include page="fragment/dashboardadminnav.jsp">
                <jsp:param name="page" value="categorylist" />
            </jsp:include>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Quản lý các loại danh mục
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Danh sách các loại danh mục
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <!-- search garbage -->
                                            <div class="form-group">
                                                <label>Loại danh mục </label>
                                                <select name="categorytype" class="form-control" onchange="if (this.value)
                                                            window.location.href = 'dashboard?action=categorylist&categorytype=' + this.value" >
                                                    <option <c:if test="${categoryType == 0}">selected</c:if> value="0">Danh mục</option>
                                                    <option <c:if test="${categoryType == 1}">selected</c:if> value="1">Chất liệu</option>
                                                    <option <c:if test="${categoryType == 2}">selected</c:if> value="2">Xuất sứ</option>
                                                    <option <c:if test="${categoryType == 3}">selected</c:if> value="3">Không gian</option>
                                                    </select>
                                                </div>
                                                <!-- //search garbage -->
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Tên danh mục</th>
                                                                <th>Số lượng sản phẩm</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="o" items="${categoryList}" varStatus="loop">
                                                            <tr class="gradeA" >
                                                                <td>${loop.index+1}</td>
                                                                <td>
                                                                    <a 
                                                                        <c:choose>
                                                                            <c:when test="${categoryType == 0}">
                                                                                href="dashboard?action=productlist&productcategoryid=${o.categoryId}"
                                                                            </c:when>
                                                                            <c:when test="${categoryType == 1}">
                                                                                href="dashboard?action=productlist&productmaterialid=${o.categoryId}"
                                                                            </c:when>
                                                                            <c:when test="${categoryType == 2}">
                                                                                href="dashboard?action=productlist&productoriginid=${o.categoryId}"
                                                                            </c:when>
                                                                            <c:when test="${categoryType == 3}">
                                                                                href="dashboard?action=productlist&productroomid=${o.categoryId}"
                                                                            </c:when>

                                                                        </c:choose>
                                                                        >
                                                                        ${o.categoryName}
                                                                    </a>



                                                                </td>
                                                                <td>${o.productCount}</td>
                                                                <td>
                                                                    <a href="#edit" onclick="edit_mode('${o.categoryName}')">
                                                                        Edit
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${o.productCount==0}">
                                                                        <a href="deletecategory?categoryname=${o.categoryName}&categorytype=${categoryType}" onclick="return confirm('Bạn có muốn xóa mục này?')">
                                                                            Delete
                                                                        </a>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <c:if test = "${empty categoryList}">
                                                    <div class="notiSearch">
                                                        Không tìm được danh mục nào.
                                                    </div>
                                                </c:if>

                                            </div>


                                        </div>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <div id="edit"></div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Thêm/sửa danh mục
                                </div>
                                <div class="panel-body">
                                    <form role="form" action="savecategory" method="post">
                                        <div class="col-sm-7">
                                            <div class="form-group">
                                                <label>Tên danh mục cũ</label>
                                                <input id="old-category" name="oldcategory" class="form-control" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label>Tên danh mục mới</label>
                                                <input class="form-control" name="newcategory">
                                                <input type="hidden" name="categorytype" value="${categoryType}" maxlength="45"
                                                   oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')">
                                            </div>
                                            <c:if test="${not empty message}">
                                                <div class="simple-alert-msg" >
                                                    ${message}
                                                </div>
                                            </c:if>
                                            <button type="submit" class="btn btn-default">Lưu</button>
                                            <button type="reset" class="btn btn-default" onclick = "add_mode()">Hoàn Tác (Chuyển sang Thêm danh mục)</button>
                                        </div>
                                    </form>
                                </div>
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
        <script src="<c:url value="/resource/js/jquery-2.1.4.min.js"/>"></script>
        <!-- Bootstrap Js -->
        <script src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>

        <script src="<c:url value="/resource/js/jquery.simplePagination.js"/>"></script>

        <script>

                                                function edit_mode(oldCategory) {
                                                    document.getElementById('old-category').value = oldCategory;
                                                }

                                                function add_mode() {
                                                    document.getElementById('old-category').value = null;
                                                }

        </script>


    </body>
</body>
</html>