<%-- 
    Document   : message
    Created on : Mar 11, 2019, 10:47:14 AM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đồ Gỗ Mỹ Nghệ Cao Cấp Thủy Hằng</title>
    </head>
    <body>
        <div style = "position: absolute; top: 40%; vertical-align: middle; width: 100%; text-align: center; font: 17px verdana, sans-serif;">
            <div>
                <c:choose>
                    <c:when test = "${not empty message}">
                        <b>${message}</b>
                    </c:when>
                    <c:otherwise>
                        <b>Không có thông báo quan trọng nào cả.</b>
                    </c:otherwise>
                </c:choose>
            </div>
            <br>
            <div>
                <a href="home">Ấn vào đây nếu trình duyệt không tự chuyển đến trang chủ</a>
            </div>
        </div>
        <script>
            setTimeout(function () {
                window.setTimeout(function () {
                    location.href = "home";
                }, 5000);
            });
        </script>
    </body>
</html>
