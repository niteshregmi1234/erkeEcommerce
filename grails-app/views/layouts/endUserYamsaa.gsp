<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
--> 
<!DOCTYPE html>
<html lang="zxx">
<!-- Head -->
<head>

    <title>Yamsaa
    </title>
    <!-- Meta-Tags -->

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        } </script>
    <!-- //Meta-Tags -->

    <!-- Custom-StyleSheet-Links -->
    <!-- Bootstrap-CSS --><asset:stylesheet src="yamsaa/bootstrap.css"/>

    <!-- Index-Page-CSS -->    <!-- Bootstrap-CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/style.css')}" type="text/css"
          media="all"/>
    <asset:stylesheet src="yamsaa/fluid_dg.css" id="fluid_dg-css"/>
    <!-- Header-Slider-CSS -->
    <!-- //Custom-StyleSheet-Links -->

    <!-- Fonts -->


    <!-- Font-Awesome-File-Links -->

    <!-- CSS -->
    <asset:stylesheet src="yamsaa/font-awesome.css" id="fluid_dg-css"/>
    <asset:stylesheet src="yamsaa/flexslider.css"/>


    <asset:stylesheet src="fonts/fontawesome-webfont.ttf"/>

    <!-- //Font-Awesome-File-Links -->
    <asset:javascript src="yamsaa/modernizr-2.6.2-respond-1.1.0.min.js"/>
    <asset:javascript src="yamsaa/modernizr.custom.js"></asset:javascript>

    <!-- Custom-JavaScript-File-Links -->

    <!-- cart-js -->
    <asset:javascript src="yamsaa/minicart.js"></asset:javascript>

    <!-- Supportive-Modernizr-JavaScript -->

    <!-- Default-JavaScript -->
    <asset:javascript src="yamsaa/jquery.easing.1.3.js"></asset:javascript>

    <asset:javascript src="yamsaa/fluid_dg.min.js"></asset:javascript>

    <asset:javascript src="yamsaa/jquery.magnific-popup.js"></asset:javascript>
    <asset:javascript src="yamsaa/jquery.film_roll.js"></asset:javascript>

    <asset:javascript src="yamsaa/bootstrap.js"></asset:javascript>
    <asset:javascript src="yamsaa/jquery-2.2.3.js"></asset:javascript>

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/jquery.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%
    <asset:javascript src="yamsaa/jquery.flexslider.js"></asset:javascript>
    <asset:javascript src="yamsaa/imagezoom.js"></asset:javascript>
    <asset:javascript src="yamsaa/cbpShop.min.js"></asset:javascript>

    <style>
    .container {
        margin: 0 auto;
        width: 100%;
    }
    </style>

</head>
<!-- //Head -->



<!-- Body -->
<body>

<!-- Header -->
<div class="agileheader" id="agileitshome">

    <!-- Navigation -->
    <nav class="navbar navbar-default w3ls navbar-fixed-top">
        <div class="container">
            <div class="col-lg-12">
            <div class="navbar-header wthree nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                        data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link class="navbar-brand agileinfo" action="endUserHome" controller="endUser"><span>YAMSAA</span>.COM</g:link>
                <ul class="w3header-cart">
                    <li class="wthreecartaits"><span class="my-cart-icon"><i class="fa fa-cart-arrow-down"
                                                                             aria-hidden="true"></i><span
                            class="badge badge-notify my-cart-badge"></span></span></li>
                </ul>
            </div>

            <div id="bs-megadropdown-tabs" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="list" status="i">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle w3-agile hyper"
                               data-toggle="dropdown"><span>${list.categoryName}</span></a>
                            <ul class="dropdown-menu aits-w3 multi multi${i + 1}">
                                <div class="row">
                                    <div class="col-sm-3 w3layouts-nav-agile w3layouts-mens-nav-agileits w3layouts-mens-nav-agileits-1">
                                        <ul class="multi-column-dropdown">
                                            <li class="heading">Categories</li>
                        <g:each in="${ProductSubCategory.findAllByStatusShow(true)}" var="subCategoryList">

                            <li><g:link action="listProduct" params="[id1:list.id,id2:subCategoryList.id]"><i class="fa fa-angle-right"
                                                                       aria-hidden="true"></i>${subCategoryList.subCategoryName}</g:link></li>
</g:each>
                                            %{--<li><a href="categoryProducts.gsp"><i class="fa fa-angle-right"--}%
                                                                       %{--aria-hidden="true"></i>Online Only</a></li>--}%
                                            %{--<li><a href="categoryProducts.gsp"><i class="fa fa-angle-right"--}%
                                                                       %{--aria-hidden="true"></i>Brands</a></li>--}%
                                            %{--<li><a href="categoryProducts.gsp"><i class="fa fa-angle-right"--}%
                                                                       %{--aria-hidden="true"></i>Clearance Sale</a></li>--}%
                                            %{--<li><a href="categoryProducts.gsp"><i class="fa fa-angle-right"--}%
                                                                       %{--aria-hidden="true"></i>Discount Store</a></li>--}%
                                            %{--<li><a href="categoryProducts.gsp"><i class="fa fa-angle-right"--}%
                                                                       %{--aria-hidden="true"></i>Editor's Pick</a></li>--}%
                                        </ul>
                                    </div>

                                        <div  class="col-sm-3 w3layouts-nav-agile w3layouts-mens-nav-agileits w3layouts-mens-nav-agileits-2">
                                            <g:link action="allCategoryProducts" controller="endUser" id="${list.id}">
                                                <img
                                                     src="${resource(dir: "images/categoryImage", file: "${list.menuImage1}")}" height="170">
</g:link>
                                        </div>
                                    <div  class="col-sm-3 w3layouts-nav-agile w3layouts-mens-nav-agileits w3layouts-mens-nav-agileits-2">
                                        <g:link action="allCategoryProducts" controller="endUser" id="${list.id}">
                                            <img
                                                    src="${resource(dir: "images/categoryImage", file: "${list.menuImage2}")}" height="170">
                                        </g:link>
                                    </div>
                                    <div  class="col-sm-3 w3layouts-nav-agile w3layouts-mens-nav-agileits w3layouts-mens-nav-agileits-2">
                                        <g:link action="allCategoryProducts" controller="endUser" id="${list.id}">
                                            <img
                                                    src="${resource(dir: "images/categoryImage", file: "${list.menuImage3}")}" height="170">
                                        </g:link>
                                    </div>




                                    <div class="clearfix"></div>

                                    <p class="promo">Use Promo Code <span>#CFFGTY56</span> and take 30% off the products. <a
                                            href="#">Details</a></p>
                                </div>

                            </ul>
                        </li>
                    </g:each>


                    <li><g:link action="aboutCompany" controller="endUser">ABOUT</g:link></li>
                    <li class="wthreesearch">
                        <form action="#" method="post">
                            <input type="search" name="Search" placeholder="Search for a Product" required="">
                            <button type="submit" class="btn btn-default search" aria-label="Left Align">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>
                    </li>
                    <li class="wthreecartaits wthreecartaits2 cart cart box_1">
                        <form action="#" method="post" class="last">
                            <input type="hidden" name="cmd" value="_cart"/>
                            <input type="hidden" name="display" value="1"/>
                            <button class="w3view-cart" type="submit" name="submit" value=""><i
                                    class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                        </form>
                    </li>
                </ul>
            </div>

        </div>

            </div>
</nav>
    <!-- //Navigation -->



    <!-- Header-Top-Bar-(Hidden) -->
    <div class="agileheader-topbar">
        <div class="container">
            <div class="col-md-6 agileheader-topbar-grid agileheader-topbar-grid1">
                %{--<p>Free shipping on orders over $150. <a href="payment.html">Details</a></p>--}%
            </div>

            <div class="col-md-6 agileheader-topbar-grid agileheader-topbar-grid2">
                <ul>
                    <li><a class="popup-with-zoom-anim" href="#small-dialog1">Login</a></li>
                    <li><a class="popup-with-zoom-anim" href="#small-dialog2">Sign Up</a></li>
                    <li><g:link controller="endUser" action="contact">Contact</g:link></li>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>

        <!-- Popup-Box -->
        <div id="popup1">
            <div id="small-dialog1" class="mfp-hide agileinfo">
                <div class="pop_up">
                    <form action="#" method="post">
                        <h3>LOGIN</h3>
                        <input type="text" Name="Userame" placeholder="Username" required="">
                        <input type="password" Name="Password" placeholder="Password" required="">
                        <ul class="tick w3layouts agileinfo">
                            <li>
                                <input type="checkbox" id="brand1" value="">
                                <label for="brand1"><span></span>Remember me</label>
                            </li>
                            <li>
                                <a href="#">Forgot Password?</a>
                            </li>
                        </ul>

                        <div class="send-button wthree agileits">
                            <input type="submit" value="LOGIN">
                        </div>
                    </form>
                </div>
            </div>

            <div id="small-dialog2" class="mfp-hide agileinfo">
                <div class="pop_up">
                    <form action="#" method="post">
                        <h3>SIGN UP</h3>
                        <input type="text" Name="Name" placeholder="Name" required="">
                        <input type="text" Name="Email" placeholder="Email" required="">
                        <input type="password" Name="Password" placeholder="Password" required="">
                        <input type="text" Name="Phone Number" placeholder="Phone Number" required="">

                        <div class="send-button wthree agileits">
                            <input type="submit" value="SIGN UP">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- //Popup-Box -->

    </div>
    <!-- //Header-Top-Bar-(Hidden) -->



    <!-- Header-Slider -->
    <!-- //Header-Slider -->

</div>
<!-- //Header -->
<div class="container">
<g:layoutBody></g:layoutBody>
</div>
<!-- Model-Slider -->
<!-- //Newsletter -->



<!-- Footer -->
<div class="agileinfofooter">
    <div class="agileinfofooter-grids">

        <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid1">
            <ul>
                <li><a href="about.html">ABOUT</a></li>
                <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="list">
                    <li><g:link action="allCategoryProducts" controller="endUser" id="${list.id}">${list.categoryName}'S</g:link></li>

                </g:each>
            </ul>
        </div>

        <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid2">
            <ul>
                <li><a href="stores.html">STORE LOCATOR</a></li>
                <li><a href="contact.html">CONTACT</a></li>
            </ul>
        </div>

        <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid3">
            <address>
                <ul>
                    <li>40019 Parma Via Modena</li>
                    <li><a class="mail" href="mailto:mail@example.com">${CompanyInformation.list()[0].emailAddress}</a></li>
                </ul>
            </address>
        </div>

        <div class="clearfix"></div>

    </div>
</div>
<!-- //Footer -->



<!-- Copyright -->
<div class="w3lscopyrightaits">
    <div class="col-md-8 w3lscopyrightaitsgrid w3lscopyrightaitsgrid1">
        <p>© 2017 YAMSAA.COM. All Rights Reserved | Design by <a target="=_blank">Hemanta Ghimire</a></p>
    </div>

    <div class="col-md-4 w3lscopyrightaitsgrid w3lscopyrightaitsgrid2">
        <div class="agilesocialwthree">
            <ul class="social-icons">
                <li><a href="#" class="facebook w3ls" title="Go to Our Facebook Page"><i
                        class="fa w3ls fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="#" class="twitter w3l" title="Go to Our Twitter Account"><i
                        class="fa w3l fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="#" class="googleplus w3" title="Go to Our Google Plus Account"><i
                        class="fa w3 fa-google-plus-square" aria-hidden="true"></i></a></li>
                <li><a href="#" class="instagram wthree" title="Go to Our Instagram Account"><i
                        class="fa wthree fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#" class="youtube w3layouts" title="Go to Our Youtube Channel"><i
                        class="fa w3layouts fa-youtube-square" aria-hidden="true"></i></a></li>
            </ul>
        </div>
    </div>

    <div class="clearfix"></div>
</div>
<!-- //Copyright -->



<!-- Custom-JavaScript-File-Links -->

<!-- Default-JavaScript -->


<script>
//    w3l.render();

    w3l.cart.on('w3agile_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {
            }
        }
    });
</script>
<!-- //cart-js -->
<!-- Shopping-Cart-JavaScript -->

<!-- Header-Slider-JavaScript-Files -->

%{--<script type="application/javascript">jQuery(document).ready(function () {--}%
    %{--jQuery(function () {--}%
        %{--jQuery('#fluid_dg_wrap_4').fluid_dg({--}%
            %{--height: 'auto',--}%
            %{--loader: 'bar',--}%
%{--//            pagination: false,--}%
            %{--thumbnails: true,--}%
            %{--hover: false,--}%
            %{--opacityOnGrid: false,--}%
            %{--imagePath: '',--}%
            %{--time: 4000,--}%
            %{--transPeriod: 2000,--}%
        %{--});--}%
    %{--});--}%
%{--})--}%
%{--</script>--}%
<!-- //Header-Slider-JavaScript-Files -->

<!-- Dropdown-Menu-JavaScript -->
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
        );
    });
</script>
<!-- //Dropdown-Menu-JavaScript -->

<!-- Pricing-Popup-Box-JavaScript -->

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
<!-- //Pricing-Popup-Box-JavaScript -->

<!-- Model-Slider-JavaScript-Files -->

<script>
    (function () {
        jQuery(function () {
            this.film_rolls || (this.film_rolls = []);
            this.film_rolls['film_roll_1'] = new FilmRoll({
                container: '#film_roll_1',
                height: 560
            });
            return true;
        });
    }).call(this);
</script>
<!-- //Model-Slider-JavaScript-Files -->

<!-- //Custom-JavaScript-File-Links -->



<!-- Bootstrap-JavaScript -->

</body>
<!-- //Body -->

</html>