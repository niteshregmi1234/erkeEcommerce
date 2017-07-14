<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 6/27/17
  Time: 11:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="endUserYamsaa">

    <title></title>
</head>

<body>

<div style="min-height: 50px;">
    <!-- Jssor Slider Begin -->

    <!-- ================================================== -->
    <div id="slider1_container" style="visibility: hidden; position: relative; margin: 0 auto;
    top: 0px; left: 0px; width: 1368px; height: 766px; overflow: hidden;">
        <!-- Loading Screen -->
        <!-- Slides Container -->
        <div u="slides" style="position: absolute; left: 0px; top: 0px; width: 1368px; height: 766px; overflow: hidden;">
<g:each in="${upCoverImageList}" var="list">

    <div>
                <img u="image" src="${resource(dir: "images/coverImage",file: "${list.imageName}")}">

            </div>
    </g:each>

        </div>

               <style>
        .jssorb051 .i {position:absolute;cursor:pointer;}
        .jssorb051 .i .b {fill:#fff;fill-opacity:0.5;stroke:#000;stroke-width:400;stroke-miterlimit:10;stroke-opacity:0.5;}
        .jssorb051 .i:hover .b {fill-opacity:.7;}
        .jssorb051 .iav .b {fill-opacity: 1;}
        .jssorb051 .i.idn {opacity:.3;}
        </style>
        <div data-u="navigator" class="jssorb051" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!--#endregion Bullet Navigator Skin End -->

        <!--#region Arrow Navigator Skin Begin -->
        <!-- Help: https://www.jssor.com/development/slider-with-arrow-navigator.html -->
        <style>
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
        </style>
        <div data-u="arrowleft" class="jssora051" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
        <!--#endregion Arrow Navigator Skin End -->

        <a style="display: none" href="https://www.jssor.com">Bootstrap Carousel</a>
    </div>
    <!-- Jssor Slider End -->
</div>

<!-- Marketing messaging and featurettes
    ================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${resource(dir: 'js', file: 'yamsaa/jquery-1.9.1.min.js')}" type="text/javascript"
charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yamsaa/bootstrap.min.js')}" type="text/javascript"
        charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yamsaa/docs.min.js')}" type="text/javascript"
        charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yamsaa/ie10-viewport-bug-workaround.js')}" type="text/javascript"
        charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yamsaa/jssor.slider.min.js')}" type="text/javascript"
        charset="utf-8"></script>

<script>
    jQuery(document).ready(function ($) {

        var options = {
            $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
            $AutoPlay: 1,                                    //[Optional] Auto play or not, to enable slideshow, this option must be set to greater than 0. Default value is 0. 0: no auto play, 1: continuously, 2: stop at last slide, 4: stop on click, 8: stop on user navigation (by arrow/bullet/thumbnail/drag/arrow key navigation)
            $Idle: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
            $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

            $ArrowKeyNavigation: 1,   			            //[Optional] Steps to go for each navigation request by pressing arrow key, default value is 1.
            $SlideEasing: $Jease$.$OutQuint,          //[Optional] Specifies easing for right to left animation, default value is $Jease$.$OutQuad
            $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
            $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide, default value is 20
            //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
            //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
            $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
            $Cols: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
            $Align: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
            $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
            $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
            $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $Cols is greater than 1, or parking position is not 0)

            $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                $Rows: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                $Scale: false                                   //Scales bullets navigator or not while slider scale
            },

            $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
            }
        };

        var jssor_slider1 = new $JssorSlider$("slider1_container", options);

        //responsive code begin
        //you can remove responsive code if you don't want the slider scales while window resizing
        function ScaleSlider() {
            var bodyWidth = document.body.clientWidth;
            if (bodyWidth)
                jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 1920));
            else
                window.setTimeout(ScaleSlider, 30);
        }
        ScaleSlider();

        $(window).bind("load", ScaleSlider);
        $(window).bind("resize", ScaleSlider);
        $(window).bind("orientationchange", ScaleSlider);
        //responsive code end
    });
</script>
    <!--/well-->


    <div class="col-lg-12">
<div class="agilemodel-slider">
    <div id='film_roll_1'>
<g:each in="${downCoverImageList}" var="list">

   <div><img class="imageCoverDown" src="${resource(dir: "images/coverImage",file: "${list.imageName}")}"></div>

      </g:each>
    </div>
</div>
    </div>
<!-- //Model-Slider -->


<!-- Latest-Arrivals -->
<div class="wthreehome-latest">


        <div class="wthreehome-latest-grids">
            <g:each in="${latestProductList}" var="list">
            <div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid1">
                <div class="grid">
                    <figure class="effect-apollo">
                        <img class="productImage" src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}">

                        <figcaption></figcaption>
                    </figure>
                </div>
                <h4>${list.productDetails.productBrand.brandName}</h4>
                <h5>${list.productDetails.productName}</h5>

                <h6><g:link action="singleProduct" id="${list.id}" controller="endUser">Shop Now</g:link></h6>
            </div>
                </g:each>
            <style>
            .productImage {
            position: relative;
            float: left;
            width:  640px;
            height: 420px;
            background-position: 50% 50%;
            background-repeat:   no-repeat;
            background-size:     cover;
            }
            .imageCoverDown{
                position: relative;
                float: left;
                width:  885px;
                height: 530px;
                background-position: 50% 50%;
                background-repeat:   no-repeat;
                background-size:     cover;
            }

            </style>
            %{--<div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid2">--}%
                %{--<div class="grid">--}%
                    %{--<figure class="effect-apollo">--}%
                        %{--<asset:image src="yamsaa/home-latest-2.jpg" alt="Groovy Apparel"/>--}%
                        %{--<figcaption></figcaption>--}%
                    %{--</figure>--}%
                %{--</div>--}%
                %{--<h4>LEATHER JACKETS</h4>--}%
                %{--<h5>Lorem Ipsum Dolor Site Amet</h5>--}%
                %{--<h6><a href="womens.html">Shop Now</a></h6>--}%
            %{--</div>--}%
            %{--<div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid3">--}%
                %{--<div class="grid">--}%
                    %{--<figure class="effect-apollo">--}%
                        %{--<asset:image src="yamsaa/home-latest-3.jpg" alt="Groovy Apparel"/>--}%
                        %{--<figcaption></figcaption>--}%
                    %{--</figure>--}%
                %{--</div>--}%
                %{--<h4>WATCHES</h4>--}%
                %{--<h5>Lorem Ipsum Dolor Site Amet</h5>--}%
                %{--<h6><a href="womens_accessories.html">Shop Now</a></h6>--}%
            %{--</div>--}%
            %{--<div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid4">--}%
                %{--<div class="grid">--}%
                    %{--<figure class="effect-apollo">--}%
                        %{--<asset:image src="yamsaa/home-latest-4.jpg" alt="Groovy Apparel"/>--}%
                        %{--<figcaption></figcaption>--}%
                    %{--</figure>--}%
                %{--</div>--}%
                %{--<h4>BEACH WEAR</h4>--}%
                %{--<h5>Lorem Ipsum Dolor Site Amet</h5>--}%
                %{--<h6><a href="mens.html">Shop Now</a></h6>--}%
            %{--</div>--}%
        </div>
        <div class="clearfix"></div>

    </div>
</div>
<!-- //Latest-Arrivals -->
<!-- Winter-Collection -->
<div class="wthreewinter-coll" id="a">
    <div class="container">
        <h1>${seasonManagementInstance.seasons.greetings}</h1>
        <p>${seasonManagementInstance.seasons.descriptionOfSeason}</p>
        <div class="wthreeshop-a">
            <g:link action="upcomingSeasonProducts" controller="endUser" id="${seasonManagementInstance.id}">${seasonManagementInstance.seasons.askingForShopping}</g:link>
        </div>
    </div>
</div>

<!-- //Winter-Collection -->


<!-- Denim-Collection -->
<div class="wthreedenim-coll">
    <div class="style-grids">
        <div class="col-md-6 style-grid style-grid-1">
            <img src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandMainImageName}")}">
            <div class="style-grid-1-text">
                <h3>${specialBrandInstance?.productBrand.brandName}</h3>
                <p>${specialBrandInstance?.descriptionMainImage}</p>
                <div class="wthreeshop-a">
                    <g:link action="specialBrandProducts" controller="endUser" id="${specialBrandInstance?.id}">SHOP ${specialBrandInstance.productBrand.brandName} COLLECTION</g:link>
                </div>
            </div>
        </div>
        <div class="col-md-6 style-grid style-grid-2">
            <div class="style-image-1 sub1">
                <img  src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub1ImageName}")}">
                <div class="style-grid-2-text">
                    <h3>${specialBrandInstance.titleForSub1Image}</h3>
                    <p>${specialBrandInstance.descriptionSub1Image}</p>
                </div>
            </div>
            <div class="style-image-2 sub2">

                    <img  src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub2ImageName}")}">
                <div class="style-grid-2-text">
                    <h3>${specialBrandInstance.titleForSub2Image}</h3>
                    <p>${specialBrandInstance.descriptionSub2Image}</p>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<style>
.sub1 {
    height: 350px;
}

/* resize images */
.sub1 img {
    width: 100%;

}
.sub2 {
    height: 350px;
}

/* resize images */
.sub2 img {
    width: 100%;

}
</style>
<!-- //Denim-Collection -->
<!-- Clearance-Sale -->
<div class="aitsclearance-sales">
    <div class="aitsclearance-sales-text">
        <h2>ALL FEATURED ITEMS</h2>
        <h4>GET HEAVY DISCOUNT AND PRIZES</h4>
        <div class="wthreeshop-a">
            <g:link action="featuredProducts" controller="endUser">SHOP NOW</g:link>
        </div>
    </div>
</div>
<!-- //Clearance-Sale -->



<!-- Shopping -->
<div class="agileshopping">
    <div class="container">

        <div class="agileshoppinggrids">
            <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="shopImageList" status="i">
            <div class="col-md-6 agileshoppinggrid agileshoppinggrid${i+1}">
                <div class="grid">
                    <g:link action="allCategoryProducts" controller="endUser" id="${shopImageList.id}">

                        <figure class="effect-apollo mens">
                            <img  class="a" src="${resource(dir: "images/categoryImage",file: "${shopImageList.shoppingImageName}")}">


                        <figcaption></figcaption>
                    </figure>
                    </g:link>

                </div>
            </div>
            </g:each>
            <div class="clearfix"></div>
        </div>
        <style>
        .a {
            position: relative;
            float: left;
            width:  600px;
            height: 350px;
            background-position: 50% 50%;
            background-repeat:   no-repeat;
            background-size:     cover;
        }

        </style>

        <div class="agileshoppinggrids-bottom">
            <h3>CHOOSE THE BEST FOR YOU</h3>
            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock.</p>
            <div class="agileshoppinggrids-bottom-grids">
                <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="list" status="i">
                <div class="col-md-6 agileshoppinggrids-bottom-grid agileshoppinggrids-bottom-grid${i+1}">
                    <div class="wthreeshop-a">
                        <g:link action="allCategoryProducts" id="${list.id}" controller="endUser">SHOP ${list.categoryName}</g:link>
                    </div>
                </div>
                </g:each>
                    <div class="clearfix"></div>
            </div>
        </div>

    </div>
</div>
<!-- //Shopping -->



<!-- Newsletter -->
<div class="agileinfonewsl">

    <p>Subscribe to us to get highest-level access to our new styles and trends</p>
    <div class="wthreeshop-a">
        <a class="popup-with-zoom-anim" href="#small-dialog3">SUBSCRIBE</a>
    </div>

    <!-- Popup-Box -->
    <div id="popup2">
        <div id="small-dialog3" class="mfp-hide agileinfo">
            <div class="pop_up">
                <h4>SUBSCRIBE</h4>
                <form action="#" method="post">
                    <input class="email aitsw3ls" type="email" placeholder="Email" required="">
                    <input type="submit" class="submit" value="SUBSCRIBE">
                </form>
            </div>
        </div>
    </div>
    <!-- //Popup-Box -->

</div>
<script>
    window.onload=function () {
        $.ajax({
            url: "${createLink(controller:'endUser', action:'fetchUrl')}",
        }).done(function(imageUrl){
            fileExists(imageUrl);
        });

    };
    function fileExists(fileLocation) {
        var fileLocation1=fileLocation[0];
        var response = $.ajax({
            url: fileLocation1,
            type: 'HEAD',
            cache:false,
            async: false
        }).status;
        if(response==200) {

            $('.wthreewinter-coll').css('background-image', 'url(' + fileLocation[0] + ')');
            $('.aitsclearance-sales').css('background-image', 'url(' + fileLocation[2] + ')');
            $('.agileinfonewsl').css('background-image', 'url(' + fileLocation[4] + ')');

        }
        else{

            $('.wthreewinter-coll').css('background-image', 'url(' + fileLocation[1] + ')');
            $('.aitsclearance-sales').css('background-image', 'url(' + fileLocation[3] + ')');
            $('.agileinfonewsl').css('background-image', 'url(' + fileLocation[5] + ')');

        }
    }
</script>
</body>
</html>