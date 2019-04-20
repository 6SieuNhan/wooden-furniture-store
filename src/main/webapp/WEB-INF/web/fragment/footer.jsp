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
        <p class="footer-main">
            <span>"Grocery Shoppy"</span> Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
            magni dolores eos qui ratione voluptatem sequi nesciunt.Sed ut perspiciatis unde omnis iste natus error sit voluptatem
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
            beatae vitae dicta sunt explicabo.</p>
        <!-- //footer first section -->
        <!-- footer third section -->
        <div class="footer-info w3-agileits-info">
            <!-- quick links -->
            <div class="col-sm-5 address-right">
                <div class="col-xs-6 footer-grids">
                    <h3>Không gian</h3>
                    <ul>
                        <c:forEach var="pci" items="${productRoomList}">
                            <li>
                                <a href="productlist?productroomid=${pci.categoryId}">${pci.categoryName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-xs-6 footer-grids">
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
                            <a href="mailto:dogothuyhang@gmail.com">dogothuyhang@gmail.com</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- //quick links -->
            <div class="col-sm-7 address-right">
                <!-- map -->
                <!--The div element for the map -->
                <div id="map"></div>

            </div>
            <!-- //social icons -->
            <div class="clearfix"></div>
        </div>
        <!-- //footer third section -->
        <!-- footer fourth section (text) -->
        <div class="agile-sometext">
            <div class="sub-some">
                <h5>Online Grocery Shopping</h5>
                <p>Order online. All your favourite products from the low price online supermarket for grocery home delivery in Delhi,
                    Gurgaon, Bengaluru, Mumbai and other cities in India. Lowest prices guaranteed on Patanjali, Aashirvaad, Pampers, Maggi,
                    Saffola, Huggies, Fortune, Nestle, Amul, MamyPoko Pants, Surf Excel, Ariel, Vim, Haldiram's and others.</p>
            </div>
            <div class="sub-some">
                <h5>Shop online with the best deals & offers</h5>
                <p>Now Get Upto 40% Off On Everyday Essential Products Shown On The Offer Page. The range includes Grocery, Personal Care,
                    Baby Care, Pet Supplies, Healthcare and Other Daily Need Products. Discount May Vary From Product To Product.</p>
            </div>
        </div>
        <!-- //footer fourth section (text) -->
    </div>
</footer>
