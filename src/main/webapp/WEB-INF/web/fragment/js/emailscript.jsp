<%-- 
    Document   : emailscript
    Created on : Apr 28, 2019, 3:26:36 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- email script -->
<script>
    $(window).load(function () {
        validateEmail();
        $('#email').on('input',validateEmail);
    });
    
    function validateEmail(){
        var email = document.getElementById("email");
        email.setCustomValidity('');
        if(email.checkValidity()){
            email.setCustomValidity('');
        } else {
            email.setCustomValidity('Vui lòng nhập địa chỉ email đúng định dạng; ví dụ: example@gmail.com');
        }
    }
</script>
<!-- //email script -->
