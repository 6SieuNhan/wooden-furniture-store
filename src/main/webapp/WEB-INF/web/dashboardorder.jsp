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
                                            <!-- search form for admin -->
                                            <c:if test="${user.userRoleId == 1}">
                                                <div class="form-group">
                                                    <form action="dashboard" method="get" >
                                                        <label>Tìm kiếm theo tên người dùng:</label>
                                                        <input type="text" placeholder="Nhập từ khóa tìm kiếm"
                                                               name="searchquery" value="${param.searchquery}">
                                                        <input type="hidden" id="action" name="action" value="order">
                                                        <button type="submit" value=" "><i class="fa fa-search"></i></button>
                                                    </form>
                                                </div>
                                            </c:if>


                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <c:if test="${user.userRoleId == 1}">
                                                                <th>Username</th>
                                                                </c:if>
                                                            <th>Address</th>
                                                            <th>E-mail</th>
                                                            <th>Phone Number</th>
                                                            <th>Order Date</th>
                                                            <th>Order Status</th>
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
                                                                        View
                                                                    </a>
                                                                </td>
                                                                <c:if test="${user.userRoleId == 1 || o.orderStatusId=='1' || o.orderStatusId=='2'  }">
                                                                    <td>
                                                                        <a href="deleteorder?orderid=${o.orderId}" onclick="return confirm('Bạn có muốn xóa đơn hàng này?')">
                                                                            Delete
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
