<%-- 
    Document   : home
    Created on : Jan 22, 2019, 4:40:51 PM
    Author     : fkien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <table align="center">
            <tr>
                <td><a href="login">Login</a>
                </td>
                <td><a href="register">Register</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${not empty user}">
                            ${user.username}
                        </td>
                        <td>
                            <a href="logout">Logout</a>
                        </td>
                        </c:when>
                        <c:otherwise>
                            no log in
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>
    </body>
</html>
