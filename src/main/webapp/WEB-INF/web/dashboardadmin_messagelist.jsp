<%-- 
    Document   : dashboardadmin_messagelist
    Created on : Apr 8, 2019, 9:01:47 AM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="searchquery" value="${param.searchquery}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Bluebox Free Bootstrap Admin Template</title>
        <!-- Bootstrap Styles-->
        <link href="<c:url value="/resource/css/bootstrap.css"/>" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="<c:url value="/resource/css/font-awesome.css"/>" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="<c:url value="/resource/js/dashboard/morris/morris-0.4.3.min.css"/>" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="<c:url value="/resource/css/dashboard/custom-styles.css"/>" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="<c:url value="/resource/js/dashboard/Lightweight-Chart/cssCharts.css"/>"> 
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resource/css/simplePagination.css" />" rel="stylesheet" type="text/css"/>
        <link href=" <c:url value="/resource/css/adminpage/admincss.css" />" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="fragment/dashboardheader.jsp" />
            <!--/. NAV TOP  -->
            <jsp:include page="fragment/dashboardadminnav.jsp">
                <jsp:param name="page" value="messagelist" />
            </jsp:include>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Message
                    </h1>
                </div>
                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Danh sách message
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <!-- search garbage -->
                                            <form action="dashboard" method="get" >
                                                <div class="search">
                                                    <input type="text" placeholder="Nhập từ khóa tìm kiếm"
                                                           name="searchquery" value="${param.searchquery}">
                                                    <input type="hidden" id="action" name="action" value="messagelist">
                                                    <button type="submit" value=" "><i class="fa fa-search"></i></button>      
                                                </div>
                                            </form> 

                                            <!-- //search garbage -->
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Subject</th>
                                                            <th>Sender</th>
                                                            <th>Email</th>
                                                            <th>Date</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="o" items="${messageList}">
                                                            <tr class="gradeA" >
                                                                <td>${o.subject}</td>
                                                                <td>${o.senderName}</td>
                                                                <td>${o.senderEmail}</td>
                                                                <td>${o.date}</td>
                                                                <td>
                                                                    <a href="dashboard?action=message&messageid=${o.messageId}">
                                                                        View
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <a href="deletemessage?messageid=${o.messageId}" onclick="return confirm('Bạn có muốn xóa tin nhắn này?')">
                                                                        Delete
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <c:if test = "${empty messageList}">
                                                    <div class="notiSearch">
                                                        No message with this keyword can be found.
                                                    </div>
                                                </c:if>

                                                <div class="pagination-holder clearfix">
                                                    <div id="light-pagination" class="pagination pull-right"></div>
                                                </div>

                                            </div>


                                        </div>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p></footer>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap Js -->
        <script src="<c:url value="/resource/js/bootstrap.min.js"/>"></script>

        <script src="<c:url value="/resource/js/jquery.simplePagination.js"/>"></script>
        <script>
            $('#light-pagination').pagination({
                pages: ${pageCount},
                currentPage: ${(empty param.page) ? '1': param.page},
                selectOnClick: false
            });

        </script>


        <!-- Metis Menu Js -->
        <script src="<c:url value="/resource/js/dashboard/jquery.metisMenu.js"/>"></script>
        <!-- Morris Chart Js -->
        <script src="<c:url value="/resource/js/dashboard/morris/raphael-2.1.0.min.js"/>"></script>
        <script src="<c:url value="/resource/js/dashboard/morris/morris.js"/>"></script>


        <script src="<c:url value="/resource/js/dashboard/easypiechart.js"/>"></script>
        <script src="<c:url value="/resource/js/dashboard/easypiechart-data.js"/>"></script>

        <script src="<c:url value="/resource/js/dashboard/Lightweight-Chart/jquery.chart.js"/>"></script>

        <!-- Custom Js -->
        <script src="<c:url value="/resource/js/dashboard/custom-scripts.js"/>"></script>


    </body>
</body>
</html>