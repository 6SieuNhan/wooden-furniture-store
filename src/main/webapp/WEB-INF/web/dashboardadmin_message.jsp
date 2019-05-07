<%-- 
    Document   : dashboardadmin_message
    Created on : Apr 8, 2019, 9:42:23 AM
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
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <jsp:include page="fragment/dashboardadminnav.jsp">
                <jsp:param name="page" value="messagelist" />
            </jsp:include>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Chi tiết tin nhắn
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Chi tiết tin nhắn
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <th colspan="3">Nội Dung</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">${messageObject.subject}</td>
                                                </tr>
                                                <tr>
                                                    <th>Người Gửi</th>
                                                    <th>Email</th>
                                                    <th>Thời Gian</th>
                                                </tr>
                                                <tr>
                                                    <td>${messageObject.senderName}</td>
                                                    <td>${messageObject.senderEmail}</td>
                                                    <td>${messageObject.date}</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="3">Tin Nhắn</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">${messageObject.message}</td>
                                                </tr>
                                            </table>
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

