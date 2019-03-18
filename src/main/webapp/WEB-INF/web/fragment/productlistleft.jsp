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
        <h3 class="agileits-sear-head">Page count: ${pageCount}</h3>
        <form action="productlist" method="get">
            <input type="search" placeholder="Product name..." name="searchquery" value="${param.searchquery}">
            <input type="submit" value=" ">
            <!-- price range -->
            <div class="left-side">
                <h4 class="agileits-sear-head">Price Range</h4><br>
                <input type="number" name="minprice" placeholder="From" value="${param.minprice}"> - <input type="number" name="maxprice" placeholder="To" value="${param.maxprice}">
            </div>
            <!-- //price range -->
            <!-- category -->
            <div class="left-side">
                <h4 class="agileits-sear-head">
                    <a data-toggle="collapse" href="#collapse1">Category</a>
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
                    <a data-toggle="collapse" href="#collapse2">Material</a>
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
                    <a data-toggle="collapse" href="#collapse3">Origin</a>
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
                    <a data-toggle="collapse" href="#collapse4">Room</a>
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
