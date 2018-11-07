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
</head>

<body>

<div id="content">
<div class="container-fluid coverHome">
    %{--<div class="container coverImage" style="width: 1346px;">--}%
    %{--<div class="col-lg-12">--}%
    <div id="main-slider">
        <g:each in="${totalArray[0]}" var="list">

            <div class="item">
                <g:link action="topBrand" controller="endUser" params="[brandNames:list.productBrand.urlName]"> <img src="${resource(dir: 'images', file: 'spinner-cover-1500_500.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.imageName])}" class="img-responsive lazy" style="width:100%;"></g:link>

            </div>


        </g:each>
    %{--</div>--}%
    <!-- /#main-slider -->
    </div>

    %{--</div>--}%
    %{--<div class="container">--}%
    %{--<div class="col-md-12">--}%
    <g:if test="${Aids.list()[9]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[9].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[9].imageName])}" class="img-responsive ad-image lazy">
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive ad-image" />
    </g:else>

    <div id="wrapperTopBrand">
        <div class="box topBrandDiv">

            <div class="social">
                <h2 style="color: #09175E; margin-left: 8px;">Top Brands <g:link action="allBrands" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
                <% int j=0
                k=0%>
                <g:each in="${totalArray[1]}" var="list" status="i">
                    <g:if test="${Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductBrand(list),false)}">
                        <% if(j<12) {%>
                        <div class="col-md-2 col-sm-2 col-xs-2" style="margin-bottom: 10px;">
                            <g:link action="topBrand" controller="endUser" params="[brandNames:list.urlName]">

                                <img src="${resource(dir: 'images', file: 'spinner-brand-logo.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.logoName])}" class="img-responsive lazy">
                            </g:link>
                        </div>

                        <%}%>
                        <% j=j+1%>

                    </g:if>
                </g:each>



            </div>
        </h4>
        </div>
        <g:if test="${Aids.list()[0]}">
            <div class="topBrandDivSide ">
                <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[0].adDescribe]">
                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[0].imageName])}" class="img-responsive lazy">
                </g:link>
            </div>
        </g:if>
    </div>
    <g:if test="${Aids.list()[10]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[10].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[10].imageName])}" class="img-responsive ad-image adImageF lazy">
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive ad-image adImageF" />
    </g:else>
    <g:if test="${totalArray[2]}">
        <div id="wrapperHotProduct">
            <div class="boxBar">
                <h2>Hot this week <g:link action="latestProducts" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
            </div>
            <div id="hot" class="hot">


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


                        </div>
                    </g:each>

                </div>
            </div>
            <g:if test="${Aids.list()[1]}">

                <div class="hotProductSide">
                    <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[1].adDescribe]">

                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[1].imageName])}" class="img-responsive lazy">
                    </g:link>

                </div>
            </g:if>
        </div>





    </g:if>
    <g:each in="${totalArray[4]}" var="listProducts" status="i">
        <g:if test="${i<2}">
            <div class="subBoxBar">
        <div id="wrapperHotProduct">

            <div class="boxBar">

                <h2>${listProducts[0].productDetails.productSubCategory.subCategoryName} <g:link action="subCategory" controller="endUser" params="[subCategory:listProducts[0].productDetails.productSubCategory.urlName]"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
            </div>
            <div id="hot">


                <div class="product-slider1 product-slider productHot">
                    <g:each in="${listProducts}" var="list">
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


                        </div>
                    </g:each>

                </div>
            </div>

            %{--<div class="container">--}%
                %{--<div class="product-slider">--}%
                    %{--<g:each in="${listProducts}" var="list">--}%

                        %{--<div class="item">--}%
                            %{--<div class="product product-height">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">--}%
                                                %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%

                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                        %{--<div class="back">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">--}%

                                                %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%

                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible food1">--}%
                                    %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%


                                %{--</g:link>--}%
                                %{--<div class="text">--}%
                                    %{--<h3><g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>--}%
                                    %{--<div class="productDescription">${list.productDetails.briefDescription}</div>--}%
                                    %{--<g:if test="${list.productDetails.isSale==true}">--}%
                                        %{--<p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 135px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />--}%
                                            %{--<del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>--}%
                                        %{--<div class="discountBox">-${list.productDetails.discountPercentage}%</div>--}%
                                    %{--</g:if>--}%
                                    %{--<g:if test="${list.productDetails.isSale==false}">--}%

                                        %{--<p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>--}%
                                    %{--</g:if>--}%
                                %{--</div>--}%


                            %{--</div>--}%
                        %{--</div>--}%

                    %{--</g:each>--}%
                %{--</div>--}%

            %{--</div>--}%


        </div>
            </div>
        </g:if>

    </g:each>
    <g:if test="${Aids.list()[11]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[11].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[11].imageName])}" class="img-responsive ad-image adimage1 lazy" >
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive adimage1 ad-image" style="margin-top: -45px;"/>
    </g:else>
    <g:if test="${totalArray[3]}">
        <div class="wrapperSalesProduct">

            <div class="boxBar">
                <h2>Top Sales <g:link action="topSales" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>

            </div>

            <div id="hot" class="sales">



                <div class="product-slider2 product-slider productHot">
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


                            </div>
                        </div>

                    </g:each>
                </div>



            </div>
            <g:if test="${Aids.list()[2]}">

                <div class="salesProductSide">
                    <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[2].adDescribe]">

                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[2].imageName])}" class="img-responsive lazy">
                    </g:link>
                </div>
            </g:if>
        </div>

    </g:if>
    <g:each in="${totalArray[4]}" var="listProducts" status="i">
        <g:if test="${i>=2 && i<4}">
            <div class="subBoxBar">

            <div id="wrapperHotProduct">

                <div class="boxBar">

                    <h2>${listProducts[0].productDetails.productSubCategory.subCategoryName} <g:link action="subCategory" controller="endUser" params="[subCategory:listProducts[0].productDetails.productSubCategory.urlName]"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
                </div>
                <div id="hot">


                    <div class="product-slider1 product-slider productHot">
                        <g:each in="${listProducts}" var="list">
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


                            </div>
                        </g:each>

                    </div>
                </div>

                %{--<div class="container">--}%
                %{--<div class="product-slider">--}%
                %{--<g:each in="${listProducts}" var="list">--}%

                %{--<div class="item">--}%
                %{--<div class="product product-height">--}%
                %{--<div class="flip-container">--}%
                %{--<div class="flipper">--}%
                %{--<div class="front">--}%
                %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">--}%
                %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%

                %{--</g:link>--}%
                %{--</div>--}%
                %{--<div class="back">--}%
                %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">--}%

                %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%

                %{--</g:link>--}%
                %{--</div>--}%
                %{--</div>--}%
                %{--</div>--}%
                %{--<g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible food1">--}%
                %{--<img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">--}%


                %{--</g:link>--}%
                %{--<div class="text">--}%
                %{--<h3><g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>--}%
                %{--<div class="productDescription">${list.productDetails.briefDescription}</div>--}%
                %{--<g:if test="${list.productDetails.isSale==true}">--}%
                %{--<p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 135px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />--}%
                %{--<del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>--}%
                %{--<div class="discountBox">-${list.productDetails.discountPercentage}%</div>--}%
                %{--</g:if>--}%
                %{--<g:if test="${list.productDetails.isSale==false}">--}%

                %{--<p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>--}%
                %{--</g:if>--}%
                %{--</div>--}%


                %{--</div>--}%
                %{--</div>--}%

                %{--</g:each>--}%
                %{--</div>--}%

                %{--</div>--}%


            </div>
            </div>
        </g:if>

    </g:each>

    <div class="row aid">
        <div class="col-md-6 col-xs-12 col-sm-12">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <g:if test="${Aids.list()[3]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[3].adDescribe]">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[3].imageName])}" class="img-responsive lazy smallBoxAd">
                        </g:link>
                    </g:if>

                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">

                    <g:if test="${Aids.list()[4]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[4].adDescribe]">

                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[4].imageName])}" class="img-responsive lazy smallBoxAd">
                        </g:link>
                    </g:if>
                </div>
            </div><br>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">

                    <g:if test="${Aids.list()[5]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[5].adDescribe]">

                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[5].imageName])}" class="img-responsive lazy smallBoxAd">
                        </g:link>
                    </g:if>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">

                    <g:if test="${Aids.list()[6]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[6].adDescribe]">

                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[6].imageName])}" class="img-responsive lazy smallBoxAd">
                        </g:link>
                    </g:if>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12 col-sm-12" id="lastAd">
            <div class="row">
                <div class="col-md-12 ">
                    <g:if test="${Aids.list()[7]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[7].adDescribe]">

                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[7].imageName])}" class="img-responsive lazy">
                        </g:link>
                    </g:if>
                </div>
            </div><br>
            <div class="row">

                <div class="col-md-12 ">
                    <g:if test="${Aids.list()[8]}">
                        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[8].adDescribe]">

                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[8].imageName])}" class="img-responsive lazy">
                        </g:link>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
    <g:if test="${Aids.list()[12]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[12].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[12].imageName])}" class="img-responsive ad-image lazy">
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive ad-image" />
    </g:else>

    <div class="container info">
        <h4>Yarsaa - “The Quality and Genuineness is still alive”</h4>
        <p>
            The concept of Online shopping is ever growing in Nepal in past couple of years. We clearly can see the
            customers nowadays shifting towards Online shopping as it brings them comfort. The increment of customers
            towards online has now given platform for many innovator and designers come up with unique ideas and convert
            them into unique services. Similarly, this is how we evolved. “Yarsaa” is the only place where you will find
            genuine, quality and original brand. As our primary product is “Shoes”, our website won’t let you down.
            We have shoes available in various varieties and forms. From teenagers to adult to aged, categories from
            casual to party wears to formal wears and many more, you will find anything you are looking for. Our secondary
            products include Clothing, Apparels, Electronics, and Accessories etc. Our theme clearly symbolizes what our
            motive is. “We believe in quality”, “We believe in genuineness”, we only deal on original brands because we
            believe customers need to understand and realize what does quality means.
        </p>
        <h4>What makes Yarsaa unique?</h4>
        <p>
            We want customers to know the importance of representing themselves through the view of brand wears.  “Yarsaa”
            is now one very e-store striving to grow customers and sellers base with every passing day. “Yarsaa” provides
            a unique digital market platform where sellers and buyers can interact and a one stop shop for buying and
            selling as we are associated with various brands in Nepal. This is what makes Yarsaa one of the unique e-store
            from other online shopping sites in Nepal and provides the best online shopping experience to its customers.
            Because “we believe in quality”, “We believe in genuineness”.
        </p>
    </div>

    <br>

</div>
</div>
</body>
</html>