<%-- 
    Document   : formProduct
    Created on : Mar 21, 2019, 12:32:11 AM
    Author     : Đào Minh Quang
--%>
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create Product</title>
        <link href=" <c:url value="/resource/css/adminpage/styles.css" />" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="<c:url value="/resource/js/adminpage/script.js" />"></script>
        <style>
            .error-message {
                color: red;
                font-size:90%;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div id="header-most-top">
                <p>Grocery Offer Zone Top Deals & Discounts</p>
            </div>
            <div class="header-top">
                <div class="csslogout">
                    <span> Welcome: ${user.username} </span>
                    <br>
                    <a href="logout">Sign Out</a>
                </div>
                <div class="col-12 logo_agile">
                    <h1>
                        <a href="index.html">
                            <span>G</span>rocery
                            <span>S</span>hoppy
                            <img src="images/logo2.png" alt=" ">
                        </a>
                    </h1>   
                    <%@include file="fragment/menubar.jsp" %>
                </div>
            </div>
            <div class="col-12">
                <div class="addnew">
                    <form:form action="saveProduct" method="POST" modelAttribute="productForm">
                        <span><h2>${formTitle}</h2></span>
                        <form:hidden path="productId" />
                        <div class="col-6">
                            <p>      
                                <label class="w3-text-brown"><b>Mã sản phẩm</b></label>
                                <form:input class="w3-input w3-border w3-sand" path="productCode"/>
                            </p>   
                            <p>
                                <label class="w3-text-brown"><b>Tên sản phẩm</b></label>
                                <form:input class="w3-input w3-border w3-sand" path="productName"/>
                            </p>
                            <p><form:errors path="productName" class="error-message" /></p>
                            
                            <div id="myform">
                                <label class="w3-text-brown"><b>Hình đại diện</b></label>
                                <div class="yes">
                                    <span class="btn_upload">
                                        <form:input type="file" id="imag" class="input-img" path="thumbnail"/>
<!--                                        <input type="file" id="imag" title="" class="input-img"/>-->
                                        Ảnh sản phẩm
                                    </span>
                                    <img id="ImgPreview" src="" class="preview1" />
                                    <input type="button" id="removeImage1" value="x" class="btn-rmv1" />
                                </div>         
                            </div>
                            
                            <p>
                                <label class="w3-text-brown"><b>Mô tả sản phẩm</b></label>
                                <br>
                                <form:textarea path="description" placeholder="Giới thiệu về sản phẩm" rows="5" cols="80"/>
                            </p>
                        </div>
                        <div class="col-6 right_side">
                            <p>
                                <label class="w3-text-brown"><b>Thuộc danh mục</b></label>
                                <br>
                                <form:select path="productCategoryId" cssClass="classic">
                                    <c:forEach var="pcm" items="${productCategoryList}" >
                                        <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                    </c:forEach>
                                </form:select>
                            </p>
                            <p>
                                <label class="w3-text-brown"><b>Thuộc chất liệu</b></label>
                                <br>
                                <form:select path="productMaterialId" cssClass="classic">
                                    <c:forEach var="pcm" items="${productMaterialList}" >
                                        <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                    </c:forEach>
                                </form:select>
                            </p>
                            <p>
                                <label class="w3-text-brown"><b>Thuộc phòng</b></label>
                                <br>
                                <form:select path="productRoomId" cssClass="classic">
                                    <c:forEach var="pcm" items="${productRoomList}" >
                                        <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                    </c:forEach>
                                </form:select>
                            </p>
                            <p>
                                <label class="w3-text-brown"><b>Nơi sản xuất</b></label>
                                <br>
                                <form:select path="productOriginId" cssClass="classic">
                                    <c:forEach var="pcm" items="${productOriginList}" >
                                        <form:option value="${pcm.categoryId}">${pcm.categoryName}</form:option>
                                    </c:forEach>
                                </form:select>
                            </p>
                            <p>
                                <label class="w3-text-brown"><b>Giá bán (VNĐ)</b></label>
                                <form:input class="w3-input w3-border w3-sand" path="price"/>
                            </p>
                            <p>
                                <label class="w3-text-brown"><b>Số lượng</b></label>
                               <form:input class="w3-input w3-border w3-sand" path="quantity"/>
                            </p>
                            <p class="floatRight"><button class="w3-btn w3-brown submit">Register</button></p>
                        </div>
                    </form:form>



                </div>
            </div>
        </div>
    </div>

    <script>
        $("#imag").change(function () {
            // add your logic to decide which image control you'll use
            var imgControlName = "#ImgPreview";
            readURL(this, imgControlName);
            $('.preview1').addClass('it');
            $('.btn-rmv1').addClass('rmv');
        });

        $("#removeImage1").click(function (e) {
            e.preventDefault();
            $("#imag").val("");
            $("#ImgPreview").attr("src", "");
            $('.preview1').removeClass('it');
            $('.btn-rmv1').removeClass('rmv');
        });

    </script>
</body>
</html>
