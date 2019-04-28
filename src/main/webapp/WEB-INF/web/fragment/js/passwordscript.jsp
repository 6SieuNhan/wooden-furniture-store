<%-- 
    Document   : passwordscript
    Created on : Apr 28, 2019, 3:42:46 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    $(window).load(function () {
        $('#password1').get(0).setCustomValidity('Mật khẩu phải từ 4 đến 16 ký tự');
        
        $('#password1').on('input',validatePassword);
        $('#password2').on('input',validatePassword);
    });



    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;

        if (pass1.length < 4) {
            document.getElementById("password1").setCustomValidity("Mật khẩu phải từ 4 đến 16 ký tự");
        } else {
            document.getElementById("password1").setCustomValidity('');
        }

        if (pass1 !== pass2)
            document.getElementById("password2").setCustomValidity("Mật khẩu không trùng khớp");
        else
            document.getElementById("password2").setCustomValidity('');
        //empty string means no validation error
    }
</script>
