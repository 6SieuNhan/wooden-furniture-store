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
                        <jsp:param name="page" value="editpassword" />
                    </jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="fragment/dashboardusernav.jsp" >
                        <jsp:param name="page" value="editpassword" />
                    </jsp:include>
                </c:otherwise>
            </c:choose>

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Thay đổi mật khẩu
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Thay Đổi Mật Khẩu
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <form:form modelAttribute="login" action="editpassword" method="post">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Mật Khẩu Mới </label>
                                                    <input required id="password1" name="password1" type="password" class="form-control" maxlength="16">
                                                </div>
                                                <div class="form-group">
                                                    <label>Xác Nhận Mật Khẩu Cũ:</label>
                                                    <form:hidden path="userId" value="${user.userId}" />
                                                    <form:hidden path="username" value="${user.username}" />
                                                    <form:password required="required" cssClass="form-control" path="password" 
                                                                   oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                                    <c:if test="${not empty message}">
                                                        <div class="simple-alert-msg" >
                                                            ${message}
                                                        </div>
                                                    </c:if>
                                                </div>

                                                <button id="submit" type="submit"  class="btn btn-default">Lưu</button>
                                                <button id="reset" type="reset" class="btn btn-default" onclick="return confirm_reset()" on>Hoàn Tác</button>

                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Xác Nhận Mật Khẩu Mới:</label>
                                                    <input required id="password2" name="password2" type="password" class="form-control" maxlength="16">
                                                </div>
                                            </div>
                                        </form:form>
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

        <!-- password-script -->
        <jsp:include page="fragment/js/passwordscript.jsp" />
        <!-- //password-script -->

        <script>
                                                    function confirm_reset() {
                                                        return confirm('Bạn có muốn hoàn lại tất cả các trường hay không?');
                                                    }
        </script>

    </body>
</body>
</html>
