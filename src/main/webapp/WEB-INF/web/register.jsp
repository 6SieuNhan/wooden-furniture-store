<%-- 
    Document   : register
    Created on : Mar 28, 2019, 9:24:34 AM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
    <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
    <jsp:include page="fragment/metadump.jsp" />
</head>

<body>
    <!-- header -->
    <jsp:include page="fragment/header.jsp" />
    <!-- //header -->
    <!-- navbar -->
    <jsp:include page="fragment/navbar.jsp" />
    <!-- //navbar -->
    <!-- login page -->
    <div class="privacy">
        <div class="container">
            <!-- ripped CSS off checkout page -->
            <!-- register form -->
            <div class="address_form_agile col-md-12">
                <h4>Đăng ký</h4>
            </div>
            <form:form modelAttribute="login" action="register" method="post" cssClass="creditly-card-form agileinfo_form">
                <div class="address_form_agile col-md-6">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input id="username2" path="username" placeholder = "Tên đăng nhập" required="required" maxlength="30"
                                                oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                                <div class="controls">
                                    <form:input path="address" placeholder = "Địa chỉ" required="required"  maxlength="100"
                                                oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                                <div class="controls">
                                    <form:password path="password" id="password1" placeholder = "Mật khẩu (4-16 ký tự)" required="required" maxlength="16"/>
                                </div>
                                <c:if test="${not empty message}">
                                    <div class="simple-alert-msg" >
                                        ${message}
                                    </div>
                                </c:if>
                                <button class="submit check_out">Đăng ký</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="address_form_agile col-md-6">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input id="email" type="email"  path="email" placeholder = "Địa chỉ email" required="required" maxlength="50"/>
                                </div>
                                <div class="controls">
                                    <form:input id="phone" path="phone" placeholder = "Số điện thoại (10 ký tự)" maxlength="10"/>
                                </div>
                                <div class="controls">
                                    <input type="password" placeholder="Nhập lại mật khẩu" id="password2" required="" maxlength="16">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
            <div class="clearfix"> </div>

            <!-- //register form -->
        </div>
    </div>
    <!-- //login -->
    <!-- footer -->
    <jsp:include page="fragment/footer.jsp" />
    <!-- //footer -->
    <!-- copyright -->
    <jsp:include page="fragment/copyright.jsp" />
    <!-- //copyright -->
    <!-- js-files -->
    <jsp:include page="fragment/js/jsdump.jsp" />
    <!-- //js-files -->
    
    <!-- email script -->
    <jsp:include page="fragment/js/emailscript.jsp" />
    <!-- //email script -->
    
    <!-- password-script -->
    <jsp:include page="fragment/js/passwordscript.jsp" />
    <!-- //password-script -->

    <!-- phone script -->
    <jsp:include page="fragment/js/phonescript.jsp" />
    <!-- //phone script -->
</body>

</html>