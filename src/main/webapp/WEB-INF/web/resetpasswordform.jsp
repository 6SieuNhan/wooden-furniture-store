<%-- 
    Document   : passwordrecovery
    Created on : Mar 20, 2019, 9:36:06 AM
    Author     : fkien
    Layout Author: W3layouts
    Layout Author URL: http://w3layouts.com
    License: Creative Commons Attribution 3.0 Unported
    License URL: http://creativecommons.org/licenses/by/3.0/
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
    <!-- password recovery page -->
    <div class="privacy">
        <div class="container">
            <div class="address_form_agile">
                <h4>Reset Password</h4>
                <p>Nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod:</p>
                <br/>
                <form action="resetpassword" method="post" class="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                        <div class="information-wrapper">
                            <div class="first-row">
                                <input type="text" name="userid" value="${param.userid}" >
                                <input type="text" name="recovery" value="${param.recovery}" >
                                <div class="controls">
                                    <input type="password" placeholder="Password" id="password1" name="password1" required="">
                                </div>
                                <div class="controls">
                                    <input type="password" placeholder="Confirm password" id="password2" name="password2" required="">
                                </div>
                            </div>
                            <c:if test="${not empty message}">
                                <div class="simple-alert-msg" >
                                    ${message}
                                </div>
                            </c:if>
                            <button class="submit check_out">Reset Password</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- footer -->
        <footer></footer>
        <!-- //footer -->

        <!-- js-files -->
        <!-- jquery -->
        <script src="<c:url value="/resource/js/jquery-2.1.4.min.js"/>"></script>
        <!-- //jquery -->
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
        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <!-- //js-files -->
</body>

</html>
