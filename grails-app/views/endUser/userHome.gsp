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
    <div class="container-fluid">
<div class="coverHome">
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
    <g:if test="${Aids.list()[0]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[0].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[0].imageName])}" class="img-responsive ad-image lazy">
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive ad-image" />
    </g:else>

    %{--</div>--}%
    %{--<div class="container">--}%
    %{--<div class="col-md-12">--}%


    <g:if test="${totalArray[2]}">
        <div id="wrapperHotProduct">
            <div class="boxBar">
                <h2>Latest Arrivals <g:link action="latestProducts" controller="endUser"><i class="fa fa-angle-double-right green-tooltip" data-toggle="tooltip" title="see more"></i></g:link></h2>
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

        </div>





    </g:if>
    <div class="container-fluid">

        <g:if test="${Aids.list()[1]}">
        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[1].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[1].imageName])}" class="img-responsive ad-image adimage1 lazy" >
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive adimage1 ad-image" style="margin-top: -45px;"/>
    </g:else>
</div>
    <g:each in="${totalArray[4]}" var="listProducts" status="i">
        <g:if test="${i<2}">
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
        </g:if>

    </g:each>
    <g:if test="${Aids.list()[2]}">

        <g:link action="ad" controller="endUser" params="[aidsDescribe:Aids.list()[2].adDescribe]">
            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:Aids.list()[2].imageName])}" class="img-responsive ad-image adimage1 lazy" >
        </g:link>
    </g:if>
    <g:else>
        <img src="https://dummyimage.com/1400x100/000/fff" class="img img-responsive adimage1 ad-image" style="margin-top: -45px;"/>
    </g:else>
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

        </div>

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
    <div class="container info">
        <h4>Erke,A Brand</h4>
        <p>
            Erke sport shoes, appeal and accessories Established in 2000 by the China Hongxing ERKE Group, ERKE is a clothing brand that specializes in the manufacturing, research and development, and retail of sports shoes, apparel and accessories. Within ten years, the ERKE Group has successfully developed the brand into one of the most renowned lifestyle brands. To date, the brand has received some of the most prestigious recognition such as Asia Top Brand, “ Asia’s best 200 under one billion” and the Certificate of “Eco-labeling”.
        </p>

    </div>

    <br>

</div>
</div>
</div>
</body>
</html>