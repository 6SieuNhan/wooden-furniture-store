<%-- 
    Document   : jsdump
    Created on : Mar 18, 2019, 10:31:17 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- jquery -->
<script src="<c:url value="/resource/js/jquery-2.1.4.min.js"/>"></script>
<!-- //jquery -->
<!-- popup modal (for signin & signup)-->
<script src="<c:url value="/resource/js/jquery.magnific-popup.js"/>"></script>
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
<!-- cart-js -->
<script src="<c:url value="/resource/js/minicart.js"/>"></script>
<!-- //cart-js -->
<!-- cart-js -->
<script src="<c:url value="/resource/js/minicart.js"/>"></script>
<script>
    paypalm.minicartk.render(); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js
</script>
<!-- //cart-js -->

<!-- price range (top products) -->
<script src="<c:url value="/resource/js/jquery-ui.js"/>"></script>
<script>
//<![CDATA[ 
    $(window).load(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 9000,
            values: [50, 6000],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

    }); //]]>
</script>
<!-- //price range (top products) -->
<!-- map -->
<script>
    // Initialize and add the map
    function initMap() {
        // The location of Uluru
        var uluru = {lat: 21.012010, lng: 105.824451};
        // The map, centered at Uluru
        var map = new google.maps.Map(
                document.getElementById('map'), {zoom: 17, center: uluru});
        // The marker, positioned at Uluru
        var marker = new google.maps.Marker({position: uluru, map: map});

        // The location of Uluru
        var uluru2 = {lat: 21.012010, lng: 105.824451};
        // The map, centered at Uluru
        var map2 = new google.maps.Map(
                document.getElementById('map2'), {zoom: 17, center: uluru2});
        // The marker, positioned at Uluru
        var marker2 = new google.maps.Marker({position: uluru2, map: map2});
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
</script>
<!-- //map -->

<!-- for bootstrap working -->
<script src="<c:url value="/resource/js/bootstrap.js" />"></script>
<!-- //for bootstrap working -->
