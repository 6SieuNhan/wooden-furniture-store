<%-- 
    Document   : menubar
    Created on : Mar 20, 2019, 7:37:54 PM
    Author     : Đào Minh Quang
--%>
<%@ page buffer="64kb" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resource/css/adminpage/menubar.css" />" rel="stylesheet" type="text/css" media="all" />
        <script src="<c:url value="/resource/js/adminpage/script.js" />"></script>
    </head>
    <body>
        <div id="menuBar">
            <a href="adminpage" class="subMenuBar noneLine ${pm}">Quản lý sản phẩm</a>
            <a href="#" 
               class="subMenuBar noneLine ${bcd}">Quản lý danh mục</a>
            <a href="#" class="subMenuBar noneLine ${cde}">Quản lý đơn hàng</a> 
            <a href="#" class="subMenuBar noneLine ${cde}">Doanh thu</a> 
        </div>
    </body>
</html>
