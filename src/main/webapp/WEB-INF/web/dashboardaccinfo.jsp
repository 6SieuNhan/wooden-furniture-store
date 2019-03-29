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
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html"><strong>Cửa hàng đồ gỗ</strong></a>
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
            <jsp:include page="fragment/userdashboardnav.jsp" />
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Bảng thông tin
                    </h1>
                </div>

                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Account Information
                                    <button class="btn btn-default pull-right" onclick="toggle_inputs()">Edit</button>

                                    <div class="clearfix"></div>

                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <form:form modelAttribute="login" action="editaccinfo" method="post">
                                                <div class="form-group">
                                                    <label>Username: </label>
                                                    <p class="form-control-static">${user.username}</p>
                                                    <form:hidden disabled="true" path="userId" value="${user.userId}" />
                                                    <form:hidden disabled="true" path="username" value="${user.username}" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone number:</label>
                                                    <form:input disabled="true" cssClass="form-control" placeholder="Phone number" path="phone" value = "${user.phone}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <form:input disabled="true" cssClass="form-control" placeholder="youremail@example.com" path="email" value = "${user.email}" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <form:input disabled="true" cssClass="form-control" path="address" value = "${user.address}"/>
                                                </div>

                                                <div class="form-group">
                                                    <label>Confirm password: </label>
                                                    <form:password disabled="true" cssClass="form-control" path="password" />
                                                    <c:if test="${not empty message}">
                                                        <div class="simple-alert-msg" >
                                                            ${message}
                                                        </div>
                                                    </c:if>
                                                </div>

                                                <button disabled id="submit" type="submit" class="btn btn-default">Submit Button</button>
                                                <button id="reset" type="reset" class="btn btn-default" onclick="return confirm_reset()" on>Reset Button</button>
                                            </form:form>
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
                                                    function toggle_inputs() {
                                                        var inputs = document.getElementsByTagName('input');
                                                        for (var i = inputs.length, n = 0; n < i; n++) {
                                                            inputs[n].disabled = !inputs[n].disabled;
                                                        }
                                                        var textareas = document.getElementsByTagName('textarea');
                                                        for (var i = textareas.length, n = 0; n < i; n++) {
                                                            textareas[n].disabled = !textareas[n].disabled;
                                                        }
                                                        document.getElementById('submit').disabled = !document.getElementById('submit').disabled;
                                                    }

                                                    function confirm_reset() {
                                                        return confirm('Are you sure you want to reset the form?');
                                                    }
        </script>

    </body>
</body>
</html>
