<%-- 
    Document   : phonescript
    Created on : Apr 28, 2019, 3:47:57 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- phone script -->
<script>
    $(window).load(function () {
        validatePhone();
        $('#phone').on('input',validatePhone);
    });

    function validatePhone() {
        document.getElementById("phone").setCustomValidity('');
        var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var mobile = document.getElementById("phone").value;
        if (mobile !== '') {
            if (vnf_regex.test(mobile) === false)
            {
                document.getElementById("phone").setCustomValidity('Số điện thoại không hợp lệ');
            } else {
                document.getElementById("phone").setCustomValidity('');
            }
        } else {
            document.getElementById("phone").setCustomValidity('Bạn chưa điền số điện thoại');
        }
    }
</script>
