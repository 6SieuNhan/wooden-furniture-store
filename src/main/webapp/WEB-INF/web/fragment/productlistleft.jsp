<%-- 
    Document   : productsearch
    Created on : Mar 3, 2019, 9:30:18 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- product left -->
<c:set var="category" value="${paramValues.productcategoryid}" />
<c:set var="material" value="${paramValues.productmaterialid}" />
<c:set var="origin" value="${paramValues.productoriginid}" />
<c:set var="room" value="${paramValues.productroomid}" />

<div class="side-bar col-md-3">

    <div class="search-hotel">
        <h3 class="agileits-sear-head">Tìm kiếm</h3>
        <form action="productlist" method="get">
            <input type="search" placeholder="Tên sản phẩm..." name="searchquery" value="${param.searchquery}">
            <input type="submit" value=" ">
            <!-- price range -->
            <div class="left-side">
                <h4 class="agileits-sear-head">Mức giá</h4><br>
                <select name="minprice">
                    <option selected value="">Từ</option>
                    <option <c:if test="${param.minprice == 1000000}">selected</c:if> value="1000000">1 triệu</option>
                    <option <c:if test="${param.minprice == 2000000}">selected</c:if>  value="2000000">2 triệu</option>
                    <option <c:if test="${param.minprice == 5000000}">selected</c:if>  value="5000000">5 triệu</option>
                    <option <c:if test="${param.minprice == 10000000}">selected</c:if>  value="10000000">10 triệu</option>
                    <option <c:if test="${param.minprice == 20000000}">selected</c:if>  value="20000000">20 triệu</option>
                    <option <c:if test="${param.minprice == 50000000}">selected</c:if>  value="50000000">50 triệu</option>
                    <option <c:if test="${param.minprice == 100000000}">selected</c:if>  value="100000000">100 triệu</option>
                </select>
                -
                <select name="maxprice">
                    <option selected value="">Đến</option>
                    <option <c:if test="${param.maxprice == 1000000}">selected</c:if> value="1000000">1 triệu</option>
                    <option <c:if test="${param.maxprice == 2000000}">selected</c:if>  value="2000000">2 triệu</option>
                    <option <c:if test="${param.maxprice == 5000000}">selected</c:if>  value="5000000">5 triệu</option>
                    <option <c:if test="${param.maxprice == 10000000}">selected</c:if>  value="10000000">10 triệu</option>
                    <option <c:if test="${param.maxprice == 20000000}">selected</c:if>  value="20000000">20 triệu</option>
                    <option <c:if test="${param.maxprice == 50000000}">selected</c:if>  value="50000000">50 triệu</option>
                    <option <c:if test="${param.maxprice == 100000000}">selected</c:if>  value="100000000">100 triệu</option>
                </select>
            </div>
            <!-- //price range -->
            <!-- category -->
            <div class="left-side">
                <h4 class="agileits-sear-head">
                    <a data-toggle="collapse" href="#collapse1">Danh mục</a>
                    <span class="caret"></span>
                </h4>
                <br>
                <!-- uncollapse if selected checkbox is available -->
                <div id="collapse1" class="collapse 
                     <c:if test="${not empty category}">
                         in
                     </c:if>
                     ">
                    <ul>
                        <c:forEach var="pcm" items="${productCategoryList}" >
                            <li>
                                <input type="checkbox" class="checked" name="productcategoryid" value="${pcm.categoryId}"
                                       <c:forEach var="test1" items="${category}">
                                           <c:if test="${test1 == pcm.categoryId}">
                                               checked
                                           </c:if>
                                       </c:forEach>
                                       >
                                <span class="span">${pcm.categoryName}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- //category -->

            <!-- material -->
            <div class="left-side">
                <h4 class="agileits-sear-head">
                    <a data-toggle="collapse" href="#collapse2">Chất liệu</a>
                    <span class="caret"></span>
                </h4>
                <br>
                <!-- uncollapse if selected checkbox is available -->
                <div id="collapse2" class="collapse 
                     <c:if test="${not empty material}">
                         in
                     </c:if>">
                    <ul>
                        <c:forEach var="pcm" items="${productMaterialList}" >
                            <li>
                                <input type="checkbox" class="checked" name="productmaterialid" value="${pcm.categoryId}"
                                       <c:forEach var="test1" items="${material}">
                                           <c:if test="${test1 == pcm.categoryId}">
                                               checked
                                           </c:if>
                                       </c:forEach>
                                       >
                                <span class="span">${pcm.categoryName}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- //material -->

            <!-- origin -->
            <div class="left-side">
                <h4 class="agileits-sear-head">
                    <a data-toggle="collapse" href="#collapse3">Xuất sứ</a>
                    <span class="caret"></span>
                </h4><br>
                <!-- uncollapse if selected checkbox is available -->
                <div id="collapse3" class="collapse 
                     <c:if test="${not empty origin}">
                         in
                     </c:if>">
                    <ul>
                        <c:forEach var="pcm" items="${productOriginList}" >
                            <li>
                                <input type="checkbox" class="checked" name="productoriginid" value="${pcm.categoryId}"
                                       <c:forEach var="test1" items="${origin}">
                                           <c:if test="${test1 == pcm.categoryId}">
                                               checked
                                           </c:if>
                                       </c:forEach>
                                       >
                                <span class="span">${pcm.categoryName}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- //origin -->

            <!-- room -->
            <div class="left-side">
                <h4 class="agileits-sear-head">
                    <a data-toggle="collapse" href="#collapse4">Không gian</a>
                    <span class="caret"></span>
                </h4><br>
                <div id="collapse4" class="collapse 
                     <c:if test="${not empty room}">
                         in
                     </c:if>">
                    <ul>
                        <c:forEach var="pcm" items="${productRoomList}" >
                            <li>
                                <input type="checkbox" class="checked" name="productroomid" value="${pcm.categoryId}"
                                       <c:forEach var="test1" items="${room}">
                                           <c:if test="${test1 == pcm.categoryId}">
                                               checked
                                           </c:if>
                                       </c:forEach>
                                       >
                                <span class="span">${pcm.categoryName}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- //room -->
        </form>
    </div>

</div>

<!-- //product list left -->
