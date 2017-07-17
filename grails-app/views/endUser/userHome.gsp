<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/13/17
  Time: 6:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userYarsaa">
    <title></title>
I am here
</head>

<body>
<div id="content">

    <div class="container">
        <div class="col-md-12">
            <div id="main-slider">
<g:each in="${upCoverImageList}" var="list">
                <div class="item coverUp">
                    <img src="${resource(dir: "images/coverImage",file: "${list.imageName}")}" alt="" class="img-responsive">
                </div>
               </g:each>
            </div>
            <!-- /#main-slider -->
        </div>
    </div>

    <!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->
    <style>
.coverUp img{
    height:520px;
    width: 1108px;
}
    </style>
    <div id="advantages">

        <div class="container">
            <div class="same-height-row">
                <div class="col-sm-4">
                    <div class="box same-height clickable">
                        <div class="icon"><i class="fa fa-heart"></i>
                        </div>

                        <h3><a href="#">We love our customers</a></h3>
                        <p>We are known to provide best possible service ever</p>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="box same-height clickable">
                        <div class="icon"><i class="fa fa-tags"></i>
                        </div>

                        <h3><a href="#">Best prices</a></h3>
                        <p>You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="box same-height clickable">
                        <div class="icon"><i class="fa fa-thumbs-up"></i>
                        </div>

                        <h3><a href="#">100% satisfaction guaranteed</a></h3>
                        <p>Free returns on everything for 3 months.</p>
                    </div>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>
    <!-- /#advantages -->

    <!-- *** ADVANTAGES END *** -->

    <!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
    <div id="hot" data-animate="fadeInUpBig">

        <div class="box">
            <div class="container">
                <div class="col-md-12">
                    <h2>Hot this week</h2>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="product-slider">
<g:each in="${latestProductList}" var="list">

                <div class="item">
                    <div class="product">
                        <div class="flip-container">
                            <div class="flipper">
                                <div class="front food1">
                                    <g:link action="singleProduct" controller="endUser" id="${list.id}">
                                        <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                    </g:link>
                                </div>
                                <div class="back food1">
    <g:link action="singleProduct" controller="endUser" id="${list.id}">

        <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                    </g:link>
                                </div>
                            </div>
                        </div>
                        <g:link action="singleProduct" controller="endUser" id="${list.id}" class="invisible food1">
                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">


                        </g:link>
                        <div class="text">
                            <h3><g:link action="singleProduct" controller="endUser" id="${list.id}">${list.productDetails.productName}</g:link></h3>
                            <p class="price">Rs.${list.productDetails.price}</p>
                        </div>
                        <!-- /.text -->

                        <div class="ribbon new">
                            <div class="theribbon">NEW</div>
                            <div class="ribbon-background"></div>
                        </div>
                        <!-- /.ribbon -->
                    </div>
                    <!-- /.product -->
                </div>

           </g:each>
            </div>
            <!-- /.product-slider -->
        </div>
        <!-- /.container -->

    </div>
    <!-- /#hot -->
<style>
.food1 img {
    height: 235px;
}

</style>
    <!-- *** HOT END *** -->

    <!-- *** GET INSPIRED ***
 _________________________________________________________ -->
    <div class="container" data-animate="fadeInUpBig">
        <div class="col-md-12">
            <div class="box slideshow">
                <h3>Get Inspired</h3>
                <p class="lead">Get the inspiration from our world class designers</p>
                <div id="get-inspired" class="owl-carousel owl-theme">
<g:each in="${downCoverImageList}" var="list">

    <div class="item coverDown">
                            <img src="${resource(dir: "images/coverImage",file: "${list.imageName}")}" alt="Get inspired" class="img-responsive">
                    </div>
    </g:each>

                </div>
            </div>
        </div>
    </div>
    <style>
    .coverDown img{
        height: 500px;
        width: 1120px;

    }
    </style>
    <!-- *** GET INSPIRED END *** -->

    <!-- *** BLOG HOMEPAGE ***
 _________________________________________________________ -->
    <div id="hot" data-animate="fadeInUpBig">

        <div class="box">
            <div class="container">
                <div class="col-md-12">
                    <h2>Featured Items</h2>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="product-slider">
                <g:each in="${featuredProductList}" var="list">

                    <div class="item">
                        <div class="product">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front food1">
                                        <a href="detail.gsp">
                                            <img src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}" alt="" class="img-responsive">

                                        </a>
                                    </div>
                                    <div class="back food1">
                                        <a href="detail.gsp">
                                            <img src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}" alt="" class="img-responsive">

                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.gsp" class="invisible food1">
                                <img src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}" alt="" class="img-responsive">


                            </a>
                            <div class="text">
                                <h3><a href="detail.gsp">White Blouse Versace</a></h3>
                                <p class="price">$143.00</p>
                            </div>
                            <!-- /.text -->

                            <div class="ribbon new">
                                <div class="theribbon">NEW</div>
                                <div class="ribbon-background"></div>
                            </div>
                            <!-- /.ribbon -->
                        </div>
                        <!-- /.product -->
                    </div>

                </g:each>
            </div>
            <!-- /.product-slider -->
        </div>
        <!-- /.container -->

    </div>
    <div class="container" data-animate="fadeInUpBig">

        <div class="col-md-12">

            <div class="box slideshow">

                <div id="thumbnail text-center nomargin">
        <img src="${resource(dir: "images/seasonsImage",file: "${seasonManagementInstance.seasons.imageName}")}" alt="" class="img-responsive">

                       <div class="caption1 col-sm-offset-4 col-sm-5">
                           <h3> <p class="text-center lead1">${seasonManagementInstance.seasons.greetings}</p></h3>


                           <p class="text-center lead lead2">${seasonManagementInstance.seasons.descriptionOfSeason}</p>
                           <a href="#" class="btn btn-primary subButton" style="margin-bottom: 10px;">${seasonManagementInstance.seasons.askingForShopping}</a>

                       </div>
                        </div>



            </div>

                </div>

    </div>

<style>
    .caption1{
        position:absolute;
        top:30%;
        left:-30px;
        background: rgba(255,255,255,0.44);
    }

</style>
    <div class="box text-center" data-animate="fadeInUp">
        <div class="container">
            <div class="col-md-12">
                <h3 class="text-uppercase"></h3>

                <p class="lead">What's new in the world of fashion?
                </p>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="col-md-12" data-animate="fadeInUp">

            <div id="blog-homepage" class="row">
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive image" src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandMainImageName}")}">
                        <div class="middle">
                            <div class="text">                        <a href="http://bootstrapthemes.co/" target="_blank" class="btn btn-primary" data-animation="animated fadeInLeft">Shop Now</a></div>
                        </div>

                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub1ImageName}")}">

                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance?.brandSub1ImageName}")}">

                    </div>

                </div>


            </div>
            <!-- /#blog-homepage -->
        </div>
    </div>

    <!-- /.container -->

    <!-- *** BLOG HOMEPAGE END *** -->
    <div class="box text-center" data-animate="fadeInUp">
        <div class="container">
            <div class="col-md-12">
                <h3 class="text-uppercase"></h3>

                <p class="lead">What's new in the world of fashion?
                </p>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="col-md-12" data-animate="fadeInUp">

            <div id="blog-homepage" class="row">
                <div class="col-sm-6">
                    <div class="post">
                        <h4><a href="post.html">Fashion now</a></h4>
                        <p class="author-category">By <a href="#">John Slim</a> in <a href="">Fashion and style</a>
                        </p>
                        <hr>
                        <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
                        ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                        <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>
                        </p>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="post">
                        <h4><a href="post.html">Who is who - example blog post</a></h4>
                        <p class="author-category">By <a href="#">John Slim</a> in <a href="">About Minimal</a>
                        </p>
                        <hr>
                        <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
                        ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                        <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>
                        </p>
                    </div>

                </div>

            </div>
            <!-- /#blog-homepage -->
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12">

        <div class="agileinfonewsl">


        <!-- Popup-Box -->
        <!-- //Popup-Box -->

    </div>
            </div>
</div>

</div>    <!-- /.container -->

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
    <!-- *** BLOG HOMEPAGE END *** -->
<style>

.middle {
    transition: .5s ease;
    opacity: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%)
}
.agileinfonewsl {
    /*background-image: url("../../imagess/yamsaa/newsletter.jpg");*/
    background-position: center center;
    background-size: cover;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-attachment: fixed;
    text-align: center;
    height: 600px;
    width: 1110px;
}

.imgwrapper:hover .image {
    opacity: 0.3;
}

.imgwrapper:hover .middle {
    opacity: 1;
}

.text {
    color: #0c099e;
    font-size: 16px;
    padding: 16px 32px;
}
</style>



</body>
</html>