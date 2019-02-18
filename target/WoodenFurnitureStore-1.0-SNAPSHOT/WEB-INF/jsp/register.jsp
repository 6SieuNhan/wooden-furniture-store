<%-- 
    Document   : register
    Created on : Feb 7, 2019, 8:16:22 PM
    Author     : fkien
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register form</h1>
        
        <form:form id="registerForm" modelAttribute="register" action="register" method="post">
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="username">Username: </form:label>
                        </td>
                        <td>
                            <form:input path="username" name="username" id="username" />
                        </td>
                        <td>
                            <label id="usernamealert" style="color: red;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password">Password:</form:label>
                        </td>
                        <td>
                            <form:password path="password" name="password" id="password" />
                        </td>
                        <td>
                            <label id="passwordalert" style="color: red;"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Confirm password:</label>
                        </td>
                        <td>
                            <input type="password" id="confirmpassword" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="left">
                            <button type="submit" onclick="return Validate()">Register</button>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td><a href="./">Home</a>
                        </td>
                    </tr>
                </table>
            </form:form>
            <table align="center">
                <tr>
                    <td style="font-style: italic; color: red;">${message}</td>
                </tr>
            </table>
        <!-- Validate stuff-->
        <script type="text/javascript">
            function Validate(){
                var password, confirmpassword, usernamealert, passwordalert, valid;
                valid = true;
                if(!document.getElementById("username").value){
                    usernamealert = "username is empty";
                    valid = false;
                }
                else{
                    usernamealert = "";
                }
                document.getElementById("usernamealert").innerHTML = usernamealert;
                
                password = document.getElementById("password").value;
                confirmpassword = document.getElementById("confirmpassword").value;
                if(password!==confirmpassword){
                    passwordalert = "Password does not match";
                    valid = false;
                }
                else{
                    passwordalert = "";
                }
                document.getElementById("passwordalert").innerHTML = passwordalert;
                return valid;
            }
        </script>
    </body>
</html>
