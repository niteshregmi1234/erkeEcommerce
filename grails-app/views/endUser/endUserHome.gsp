<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 6/27/17
  Time: 11:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="endUserYamsaa">

    <title></title>
</head>

<body>
<div class="w3slideraits">
    <div class="fluid_dg_wrap fluid_dg_emboss pattern_1 fluid_dg_white_skin" id="fluid_dg_wrap_4">
   <g:each in="${upCoverImageList}" var="list">
        <div data-thumb="${resource(dir: "images/coverImage",file: "${list.imageName}")}" data-src="${resource(dir: "images/coverImage",file: "${list.imageName}")}"></div>
   </g:each>


    </div>
</div>
<div class="agilemodel-slider">
    <div id='film_roll_1'>
<g:each in="${downCoverImageList}" var="list">

   <div><img class="imageCoverDown" src="${resource(dir: "images/coverImage",file: "${list.imageName}")}"></div>

      </g:each>
    </div>
</div>
<!-- //Model-Slider -->



<!-- Latest-Arrivals -->
<div class="wthreehome-latest">
    <div class="container">

        <div class="wthreehome-latest-grids">
            <g:each in="${latestProductList}" var="list">
            <div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid1">
                <div class="grid">
                    <figure class="effect-apollo">
                        <img class="productImage" src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}">

                        <figcaption></figcaption>
                    </figure>
                </div>
                <h4>DENIM TOPS</h4>
                <h5>Lorem Ipsum Dolor Site Amet</h5>
                <h6><g:link action="productDetails" controller="endUser">Shop Now</g:link></h6>
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
        <h1>BRACE YOURSELVES! WINTER IS COMING...</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <div class="wthreeshop-a">
            <a href="womens.html">SHOP WINTER COLLECTION</a>
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
                <h3>DENIM JEANS</h3>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur.</p>
                <div class="wthreeshop-a">
                    <a href="womens.html">SHOP DENIM COLLECTION</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 style-grid style-grid-2">
            <div class="style-image-1 sub1">
                <img  src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub1ImageName}")}">
                <div class="style-grid-2-text">
                    <h3>WATER REPELLENT</h3>
                    <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</p>
                </div>
            </div>
            <div class="style-image-2 sub2">

                    <img  src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub2ImageName}")}">
                <div class="style-grid-2-text">
                    <h3>STITCHED TO PERFECTION</h3>
                    <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</p>
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
        <h2>ALL CLEARANCE ITEMS</h2>
        <h4>BUY ONE AND GET ONE FREE</h4>
        <h5>50% OFF <small>On selected products<sup>*</sup></small></h5>
        <div class="wthreeshop-a">
            <a href="mens.html">SHOP NOW</a>
        </div>
    </div>
</div>
<!-- //Clearance-Sale -->



<!-- Shopping -->
<div class="agileshopping">
    <div class="container">

        <div class="agileshoppinggrids">
            <div class="col-md-6 agileshoppinggrid agileshoppinggrid1">
                <div class="grid">
                    <figure class="effect-apollo mens">
                        <img  class="a" src="${resource(dir: "images/otherStuffs",file: "${backgroundImageInstance[2].imageName}")}">


                        <figcaption></figcaption>
                    </figure>
                </div>
            </div>
            <div class="col-md-6 agileshoppinggrid agileshoppinggrid2">
                <div class="grid">
                    <figure class="effect-apollo womens">
                        <img  class="b" src="${resource(dir: "images/otherStuffs",file: "${backgroundImageInstance[3].imageName}")}" >


                        <figcaption></figcaption>
                    </figure>
                </div>
            </div>
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
        .b{
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
                <div class="col-md-6 agileshoppinggrids-bottom-grid agileshoppinggrids-bottom-grid1">
                    <div class="wthreeshop-a">
                        <a href="mens.html">SHOP MEN</a>
                    </div>
                </div>
                <div class="col-md-6 agileshoppinggrids-bottom-grid agileshoppinggrids-bottom-grid2">
                    <div class="wthreeshop-a">
                        <a href="womens.html">SHOP WOMEN</a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
</div>
<!-- //Shopping -->



<!-- Newsletter -->
<div class="agileinfonewsl">

    <h3>SIGN UP FOR NEWSLETTER</h3>
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