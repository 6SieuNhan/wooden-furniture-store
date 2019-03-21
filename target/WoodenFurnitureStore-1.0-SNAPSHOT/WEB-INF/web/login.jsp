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
    <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Checkout :: w3layouts</title>
    <jsp:include page="fragment/metadump.jsp" />
</head>

<body>
    <!-- header -->
    <jsp:include page="fragment/header.jsp" />
    <!-- //header -->
    <!-- navbar -->
    <jsp:include page="fragment/navbar.jsp" />
    <!-- //navbar -->
    <!-- page -->
    <jsp:include page="fragment/breadcrumbs.jsp" />
    <!-- //page -->
    <!-- login page -->
    <div class="privacy">
        <div class="container">
            <!-- ripped CSS off checkout page -->
            <!-- Login form -->
            <div class="col-xs-6 address_form_agile">
                <h4>Login</h4>
                <br>
                <form:form modelAttribute="login" action="login" method="post" cssClass="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input path="username" placeholder = "Username" required="required" />
                                </div>
                                <div class="controls">
                                    <form:password path="password" placeholder = "Password" required="required" />
                                </div>
                            </div>
                            <c:if test="${not empty message}">
                                <div class="simple-alert-msg" >
                                    ${message}
                                </div>
                            </c:if>
                            <button class="submit check_out">Login</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <!--Password recovery form -->
            <div class="col-xs-6 address_form_agile">
                <h4>Password Recovery</h4>
                <p>Forgot your password? Fill in your email address and we'll send you a recovery link:</p>
                <br/>
                <form action="requestrecovery" method="post" class="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <input type="text" placeholder="mail@example.com" name="recoveryemail" required="">
                                </div>
                            </div>
                            <c:if test="${not empty message2}">
                                <div class="simple-alert-msg" >
                                    ${message2}
                                </div>
                            </c:if>
                            <button class="submit check_out">Reset my Password</button>
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
</body>

</html>

