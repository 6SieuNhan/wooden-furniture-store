<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Contact Us :: w3layouts</title>
        <jsp:include page="fragment/metadump.jsp" />
    </head>

    <body>
        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" />
        <!-- //navbar -->
        <!-- contact page -->
        <div class="contact-w3l">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Contact Us
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <!-- contact -->
                <div class="contact agileits">
                    <div class="contact-agileinfo">
                        <div class="contact-right wthree">
                            <div class="col-xs-5 contact-text w3-agileits">
                                
                                <form:form modelAttribute="messageForm" action="sendcontactmessage" method="post">
                                    <form:input path="senderName" placeholder = "Name" required="required" />
                                    <form:input path="subject" placeholder = "Subject" required="required" />
                                    <form:input path="senderEmail" placeholder = "Email" required="required" />
                                    <form:textarea path="message" placeholder = "Message" required="required" />
                                    <button class="submit check_out">Submit</button>
                                </form:form>
                            </div>
                            <div class="col-xs-7 contact-agile">
                                <p>
                                    <i class="fa fa-map-marker"></i> Số 1, ngõ 185, phố Tây Sơn, phường Trung Liệt, quận Đống Đa, Hà Nội</p>
                                <p>
                                    <i class="fa fa-phone"></i> Telephone : 333 222 3333</p>
                                <p>
                                    <i class="fa fa-fax"></i> FAX : +1 888 888 4444</p>
                                <p>
                                    <i class="fa fa-envelope-o"></i> Email :
                                    <a href="mailto:example@mail.com">mail@example.com</a>
                                </p>
                                <br/>
                                <div id="map2"></div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <!-- //contact -->
            </div>
        </div>
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