<%-- 
    Document   : breadcrumbs
    Created on : Mar 7, 2019, 8:46:06 PM
    Author     : fkien
--%>

<!-- Unused -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.request_uri']}" />
<!DOCTYPE html>
<div class="services-breadcrumb">
    <div class="agile_inner_breadcrumb">
        <div class="container">
            <ul class="w3_short">
                <li>
                    <a href="index.html">Home</a>
                    <i>|</i>
                </li>
                <li>${path}</li>
            </ul>
        </div>
    </div>
</div>
