<%-- 
    Document   : header
    Created on : Feb 15, 2019, 9:21:54 AM
    Author     : fkien
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>header</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--pop-up-box-->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!--//pop-up-box-->
        <!-- price range -->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>
    <body>
        <!-- top-header -->
        <div class="header-most-top">
            <p>Grocery Offer Zone Top Deals & Discounts</p>
        </div>
        <!-- //top-header -->
        <!-- header-bot-->
        <div class="header-bot">
            <div class="header-bot_inner_wthreeinfo_header_mid">
                <!-- header-bot-->
                <div class="col-md-4 logo_agile">
                    <h1>
                        <a href="index.html">
                            <span>G</span>rocery
                            <span>S</span>hoppy
                            <img src="images/logo2.png" alt=" ">
                        </a>
                    </h1>
                </div>
                <!-- header-bot -->
                <div class="col-md-8 header">
                    <!-- header lists -->
                    <ul>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#myModal1">
                                <span class="fa fa-truck" aria-hidden="true"></span>Track Order</a>
                        </li>
                        <li>
                            <span class="fa fa-phone" aria-hidden="true"></span> ${not empty user}
                        </li>

                        <!-- display either user info, or login/register form -->
                        <c:choose>
                            <c:when test="${not empty user}">
                                <li>
                                    Welcome ${user.username}
                                </li>
                                <li>
                                    <a href="logout">Sign Out</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#myModal1">
                                        <span class="fa fa-unlock-alt" aria-hidden="true"></span> Sign In </a>
                                </li>
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#myModal2">
                                        <span class="fa fa-pencil-square-o" aria-hidden="true"></span> Sign Up </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <!-- //display either user info, or login/register form -->
                    </ul>
                    <!-- //header lists -->
                    <!-- search -->
                    <div class="agileits_search">
                        <form action="#" method="post">
                            <input name="Search" type="search" placeholder="How can we help you today?" required="">
                            <button type="submit" class="btn btn-default" aria-label="Left Align">
                                <span class="fa fa-search" aria-hidden="true"> </span>
                            </button>
                        </form>
                    </div>
                    <!-- //search -->
                    <!-- cart details -->
                    <div class="top_nav_right">
                        <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                            <form action="#" method="post" class="last">
                                <input type="hidden" name="cmd" value="_cart">
                                <input type="hidden" name="display" value="1">
                                <button class="w3view-cart" type="submit" name="submit" value="">
                                    <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <!-- //cart details -->
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <!-- remove login/register form when logged in, just in case -->
        <c:if test="${empty user}">
            <!-- signin Model -->
            <!-- Modal1 -->
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body modal-body-sub_agile">
                            <div class="main-mailposi">
                                <span class="fa fa-envelope-o" aria-hidden="true"></span>
                            </div>
                            <div class="modal_body_left modal_body_left1">
                                <h3 class="agileinfo_sign">Sign In </h3>
                                <p>
                                    Sign In now, Let's start your Grocery Shopping. Don't have an account?
                                    <a href="#" data-toggle="modal" data-target="#myModal2">
                                        Sign Up Now</a>
                                </p>

                                <form:form id="loginForm" modelAttribute="login" action="login" method="post">
                                    <div class="styled-input agile-styled-input-top">
                                        <form:input path="username" placeholder = "Username" required="required" />
                                    </div>
                                    <div class="styled-input">
                                        <form:password path="password" placeholder = "Password" required="required" />
                                    </div>
                                    <form:button id="login" name="login">Sign In</form:button>
                                </form:form>

                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!-- //Modal content-->
                </div>
            </div>
            <!-- //Modal1 -->
            <!-- //signin Model -->
            <!-- signup Model -->
            <!-- Modal2 -->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body modal-body-sub_agile">
                            <div class="main-mailposi">
                                <span class="fa fa-envelope-o" aria-hidden="true"></span>
                            </div>
                            <div class="modal_body_left modal_body_left1">
                                <h3 class="agileinfo_sign">Sign Up</h3>
                                <p>
                                    Come join the Grocery Shoppy! Let's set up your Account.
                                </p>

                                <form:form id="registerForm" modelAttribute="login" action="register" method="post">
                                    <div class="styled-input agile-styled-input-top">
                                        <form:input path="username" placeholder = "Username" required="required" />
                                    </div>
                                    <div class="styled-input">
                                        <form:input path="email" placeholder = "E-mail" id="email" required="required" />
                                    </div>
                                    <div class="styled-input">
                                        <form:password path="password" placeholder = "Password" id="password1" required="required" />
                                    </div>
                                    <div class="styled-input">
                                        <input type="password" placeholder="Confirm Password" name="Confirm Password" id="password2" required="">
                                    </div>
                                    <input type="submit" value="Sign Up">
                                </form:form>
                                <p>
                                    <a href="#">By clicking register, I agree to your terms</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- //Modal content-->

                </div>
            </div>
        </c:if>
        <!-- //Modal2 -->
        <!-- //signup Model -->
        <!-- //header-bot -->

        <!-- popup modal (for signin & signup)-->
        <script src="js/jquery.magnific-popup.js"></script>
        <script>
            $(document).ready(function () {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>
        <!-- Large modal -->
        <!-- <script>
                $('#').modal('show');
        </script> -->
        <!-- //popup modal (for signin & signup)-->

        <!-- password-script -->
        <script>
            window.onload = function () {
                document.getElementById("password1").onchange = validatePassword;
                document.getElementById("password2").onchange = validatePassword;
            };

            function validatePassword() {
                var pass2 = document.getElementById("password2").value;
                var pass1 = document.getElementById("password1").value;
                if (pass1 !== pass2)
                    document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("password2").setCustomValidity('');
                //empty string means no validation error
            }
        </script>
        <!-- //password-script -->

    </body>
</html>
