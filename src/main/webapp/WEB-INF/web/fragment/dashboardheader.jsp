<%-- 
    Document   : dashboardheader
    Created on : Apr 8, 2019, 3:29:49 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="home"><strong>Đồ gỗ Thủy Hằng</strong></a>
    </div>
    <ul class="nav navbar-top-links navbar-right">
        <li style="color: white;">
            Xin chào, ${user.username}
        </li>
        <li>
            <a href="logout">Đăng xuất</a>
        </li>
    </ul>
</nav>