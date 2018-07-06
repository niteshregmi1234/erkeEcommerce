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

    %{--<div class="container coverImage" style="width: 1346px;">--}%
        %{--<div class="col-lg-12">--}%
            <div id="main-slider">
<g:each in="${totalArray[0]}" var="list">

                <div class="item">
                   <g:link action="topBrand" controller="endUser" params="[brandNames:list.productBrand.urlName]"> <img src="${resource(dir: 'images', file: 'spinner-cover.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.imageName])}" class="img-responsive lazy"></g:link>

                </div>

     
          </g:each>
            %{--</div>--}%
            <!-- /#main-slider -->
        </div>

    %{--</div>--}%
    %{--<div class="container">--}%
        %{--<div class="col-md-12">--}%
    <div id="wrapperTopBrand">
            <div class="box topBrandDiv">

            <div class="social">
            <h2 style="color: #4fbfa8; margin-left: 8px;">Top Brands <g:link action="allBrands" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
                <% int j=0
                k=0%>
<g:each in="${totalArray[1]}" var="list" status="i">
    <g:if test="${Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(list),false)}">
               <% if(j<12) {%>
                <div class="col-md-2 col-sm-4 col-xs-4" style="margin-bottom: 10px;">
        <g:link action="topBrand" controller="endUser" params="[brandNames:list.urlName]">

            <img src="${resource(dir: 'images', file: 'spinner-brand-logo.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.logoName])}" class="img-responsive lazy">
</g:link>
                </div>

        <%}%>
        <% j=j+1%>

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
                </h4>
            </div>
    <div class="box topBrandDivSide">

    </div>
</div>
    %{--</div>--}%

%{--</div>--}%

    <!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->

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
    <g:if test="${totalArray[2]}">
        <div id="wrapperHotProduct">

        <div id="hot" class="hot">

        <div class="boxBar">
            <h2>Hot this week <g:link action="latestProducts" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
        </div>
            <div class="product-slider productHot" id="topDIv">
<g:each in="${totalArray[2]}" var="list">
    <div class="item ">
                    <div class="product product-height">
                        <div class="flip-container">
                            <div class="flipper">
                                <div class="front">
                                    <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">
                                        <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">
                                    </g:link>
                                </div>
                                <div class="back">
    <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">
        <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">
    </g:link>
                                </div>
                            </div>
                        </div>
                        <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible food1">
                            <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">
                        </g:link>
                        <div class="text">
                                %{--<h3><g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>--}%
                                <div class="productDescription">${list.productDetails.briefDescription}</div>
                            <g:if test="${list.productDetails.isSale==true}">
                                <p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 135px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />
                                    <del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>
                                <div class="discountBox">-${list.productDetails.discountPercentage}%</div>
                            </g:if>
                            <g:if test="${list.productDetails.isSale==false}">

                                <p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>
                            </g:if>
                        </div>

                    </div>

        <!-- /.product -->

    </div>
           </g:each>

            </div>
        </div>
    <div class="box hotProductSide">

    </div>
            <!-- /.product-slider -->
</div>


        <!-- /.container -->



    </g:if>
<g:if test="${totalArray[3]}">
    <div class="wrapperSalesProduct">

<div id="hot" class="sales">

    <div class="boxBarSales">
        <h2>Top Sales <g:link action="topSales" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>

        </div>

            <div class="product-slider productHot">
                <g:each in="${totalArray[3]}" var="list">

                    <div class="item">
                        <div class="product product-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">
                                            <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                        </g:link>
                                    </div>
                                    <div class="back">
                                        <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">

                                            <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible food1">
                                <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">


                            </g:link>
                            <div class="text">
                                %{--<h3><g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>--}%
                                <div class="productDescription">${list.productDetails.briefDescription}</div>
                                <g:if test="${list.productDetails.isSale==true}">
                                    <p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 135px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />
                                        <del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>
                                    <div class="discountBox">-${list.productDetails.discountPercentage}%</div>
                                </g:if>
                                <g:if test="${list.productDetails.isSale==false}">

                                    <p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>
                                </g:if>
                            </div>


                            <!-- /.ribbon -->
                        </div>
                        <!-- /.product -->
                    </div>

                </g:each>
            </div>

            <!-- /.product-slider -->
        <!-- /.container -->


    </div>
        <div class="box salesProductSide">

        </div>

    </div>

</g:if>

<div class="row aid">
    <div class="col-md-6 col-xs-6 col-sm-6">
        <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">

                    <g:link action="nepaliProducts" controller="endUser">    <img src="${resource(dir: 'images', file: 'spinner-home-ad-full.gif')}" data-src="${resource(dir: 'images', file: 'hp1.jpg')}" class="img-responsive lazy"></g:link>

                </div>
    <div class="col-md-6 col-sm-6 col-xs-6">

        <g:link action="nepaliProducts" controller="endUser">    <img src="${resource(dir: 'images', file: 'spinner-home-ad-full.gif')}" data-src="${resource(dir: 'images', file: 'hp1.jpg')}" class="img-responsive lazy"></g:link>

    </div>
        </div><br>
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-6">

    <g:link action="nepaliProducts" controller="endUser">    <img src="${resource(dir: 'images', file: 'spinner-home-ad-full.gif')}" data-src="${resource(dir: 'images', file: 'hp1.jpg')}" class="img-responsive lazy"></g:link>

</div>
    <div class="col-md-6 col-sm-6 col-xs-6">

        <g:link action="nepaliProducts" controller="endUser">    <img src="${resource(dir: 'images', file: 'spinner-home-ad-full.gif')}" data-src="${resource(dir: 'images', file: 'hp1.jpg')}" class="img-responsive lazy"></g:link>

    </div>
    </div>
    </div>
    <div class="col-md-6 col-xs-6 col-sm-6">
<div class="row">
    <div class="col-md-12 ">
                    <g:link controller="endUser" action="specifiedProducts"  params="[category:'electronics',subCategorySpecify: 'laptop-computer']">

                        <img src="${resource(dir: 'images', file: 'spinner-home-ad-half.gif')}" data-src="${resource(dir: 'images', file: 'hp3.jpg')}" class="img-responsive lazy" >
                    </g:link>
                </div>
</div><br>
        <div class="row">

            <div class="col-md-12 ">
                                                <g:link action="allCategoryProducts" params="[category:'women']" controller="endUser">

    <img src="${resource(dir: 'images', file: 'spinner-home-ad-half.gif')}" data-src="${resource(dir: 'images', file: 'Ph4.jpg')}" class="img-responsive lazy" >
                                                </g:link>
                    </div>
        </div>
    </div>
    </div>


            <!-- /#blog-homepage -->
<br>
    <g:each in="${totalArray[4]}" var="listProducts">
        <div id="hot">

            <div class="boxBar">

                        <h2>${listProducts[0].productDetails.productSubCategory.subCategoryName} <g:link action="subCategory" controller="endUser" params="[subCategory:listProducts[0].productDetails.productSubCategory.urlName]"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
            </div>

            <div class="container">
                <div class="product-slider">
                    <g:each in="${listProducts}" var="list">

                        <div class="item">
                            <div class="product product-height">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">
                                                <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                            </g:link>
                                        </div>
                                        <div class="back">
                                            <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">

                                                <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible food1">
                                    <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">


                                </g:link>
                                <div class="text">
                                    %{--<h3><g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>--}%
                                    <div class="productDescription">${list.productDetails.briefDescription}</div>
                                    <g:if test="${list.productDetails.isSale==true}">
                                        <p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 135px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />
                                            <del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>
                                        <div class="discountBox">-${list.productDetails.discountPercentage}%</div>
                                    </g:if>
                                    <g:if test="${list.productDetails.isSale==false}">

                                        <p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>
                                    </g:if>
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


    </g:each>


</div>    <!-- /.container -->
</body>
</html>
