<%-- 
    Document   : footer
    Created on : Mar 18, 2019, 7:39:44 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<footer>
    <div class="container">
        <!-- footer first section -->
<!--        <p class="footer-main">
            <span>"Grocery Shoppy"</span> Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
            magni dolores eos qui ratione voluptatem sequi nesciunt.Sed ut perspiciatis unde omnis iste natus error sit voluptatem
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
            beatae vitae dicta sunt explicabo.</p>-->
        <!-- //footer first section -->
        <!-- footer third section -->
        <div class="footer-info w3-agileits-info">
            <!-- quick links -->
            <div class="col-sm-6 address-right">
                <div class="col-xs-5 footer-grids">
                    <h3>Không gian</h3>
                    <ul>
                        <c:forEach var="pci" items="${productRoomList}">
                            <li>
                                <a href="productlist?productroomid=${pci.categoryId}">${pci.categoryName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-xs-7 footer-grids">
                    <h3>Thông tin liên hệ</h3>
                    <ul>
                        <li>
                            <i class="fa fa-map-marker"></i>Số 2, Kho Sau - Van Diem - Thuong Tin - Ha Noi</li>
                        <li>
                            <i class="fa fa-mobile"></i>0347545020 - 0913076724</li>
                        <li>
                            <i class="fa fa-fax"></i>+1 888 888 4444</li>
                        <li>
                            <i class="fa fa-envelope-o"></i>
                            <a href="mailto:dogomynghecaocapthuyhang@gmail.com">dogomynghecaocapthuyhang@gmail.com</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- //quick links -->
            <div class="col-sm-6 address-right">
                <!-- map -->
                <!--The div element for the map -->
                <div id="map"></div>

            </div>
            <!-- //social icons -->
            <div class="clearfix"></div>
        </div>
        <!-- //footer third section -->
    </div>
</footer>
