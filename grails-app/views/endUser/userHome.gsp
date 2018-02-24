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
</head>

<body>
<div id="content">

    <div class="container">
        <div class="col-md-12">
            <div id="main-slider">
<g:each in="${upCoverImageList}" var="list">
                <div class="item coverUp">
                   <g:link action="offerBrand" controller="endUser" id="${list.productBrand.id}"> <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.imageName])}" class="img-responsive"></g:link>

                </div>
               </g:each>
            </div>
            <!-- /#main-slider -->
        </div>
    </div>
    <div class="container">
        <div class="col-md-12">
            <div class="box">

            <div class="social">
            <h2 style="color: #4fbfa8; margin-left: 8px;">Top Brands</h2>
                <%int i=0;
                    %>
<g:each in="${brandList}" var="list">
    <g:if test="${Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(list),false)}">

        <g:if test="${i<5}">
                <div class="col-md-2 col-sm-4 col-xs-4" style="margin-bottom: 10px;">
        <g:link action="topBrand" controller="endUser" id="${list.id}">

            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.logoName])}" class="img-responsive">
</g:link>
                </div>
            <% i=i+1
            %>
        </g:if>
    </g:if>
</g:each>

                %{--<p>--}%
                %{--<a id="btn_shareFacebook" class="facebook customer share" title="Facebook share" data-animate-hover="pulse" target="_blank"><i class="fa fa-facebook"></i></a>--}%
                %{--<a id="btn_shareTWI" class="twitter customer share" href="" title="Twitter share" data-animate-hover="pulse" target="_blank"><i class="fa fa-twitter"></i></a>--}%
                %{--<a id="btn_shareExternalGplus" class="gplus google_plus customer share" data-animate-hover="pulse" href="" title="Google Plus Share" target="_blank"><i class="fa fa-google-plus"></i></a>--}%
                %{--<a id="btn_shareLinkedIn" class="a btn btn-linkedin customer share" href="" title="linkedin Share" target="_blank" data-animate-hover="pulse"><i class="fa fa-linkedin"></i>--}%
                %{--</a>--}%
                %{--<a id="btn_shareInstagram" title="instagram Share" class="btn btn-instagram a" data-animate-hover="pulse" href="">--}%
                %{--<i class="fa fa-instagram"></i>--}%
                %{--</a>--}%
            %{--</p>--}%
        </div>
            </div>
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
    %{--<div id="advantages">--}%

        %{--<div class="container">--}%
            %{--<div class="same-height-row">--}%
                %{--<div class="col-sm-4">--}%
                    %{--<div class="box same-height">--}%
                        %{--<div class="icon"><i class="fa fa-heart"></i>--}%
                        %{--</div>--}%

                        %{--<h3>${homeContent.box1Title}</h3>--}%
                        %{--<p>${homeContent.box1Description}</p>--}%
                    %{--</div>--}%
                %{--</div>--}%

                %{--<div class="col-sm-4">--}%
                    %{--<div class="box same-height">--}%
                        %{--<div class="icon"><i class="fa fa-tags"></i>--}%
                        %{--</div>--}%

                        %{--<h3>${homeContent.box2Title}</h3>--}%
                        %{--<p>${homeContent.box2Description}.</p>--}%
                    %{--</div>--}%
                %{--</div>--}%

                %{--<div class="col-sm-4">--}%
                    %{--<div class="box same-height">--}%
                        %{--<div class="icon"><i class="fa fa-thumbs-up"></i>--}%
                        %{--</div>--}%

                        %{--<h3>${homeContent.box3Title}</h3>--}%
                        %{--<p>${homeContent.box3Description}.</p>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<!-- /.row -->--}%

        %{--</div>--}%
        %{--<!-- /.container -->--}%

    %{--</div>--}%
    <!-- /#advantages -->

    <!-- *** ADVANTAGES END *** -->

    <!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
    <g:if test="${latestProductList}">
    <div id="hot">

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
                    <div class="product product-height">
                        <div class="flip-container">
                            <div class="flipper">
                                <div class="front food1">
                                    <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive ">
                                    </g:link>
                                </div>
                                <div class="back food1">
    <g:link action="singleProduct" controller="endUser" id="${list.productId}">
        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">
    </g:link>
                                </div>
                            </div>
                        </div>
                        <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="invisible food1">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">
                        </g:link>
                        <div class="text">
                            <div class="tooltips">
                            <h3><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>
                            <span class="tooltiptext">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</span>
                           </div>
                            <g:if test="${list.productDetails.isSale==true}">
                                <p class="price"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>
                                    <del class="del-price">Rs.${list.productDetails.price}</del></p>
                            </g:if>
                            <g:if test="${list.productDetails.isSale==false}">

        <p class="price">Rs.${list.productDetails.price}</p>
        </g:if>
                        </div>
                        <!-- /.text -->
                        <g:if test="${list.productDetails.isSale==true}">
                        <div class="ribbon sale">
                            <div class="theribbon">SALE</div>
                            <div class="ribbon-background"></div>
                        </div>
                        </g:if>
                        <g:if test="${list.isLatest==true}">
                            <div class="ribbon new">
                                <div class="theribbon">NEW</div>
                                <div class="ribbon-background"></div>
                            </div>
                        </g:if>

                    <!-- /.ribbon -->
                    </div>
                    <!-- /.product -->
                </div>

           </g:each>
            </div>
            <div class="pages">
            <p class="loadMore">
                <g:link action="latestProducts" controller="endUser" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i>See more</g:link>
            </p>
            </div>
            <!-- /.product-slider -->
        </div>
        <!-- /.container -->

    </div>
    </g:if>
    <!-- /#hot -->
    <!-- *** HOT END *** -->

    <!-- *** GET INSPIRED ***
 _________________________________________________________ -->
    %{--<div class="container" data-animate="fadeInUpBig">--}%
        %{--<div class="col-md-12">--}%
            %{--<div class="box slideshow">--}%
                %{--<h3>${homeContent.coverDownImageTitle}</h3>--}%
                %{--<p class="lead">${homeContent.coverDownImageDescription}</p>--}%
                %{--<div id="get-inspired" class="owl-carousel owl-theme">--}%
%{--<g:each in="${downCoverImageList}" var="list">--}%

    %{--<div class="item coverDown">--}%
        %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.imageName])}" class="img-responsive">--}%

                    %{--</div>--}%
    %{--</g:each>--}%

                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
    <style>
    .coverDown img{
        height: 500px;
        width: 1120px;

    }
    </style>
    <!-- *** GET INSPIRED END *** -->

    <!-- *** BLOG HOMEPAGE ***
 _________________________________________________________ -->
<g:if test="${featuredProductList}">

    <div id="hot">

        <div class="box">
            <div class="container">
                <div class="col-md-12">
                    <h2>Top Sales</h2>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="product-slider">
                <g:each in="${featuredProductList}" var="list">

                    <div class="item">
                        <div class="product product-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front food1">
                                        <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">

                                        </g:link>
                                    </div>
                                    <div class="back food1">
                                        <g:link action="singleProduct" controller="endUser" id="${list.productId}">

                                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="invisible food1">
                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">


                            </g:link>
                            <div class="text">
                                <div class="tooltips">
                                    <h3><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>
                                    <span class="tooltiptext">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</span>
                                </div>
                                <g:if test="${list.productDetails.isSale==true}">
                                    <p class="price"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>

                                        <del class="del-price">Rs.${list.productDetails.price}</del></p>
                                </g:if>
                                <g:if test="${list.productDetails.isSale==false}">

                                    <p class="price">Rs.${list.productDetails.price}</p>
                                </g:if>
                            </div>
                        <!-- /.text -->
                            <g:if test="${list.productDetails.isSale==true}">
                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                            </g:if>
                            <g:if test="${list.isLatest==true}">
                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                            </g:if>

                        <!-- /.ribbon -->
                        </div>
                        <!-- /.product -->
                    </div>

                </g:each>
            </div>

            <!-- /.product-slider -->
        </div>
        <!-- /.container -->

    <div class="pages">
        <p class="loadMore">
            <g:link controller="endUser" action="topSales" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i>See more</g:link>
        </p>
    </div>
    </div>
</g:if>
    %{--<style>--}%
    %{--.div1 {--}%
        %{--overflow: hidden;--}%
        %{--white-space: nowrap;--}%

    %{--}--}%

    %{--<div class="container" data-animate="fadeInUpBig">--}%

        %{--<div class="col-md-12">--}%

            %{--<div class="box slideshow sildeshow1">--}%

                %{--<div id="thumbnail text-center nomargin">--}%
                    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:seasonManagementInstance.seasons.imageName])}" class="img-responsive image-nomargin">--}%

                    %{--<div class="middle1 col-sm-offset-4 col-sm-5">--}%
                        %{--<div class="text1">--}%
                            %{--<h3> <p class="text-center lead1">${seasonManagementInstance.seasons.greetings}</p></h3>--}%


                            %{--<p class="text-center lead lead2">${seasonManagementInstance.seasons.descriptionOfSeason}</p>--}%
                            %{--<div class="wthreeshop-a button-a">--}%
                                %{--<g:link action="upcomingSeasonProducts">${seasonManagementInstance.seasons.askingForShopping}</g:link>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%

                %{--</div>--}%



            %{--</div>--}%

        %{--</div>--}%

    %{--</div>--}%



        %{--<div class="col-md-12" data-animate="fadeInUp">--}%

            %{--<div id="blog-homepage" class="row">--}%
                %{--<div class="col-sm-6">--}%
                    %{--<div class="post">--}%
                        %{--<h4><a href="post.html">Fashion now</a></h4>--}%
                        %{--<p class="author-category">By <a href="#">John Slim</a> in <a href="">Fashion and style</a>--}%
                        %{--</p>--}%
                        %{--<hr>--}%
                        %{--<p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean--}%
                        %{--ultricies mi vitae est. Mauris placerat eleifend leo.</p>--}%
                        %{--<p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>--}%
                        %{--</p>--}%
                    %{--</div>--}%
                %{--</div>--}%

                %{--<div class="col-sm-6">--}%
                    %{--<div class="post">--}%
                        %{--<h4><a href="post.html">Who is who - example blog post</a></h4>--}%
                        %{--<p class="author-category">By <a href="#">John Slim</a> in <a href="">About Minimal</a>--}%
                        %{--</p>--}%
                        %{--<hr>--}%
                        %{--<p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean--}%
                        %{--ultricies mi vitae est. Mauris placerat eleifend leo.</p>--}%
                        %{--<p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>--}%
                        %{--</p>--}%
                    %{--</div>--}%

                %{--</div>--}%

            %{--</div>--}%
            <!-- /#blog-homepage -->
        %{--</div>--}%
    <div class="container">
        <div class="row">
        <div class="col-md-12">

            <div class="agileinfonewsl about-background" style="background-image:url('${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:BackgroundImage.list()[0].imageName])}')">


                <!-- Popup-Box -->
                <!-- //Popup-Box -->

            </div>
        </div>
        </div>
    </div>

</div>    <!-- /.container -->

</body>
</html>