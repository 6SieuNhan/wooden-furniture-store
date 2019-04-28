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
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <c:choose>
                <c:when test="${user.userRoleId == 1}">
                    <jsp:include page="fragment/dashboardadminnav.jsp" >
                        <jsp:param name="page" value="accountinfo" />
                    </jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="fragment/dashboardusernav.jsp" >
                        <jsp:param name="page" value="accountinfo" />
                    </jsp:include>
                </c:otherwise>
            </c:choose>

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
                                    Thông tin tài khoản
                                    <button class="btn btn-default pull-right" onclick="toggle_inputs()">Sửa</button>

                                    <div class="clearfix"></div>

                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <c:choose>
                                                <c:when test="${user.userRoleId == 1 && not empty param.userid}">
                                                    <!-- form for admin to edit other user accounts -->

                                                    <form:form modelAttribute="login" action="editaccinfoadmin" method="post">
                                                        <div class="form-group">
                                                            <label>Tên đăng nhập: </label>
                                                            <p class="form-control-static">${user2.username}</p>
                                                            <form:hidden disabled="true" path="userId" value="${user2.userId}" />
                                                            <form:hidden disabled="true" path="username" value="${user2.username}" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Số điện thoại:</label>
                                                            <form:input id="phone" required="required" disabled="true" cssClass="form-control" placeholder="Phone number" path="phone" value = "${user2.phone}" maxlength="10"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <form:input id="email" required="required" type="email" disabled="true" cssClass="form-control" placeholder="youremail@example.com" path="email" value = "${user2.email}" maxlength="50"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Địa chỉ</label>
                                                            <form:input required="required" disabled="true" cssClass="form-control" path="address" value = "${user2.address}" maxlength="100"
                                                                        oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Quyền người dùng</label>
                                                            <select disabled="true" class="form-control" name="userRoleId">
                                                                <c:forEach var = "pci" items ="${userRoleList}">
                                                                    <option value="${pci.categoryId}"
                                                                            <c:if test="${pci.categoryId == user2.userRoleId}">selected="selected"</c:if>
                                                                            >${pci.categoryName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <button disabled id="submit" type="submit" class="btn btn-default">Submit Button</button>
                                                        <button id="reset" type="reset" class="btn btn-default" onclick="return confirm_reset()" on>Reset Button</button>
                                                    </form:form>

                                                </c:when>
                                                <c:otherwise>
                                                    <!-- form for user to edit their own user account -->

                                                    <form:form modelAttribute="login" action="editaccinfo" method="post">
                                                        <div class="form-group">
                                                            <label>Tên đăng nhập: </label>
                                                            <p class="form-control-static">${user.username}</p>
                                                            <form:hidden disabled="true" path="username" value="${user.username}" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Số điện thoại:</label>
                                                            <form:input id="phone" required="required" disabled="true" cssClass="form-control" placeholder="Phone number" path="phone" value = "${user.phone}" maxlength="12"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <form:input id="email" required="required" type="email" disabled="true" cssClass="form-control" placeholder="youremail@example.com" path="email" value = "${user.email}" maxlength="50"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Địa chỉ</label>
                                                            <form:input required="required" disabled="true" cssClass="form-control" path="address" value = "${user.address}" maxlength="100"
                                                                        oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Xác nhận mật khẩu: </label>
                                                            <form:password required="required" disabled="true" cssClass="form-control" path="password" maxlength="16"
                                                                           oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                                            <c:if test="${not empty message}">
                                                                <div class="simple-alert-msg" >
                                                                    ${message}
                                                                </div>
                                                            </c:if>
                                                        </div>

                                                        <button disabled id="submit" type="submit" class="btn btn-default">Lưu</button>
                                                        <button id="reset" type="reset" class="btn btn-default" onclick="return confirm_reset()" on>Hoàn Tác</button>
                                                    </form:form>
                                                </c:otherwise>

                                            </c:choose>
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


        <!-- email script -->
        <jsp:include page="fragment/js/emailscript.jsp" />
        <!-- //email script -->

        <!-- phone script -->
        <jsp:include page="fragment/js/phonescript.jsp" />
        <!-- //phone script -->

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
            var selects = document.getElementsByTagName('select');
            for (var i = selects.length, n = 0; n < i; n++) {
                selects[n].disabled = !selects[n].disabled;
            }
            document.getElementById('submit').disabled = !document.getElementById('submit').disabled;
        }

        function confirm_reset() {
            return confirm('Bạn có muốn hoàn lại tất cả các trường hay không?');
        }
        </script>

    </body>
</body>
</html>
