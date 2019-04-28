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
                                    <form:input path="username" placeholder = "Tên người dùng" required="required" maxlength="30"
                                                oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                                <div class="controls">
                                    <form:input path="address" placeholder = "Địa chỉ" required="required"  maxlength="100"
                                                oninput="setCustomValidity('')" oninvalid="setCustomValidity('Trường không được để trống')"/>
                                </div>
                                <div class="controls">
                                    <form:password path="password" id="password3" placeholder = "Mật khẩu (4-16 ký tự)" required="required" maxlength="16"/>
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
                                    <form:input id="email" type="email"  path="email" placeholder = "Địa chỉ email" required="required" maxlength="30"/>
                                </div>
                                <div class="controls">
                                    <form:input id="phone" type="number" path="phone" placeholder = "Số điện thoại (9 ký tự)" maxlength="9"/>
                                </div>
                                <div class="controls">
                                    <input type="password" placeholder="Nhập lại mật khẩu" id="password4" required="" maxlength="16">
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
            document.getElementById("password3").setCustomValidity("Mật khẩu phải từ 4 đến 16 ký tự");
            document.getElementById("email").setCustomValidity("Trường không được để trống");
            document.getElementById("phone").setCustomValidity("Bạn chưa điền số điện thoại");

            document.getElementById("password3").oninput = validatePassword;
            document.getElementById("password4").oninput = validatePassword;
            document.getElementById("email").oninput = validateEmail;
            document.getElementById("phone").oninput = validatePhone;
        };
    </script>
    
    <!-- email script -->
    <script>
        function validateEmail() {
            document.getElementById("email").setCustomValidity('');
            if (document.getElementById("email").checkValidity()) {
                document.getElementById("email").setCustomValidity('');
            } else {
                document.getElementById("email").setCustomValidity('Địa chỉ email phải có ký tự @');
            }
        }
    </script>
    <!-- //email script -->
    
    <!-- password-script -->
    <script>
        function validatePassword() {
            var pass4 = document.getElementById("password4").value;
            var pass3 = document.getElementById("password3").value;
            
             if (pass3.length < 4) {
                document.getElementById("password3").setCustomValidity("Mật khẩu phải từ 4 đến 16 ký tự");
            } else {
                document.getElementById("password3").setCustomValidity('');
            }

            if (pass3 !== pass4)
                document.getElementById("password4").setCustomValidity("Mật khẩu không trùng khớp");
            else
                document.getElementById("password4").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
    <!-- //password-script -->

    <!-- phone script -->
    <script>
        function validatePhone() {
            var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
            var mobile = document.getElementById("phone").value;
            if (mobile !== '') {
                if (vnf_regex.test(mobile) === false)
                {
                    document.getElementById("phone").setCustomValidity('Số điện thoại không hợp lệ');
                } else {
                    document.getElementById("phone").setCustomValidity('');
                }
            } else {
                document.getElementById("phone").setCustomValidity('Bạn chưa điền số điện thoại');
            }
        }
    </script>
</body>

</html>