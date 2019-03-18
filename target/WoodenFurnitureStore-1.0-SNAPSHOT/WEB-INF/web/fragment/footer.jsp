<%-- 
    Document   : footer
    Created on : Mar 18, 2019, 7:39:44 PM
    Author     : fkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer>
    <div class="container">
        <!-- footer first section -->
        <p class="footer-main">
            <span>"Grocery Shoppy"</span> Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
            magni dolores eos qui ratione voluptatem sequi nesciunt.Sed ut perspiciatis unde omnis iste natus error sit voluptatem
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
            beatae vitae dicta sunt explicabo.</p>
        <!-- //footer first section -->
        <!-- footer third section -->
        <div class="footer-info w3-agileits-info">
            <!-- quick links -->
            <div class="col-sm-5 address-right">
                <div class="col-xs-6 footer-grids">
                    <h3>Quick Links</h3>
                    <ul>
                        <li>
                            <a href="about.html">About Us</a>
                        </li>
                        <li>
                            <a href="contact.html">Contact Us</a>
                        </li>
                        <li>
                            <a href="help.html">Help</a>
                        </li>
                        <li>
                            <a href="faqs.html">Faqs</a>
                        </li>
                        <li>
                            <a href="terms.html">Terms of use</a>
                        </li>
                        <li>
                            <a href="privacy.html">Privacy Policy</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6 footer-grids">
                    <h3>Get in Touch</h3>
                    <ul>
                        <li>
                            <i class="fa fa-map-marker"></i> 123 Sebastian, USA.</li>
                        <li>
                            <i class="fa fa-mobile"></i> 333 222 3333 </li>
                        <li>
                            <i class="fa fa-phone"></i> +222 11 4444 </li>
                        <li>
                            <i class="fa fa-envelope-o"></i>
                            <a href="mailto:example@mail.com"> mail@example.com</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- //quick links -->
            <div class="col-sm-7 address-right">
                <!-- map -->
                <!--The div element for the map -->
                <div id="map"></div>
                <script>
            // Initialize and add the map
                    function initMap() {
                        // The location of Uluru
                        var uluru = {lat: -25.344, lng: 131.036};
                        // The map, centered at Uluru
                        var map = new google.maps.Map(
                                document.getElementById('map'), {zoom: 4, center: uluru});
                        // The marker, positioned at Uluru
                        var marker = new google.maps.Marker({position: uluru, map: map});
                    }
                </script>
                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMuEIhFUsSZD3iNL0ilVRT2MApzOWwTKc&callback=initMap">
                </script>
                <!-- //map -->

            </div>
            <!-- //social icons -->
            <div class="clearfix"></div>
        </div>
        <!-- //footer third section -->
        <!-- footer fourth section (text) -->
        <div class="agile-sometext">
            <div class="sub-some">
                <h5>Online Grocery Shopping</h5>
                <p>Order online. All your favourite products from the low price online supermarket for grocery home delivery in Delhi,
                    Gurgaon, Bengaluru, Mumbai and other cities in India. Lowest prices guaranteed on Patanjali, Aashirvaad, Pampers, Maggi,
                    Saffola, Huggies, Fortune, Nestle, Amul, MamyPoko Pants, Surf Excel, Ariel, Vim, Haldiram's and others.</p>
            </div>
            <div class="sub-some">
                <h5>Shop online with the best deals & offers</h5>
                <p>Now Get Upto 40% Off On Everyday Essential Products Shown On The Offer Page. The range includes Grocery, Personal Care,
                    Baby Care, Pet Supplies, Healthcare and Other Daily Need Products. Discount May Vary From Product To Product.</p>
            </div>
        </div>
        <!-- //footer fourth section (text) -->
    </div>
</footer>
