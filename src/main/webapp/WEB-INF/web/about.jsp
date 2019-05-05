<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:param name="page" value="about" />
        </jsp:include>
        <!-- //navbar -->
        <!-- banner-2 -->
        <div class="page-head_agile_info_w3l">

        </div>
        <!-- //banner-2 -->
        <!-- about page -->
        <!-- welcome -->
        <div class="welcome">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Chào mừng quý khách
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="w3l-welcome-info">
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/homepage/phong-khach.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/homepage/phong-ngu.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <br/>
                <div class="w3l-welcome-info">
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/homepage/phong-bep.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6 welcome-grids">
                        <div class="welcome-img">
                            <img src="<c:url value="resource/images/homepage/phong-lam-viec.jpg"/>" class="img-responsive zoom-img" alt="">
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="w3l-welcome-text">
                    <br>
                    <h4>Giá trị và sự khác biệt</h4>
                    <p>&nbsp;&nbsp;&nbsp;Một ngôi nhà đẹp không thể thiếu đi những nội thất cao cấp. Khác với những nội thất thông thường, nội thất được làm từ gỗ toát lên sự sang trọng, quý phái. Không những thế, gỗ là một chất liệu tự nhiên không hề độc hại, sẽ tạo cho bạn cảm giác gẫn vũi với thiên nhiên ngay bên trong ngôi nhà tiện nghi của bạn. Một trong những ưu điểm của đồ được làm từ gỗ là chúng vô cùng bền vững với thời gian, bạn có thể sử dụng tới vài chục năm thậm chí hơn thế.</p>
                    <p>&nbsp;&nbsp;&nbsp;Sự khác biệt của chúng tôi chính là sáng tạo nội thất thành phong cách riêng, phù hợp với nhu cầu khách hàng. Không chỉ là sản phẩm nội thất đơn thuần, mà còn là không gian sống theo phong cách riêng với cách bày trí hài hòa từ đồ nội thất kết hợp với đồ trang trí. Giúp khách hàng cảm nhận được một không gian sống thực sự, cảm thấy thoải mái để tận hưởng cuộc sống.</p>
                    <br>
                    <h4>Chất lượng và dịch vụ</h4>
                    <p>&nbsp;&nbsp;&nbsp;Chất lượng của nguyên vật liệu, phụ kiện và quy trình sản xuất đều được kiểm định và giám sát chặt chẽ bởi hệ thống quản lý chất lượng ISO 9001. Sản phẩm của Nhà Xinh được thiết kế theo định hướng công năng sử dụng, thẩm mỹ và chất lượng. Trong những năm gần đây, thương hiệu luôn hướng đến xu hướng thiết kế xanh nhằm đóng góp không chỉ một không gian sống tiện nghi mà còn là một môi trường sống trong lành cho người sử dụng và cộng đồng.</p>
                    <br>
                </div>
                <!-- video -->
                <!--<iframe src="https://player.vimeo.com/video/15520702?color=ffffff&title=0&byline=0"></iframe>
                <div class="text-center">
                    <p>Eaque ipsa quae ab illo inventore veritatis</p>
                </div> -->
                <!-- //video -->
            </div>
        </div>
        <!-- //welcome -->
        <!-- //about page -->
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