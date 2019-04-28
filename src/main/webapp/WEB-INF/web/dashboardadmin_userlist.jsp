<%-- 
    Document   : dashboardadmin_userlist
    Created on : Apr 10, 2019, 8:46:13 AM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <jsp:param name="page" value="userlist" />
            </jsp:include>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Quản lý người dùng
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Danh sách người dùng
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <!-- search garbage -->
                                            <form action="dashboard" method="get" >
                                                <div class="search">
                                                    <input type="text" placeholder="Tên người dùng"
                                                           name="userquery" value="${param.userquery}" maxlength="30">
                                                    <input type="text" placeholder="Email"
                                                           name="emailquery" value="${param.emailquery}" maxlength="30">
                                                    <input type="text" placeholder="Địa chỉ"
                                                           name="addressquery" value="${param.addressquery}" maxlength="100">
                                                    <input type="text" placeholder="Số điện thoại"
                                                           name="phonequery" value="${param.phonequery}" maxlength="12">
                                                    <select name="userroleid">
                                                        <option value="0">All users</option>
                                                        <option
                                                            <c:if test="${param.userroleid == 1}">
                                                                selected
                                                            </c:if>
                                                            value="1">Admin</option>
                                                        <option
                                                            <c:if test="${param.userroleid == 2}">
                                                                selected
                                                            </c:if>
                                                                value="2">User</option>
                                                    </select>
                                                    <input type="hidden" id="action" name="action" value="userlist">
                                                </div>
                                                <div class="floatRight">
                                                    <button type="submit" value=" "><i class="fa fa-search"></i></button>
                                                </div>
                                            </form>
                                            <!-- //search garbage -->
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên người dùng</th>
                                                            <th>Email</th>
                                                            <th>Địa chỉ</th>
                                                            <th>Số điện thoại</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var = "u" items ="${userList}">
                                                            <tr>
                                                                <td>${u.username}</td>
                                                                <td>${u.email}</td>
                                                                <td>${u.address}</td>
                                                                <td>${u.phone}</td>
                                                                <td><a href="dashboard?action=order&userid=${u.userId}">Đơn hàng</a></td>
                                                                <td><a href="dashboard?action=accountinfo&userid=${u.userId}">Thông tin</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <c:if test = "${empty userList}">
                                                    <div class="notiSearch">
                                                        Không tìm được người dùng nào.
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
