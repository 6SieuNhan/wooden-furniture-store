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
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
        <jsp:include page="fragment/metadump.jsp" />
    </head>

    <body>
        <!-- header -->
        <jsp:include page="fragment/header.jsp" />
        <!-- //header -->
        <!-- navbar -->
        <jsp:include page="fragment/navbar.jsp" >
            <jsp:param name="page" value="contact" />
        </jsp:include>
        <!-- //navbar -->
        <!-- banner-2 -->
        <div class="page-head_agile_info_w3l">

        </div>
        <!-- //banner-2 -->
        <!-- contact page -->
        <div class="contact-w3l">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Liên hệ
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
                                    <form:input path="senderName" placeholder = "Tên" required="required" maxlength="30"/>
                                    <form:input path="subject" placeholder = "Tiêu đề" required="required" maxlength="30" />
                                    <form:input path="senderEmail" placeholder = "Địa chỉ email" required="required" maxlength="30"/>
                                    <form:textarea path="message" placeholder = "Nội dung" required="required" maxlength="300" />
                                    <button class="submit check_out">Submit</button>
                                </form:form>
                            </div>
                            <div class="col-xs-7 contact-agile">
                                <p>
                                    <i class="fa fa-map-marker"></i> Số 2, Kho Sau - Van Diem - Thuong Tin - Ha Noi</p>
                                <p>
                                    <i class="fa fa-phone"></i> 0347545020 - 0913076724</p>
                                <p>
                                    <i class="fa fa-fax"></i> +1 888 888 4444</p>
                                <p>
                                    <i class="fa fa-envelope-o"></i> Email :
                                    <a href="mailto:dogothuyhang@gmail.com">dogothuyhang@gmail.com</a>
                                </p>
                                <br/>
                                <div id="map"></div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <!-- //contact -->
            </div>
        </div>
        <!-- footer -->

        <!-- //footer -->
        <!-- copyright -->
        <jsp:include page="fragment/copyright.jsp" />
        <!-- //copyright -->
        <!-- js-files -->
        <jsp:include page="fragment/js/jsdump.jsp" />
        <!-- //js-files -->
    </body>

</html>