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
        <link rel="shortcut icon" href="<c:url value="/resource/images/homepage/logo1.jpg"/>" />
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
                        Đơn hàng chi tiết
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
                                        <div class="col-lg-8">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Số lượng</th>
                                                            <th>Tổng giá</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="od" items="${order.orderDetailList}" varStatus="loop">
                                                            <tr class="gradeA clickable-row" role="button" data-href="home">
                                                                <td>${loop.index+1}</td>
                                                                <td>
                                                                    <a 
                                                                        <c:choose>
                                                                            <c:when test="${user.userRoleId == 1}">
                                                                                href="edit?productid=${od.productId}"
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                href="product?productid=${od.productId}"
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        >
                                                                        ${od.product.productName}
                                                                    </a>
                                                                </td>
                                                                <td><span class="number">${od.price}</span>đ</td>
                                                                <td>${od.quantity}</td>
                                                                <td><span class="number">${od.total}</span>đ</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <table class="table table-borderless">
                                                    <tr>
                                                        <td>Tổng tiền:</td>
                                                        <td><label class="pull-right"><span class="number">${total}</span>đ</label></td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <label>Địa Chỉ</label>
                                            <div>${order.userAddress}</div>
                                            <label>Email</label>
                                            <div>${order.userEmail}</div>
                                            <label>Số Điện Thoại</label>
                                            <div>${order.userPhone}</div>
                                            <label>Tình trạng đơn hàng</label>
                                            <div>
                                                <c:choose>
                                                    <c:when test="${user.userRoleId == 1 && order.orderStatusId != 4}">
                                                        <form action="changeorderstatus">
                                                            <input type="hidden" name="orderid" value="${order.orderId}" />
                                                            <select name="orderstatusid" class="form-control">
                                                                <c:forEach var="pci" items="${orderStatusList}">
                                                                    <c:if test="${pci.categoryId>=order.orderStatusId}">
                                                                        <option
                                                                        <c:if test="${pci.categoryId==order.orderStatusId}">
                                                                            selected
                                                                        </c:if>
                                                                        value="${pci.categoryId}">${pci.categoryName}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                            <input type="submit" class="btn btn-default" value="Thay đổi trạng thái">
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="pci" items="${orderStatusList}">
                                                            <c:if test="${pci.categoryId==order.orderStatusId}">
                                                                <div>${pci.categoryName}</div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <c:if test="${user.userRoleId == 1 || order.orderStatusId=='1' || order.orderStatusId=='2'  }">
                                                <br>
                                                <a role="button" class="btn btn-default" href="deleteorder?orderid=${order.orderId}" onclick="return confirm('Bạn có muốn xóa đơn hàng này?')">
                                                    Xóa
                                                </a>
                                            </c:if>
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

        <!-- number -->
        <script src="<c:url value="/resource/js/jquery.number.min.js"/>"></script>
        <script>
            $('span.number').number(true, 0, '.', ' ');
        </script>
        
        <script>
                                                    jQuery(document).ready(function ($) {
                                                        $(".clickable-row").click(function () {
                                                            window.location = $(this).data("href");
                                                        });
                                                    });
        </script>

    </body>
</body>
</html>
