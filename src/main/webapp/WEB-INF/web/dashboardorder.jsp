<%-- 
    Document   : userdashboard
    Created on : Mar 26, 2019, 3:01:02 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <c:choose>
                <c:when test="${user.userRoleId == 1}">
                    <jsp:include page="fragment/dashboardadminnav.jsp" >
                        <jsp:param name="page" value="order" />
                    </jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="fragment/dashboardusernav.jsp" >
                        <jsp:param name="page" value="order" />
                    </jsp:include>
                </c:otherwise>
            </c:choose>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Quản lý đặt hàng
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Lịch sử đặt hàng
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <!-- search form for admin -->
                                            <c:if test="${user.userRoleId == 1}">
                                                <div class="form-group">
                                                    <form action="dashboard" method="get" >
                                                        <label>Tìm kiếm theo tên người dùng:</label>
                                                        <input type="text" placeholder="Nhập từ khóa tìm kiếm"
                                                               name="searchquery" value="${param.searchquery}" maxlength="30">
                                                        <input type="hidden" id="action" name="action" value="order">
                                                        <button type="submit" value=" "><i class="fa fa-search"></i></button>
                                                    </form>
                                                    <c:if test="${not empty message}">
                                                        <div class="simple-alert-msg" >
                                                            ${message}
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </c:if>


                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <c:if test="${user.userRoleId == 1}">
                                                                <th>Tên khách hàng</th>
                                                                </c:if>
                                                            <th>Địa chỉ</th>
                                                            <th>E-mail</th>
                                                            <th>Số điện thoại</th>
                                                            <th>Ngày đặt hàng</th>
                                                            <th>Tình trạng đơn hàng</th>
                                                            <th></th>
                                                                <c:if test="${user.userRoleId == 1}">
                                                                <th></th>
                                                                </c:if>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="o" items="${orderList}">
                                                            <tr class="gradeA" >
                                                                <c:if test="${user.userRoleId == 1}">
                                                                    <td>${o.username}</td>
                                                                </c:if>
                                                                <td>${o.userAddress}</td>
                                                                <td>${o.userEmail}</td>
                                                                <td>${o.userPhone}</td>
                                                                <td>${o.orderDate}</td>
                                                                <c:forEach var="pci" items="${orderStatusList}">
                                                                    <c:if test="${pci.categoryId==o.orderStatusId}">
                                                                        <td>${pci.categoryName}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <td>
                                                                    <a href="dashboard?action=orderdetail&orderid=${o.orderId}">
                                                                        Xem
                                                                    </a>
                                                                </td>
                                                                <c:if test="${user.userRoleId == 1 || o.orderStatusId=='1' || o.orderStatusId=='2'  }">
                                                                    <td>
                                                                        <a href="deleteorder?orderid=${o.orderId}" onclick="return confirm('Bạn có muốn xóa đơn hàng này?')">
                                                                            Xóa
                                                                        </a>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <c:if test = "${empty orderList}">
                                                    <div class="notiSearch">
                                                        Không tìm được hóa đơn nào.
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
        <script src="<c:url value="/resource/js/jquery-2.1.4.min.js"/>"></script>
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


    </body>
</body>
</html>
