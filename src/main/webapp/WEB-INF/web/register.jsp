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
            <!-- register form -->
            <div class="address_form_agile col-md-12">
                <h4>Login</h4>
                <p>
                    Come join the Grocery Shoppy! Let's set up your Account.
                </p>
            </div>
            <form:form modelAttribute="login" action="register" method="post" cssClass="creditly-card-form agileinfo_form">
                <div class="address_form_agile col-md-6">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input path="username" placeholder = "Username" required="required" maxlength="30"/>
                                </div>
                                <div class="controls">
                                    <form:input path="address" placeholder = "Address" required="required"  maxlength="100"/>
                                </div>
                                <div class="controls">
                                    <form:password path="password" id="password1" placeholder = "Password" required="required"  maxlength="30"/>
                                </div>
                                <c:if test="${not empty message}">
                                    <div class="simple-alert-msg" >
                                        ${message}
                                    </div>
                                </c:if>
                                <button class="submit check_out">Sign up</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="address_form_agile col-md-6">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <div class="controls">
                                    <form:input path="email" placeholder = "Email address" required="required" maxlength="45"/>
                                </div>
                                <div class="controls">
                                    <form:input path="phone" placeholder = "Phone number (maximum 12 characters)" required="required" maxlength="12"/>
                                </div>
                                <div class="controls">
                                    <input type="password" placeholder="Reenter password" id="password2" required="" maxlength="30">
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
    <!-- password-script -->
    <script>
        window.onload = function () {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        };

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 !== pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
    <!-- //password-script -->

</body>

</html>