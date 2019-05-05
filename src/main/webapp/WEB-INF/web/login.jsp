<%-- 
    Document   : login
    Created on : Mar 20, 2019, 9:48:25 AM
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
            <!-- Login form -->
            <div class="col-xs-6 address_form_agile">
                <h4>Đăng nhập</h4>
                <br>
                <form:form modelAttribute="login" action="login" method="post" cssClass="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input path="username" placeholder = "Tên đăng nhập hoặc email" required="required" maxlength="30"
                                                oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                                <div class="controls">
                                    <form:password path="password" placeholder = "Mật khẩu" required="required" maxlength="16"
                                                   oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                            </div>
                            <c:if test="${not empty message}">
                                <div class="simple-alert-msg" >
                                    ${message}
                                </div>
                            </c:if>
                            <button class="submit check_out">Đăng nhập</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <!--Password recovery form -->
            <div class="col-xs-6 address_form_agile">
                <h4>Đặt lại mật khẩu</h4>
                <p>Bạn quên mật khẩu à? Hãy điền địa chỉ email vào trường phía dưới và chúng tôi sẽ gửi đường dẫn đến trang đặt lại mật khẩu</p>
                <br/>
                <form action="requestrecovery" method="post" class="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <input id="email" type="email" placeholder="mail@example.com" name="recoveryemail" required="" maxlength="30">
                                </div>
                            </div>
                            <c:if test="${not empty message2}">
                                <div class="simple-alert-msg" >
                                    ${message2}
                                </div>
                            </c:if>
                            <button class="submit check_out">Đặt lại mật khẩu của tôi</button>
                        </div>
                    </div>
                </form>
            </div>


            <div class="clearfix"> </div>
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
</body>

</html>

