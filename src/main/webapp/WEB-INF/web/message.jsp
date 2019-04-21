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
        <div>
            <c:choose>
                <c:when test = "${not empty message}">
                    ${message}
                </c:when>
                <c:otherwise>
                    No message
                </c:otherwise>
            </c:choose>
        </div>
        <div>
            <a href="home">Click here if it's not automatically redirecting to homepage.</a>
        </div>
        <script>
            setTimeout(function(){
                window.setTimeout(function () {
                    location.href = "home";
                }, 5000);
            });
        </script>
    </body>
</html>
