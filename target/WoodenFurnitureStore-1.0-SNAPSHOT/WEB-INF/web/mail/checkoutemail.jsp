<%-- 
    Document   : checkoutemail
    Created on : Mar 11, 2019, 9:41:09 AM
    Author     : fkien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            This is a test message for WebBanHang.<br/>
            This message is included with a copy of the receipt of the latest purchase attempt <br/>
            Do not mark this as spam.
        </div>
        <table>
            <tr>
                <th>SL No.</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${checkoutList}" varStatus="loop">
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${item.productName}</td>
                    <td>
                        <div>
                            <div>
                                <span>${item.quantity}</span>
                            </div>
                        </div>
                    </td>
                    <td class="invert">$${item.price}</td>
                </tr>
            </c:forEach>
        </table>
        
        <div>Copyright never.</div>
    </body>
</html>
