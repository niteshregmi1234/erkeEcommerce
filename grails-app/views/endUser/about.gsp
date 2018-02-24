<%-- Created by IntelliJ IDEA. User: hemanta Date: 7/16/17 Time: 7:15 PM --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userYarsaa">
</head>
<body>
<div id="content">
    <div class="container">
            <div class="col-md-12">
                <div id="main-slider">
                    <div class="item coverUp">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.coverImage])}" class="img-responsive">
                    </div>
                </div>
                <!-- /#main-slider -->
            </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li>
                        <g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li>About</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 ">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="imgwrapper smallAbout">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs1Image])}" class="img-responsive">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="imgwrapper smallAbout">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs2Image])}" class="img-responsive">
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="imgwrapper smallAbout">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs3Image])}" class="img-responsive">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="imgwrapper smallAbout">
                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.aboutUs4Image])}" class="img-responsive">
                        </div>
                    </div>
                </div>
                <!-- /#blog-homepage -->
            </div>

            <div class="col-md-6">
                <div class="box">
                    <h1>ABOUT US</h1>
                    <p>${aboutUsInstance.aboutUsDescription}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-5">
                    <div class="imgwrapper quote">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.quoteLeftImage])}" class="img-responsive about-img">
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="box">
                        <h3>"${aboutUsInstance.quote}"</h3>
                        <h4>― ${CompanyInformation.list()[0].proprietorName}</h4>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="imgwrapper quote">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.quoteRightImage])}" class="img-responsive about-img">
                    </div>
                </div>
            </div>
            <!-- /#blog-homepage -->
        </div>
    </div>
    <div class="container">
        <div class="col-md-12">
            &nbsp;
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-6">
                    <div class="box">
                        <h2>COMMERCIAL VIDEO</h2>
                        <p class="box-text">${aboutUsInstance.videoDescription}.</p>
                        <p class="box-text">Watch our commercial videos</p>
                        <p class="read-more"><a href="#small-dialog4" class="popup-with-zoom-anim btn btn-primary">WATCH NOW</a>
                        </p>
                    </div>
                </div>
                <div id="small-dialog4" class="mfp-hide agileinfo">
                    <div class="pop_up">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/${aboutUsInstance.videoName}" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.videoDescrptionImage])}" class="img-responsive" width="645" height="431">
                    </div>
                </div>
            </div>
            <!-- /#blog-homepage -->
        </div>

        <div class="row">
            <div class="col-md-12">
                &nbsp;
            </div>
        </div>
        %{--<div class="row">--}%
            %{--<div class="col-md-12">--}%
                %{--<div class="row products" id="myList">--}%
                    %{--<g:if test="${aboutUsInstance.specialProduct1.productDetails.isSale==false}">--}%
                        %{--<div class="col-md-6 col-sm-6 a">--}%
                            %{--<div class="product about-product">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.frontImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                        %{--<div class="back product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.backImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}" class="invisible product">--}%
                                    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.frontImageName])}" class="img-responsive product-img">--}%
                                %{--</g:link>--}%
                                %{--<div class="text">--}%
                                    %{--<h3 class="nameProduct">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">${aboutUsInstance.specialProduct1.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct1.productDetails.productName}</g:link>--}%
                                    %{--</h3>--}%
                                    %{--<p class="price"> Rs.<g:formatNumber number="${aboutUsInstance.specialProduct1.productDetails.price-(aboutUsInstance.specialProduct1.productDetails.discountPercentage*aboutUsInstance.specialProduct1.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>--}%

                                        %{--<del class="del-price" style="visibility: hidden;">Rs.${aboutUsInstance.specialProduct1.productDetails.price}</del></p>--}%

                                    %{--<p class="buttons">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}" class="btn btn-default">View detail</g:link>--}%
                                        %{--<a href="#" data-toggle="modal" data-target="#smallModal0"  class="btn btn-primary" onclick="addValueToField(${aboutUsInstance.specialProduct1.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%

                                    %{--</p>--}%
                                %{--</div>--}%
                                %{--<!-- /.text -->--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%
                    %{--</g:if>--}%
                    %{--<g:if test="${aboutUsInstance.specialProduct1.productDetails.isSale==true}">--}%
                        %{--<div class="col-md-6 col-sm-6">--}%
                            %{--<div class="product about-product">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.frontImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                        %{--<div class="back product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.backImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}" class="invisible product">--}%
                                    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct1.frontImageName])}" class="img-responsive product-img">--}%
                                %{--</g:link>--}%
                                %{--<div class="text">--}%
                                    %{--<h3 class="nameProduct">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}">${aboutUsInstance.specialProduct1.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct1.productDetails.productName}</g:link>--}%
                                    %{--</h3>--}%
                                    %{--<p class="price"> Rs.<g:formatNumber number="${aboutUsInstance.specialProduct1.productDetails.price-(aboutUsInstance.specialProduct1.productDetails.discountPercentage*aboutUsInstance.specialProduct1.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>--}%

                                    %{--<del class="del-price">Rs.${aboutUsInstance.specialProduct1.productDetails.price}</del></p>--}%
                                    %{--<p class="buttons">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.productId}" class="btn btn-default">View detail</g:link>--}%
                                        %{--<a href="#" data-toggle="modal" data-target="#smallModal0"  class="btn btn-primary" onclick="addValueToField(${aboutUsInstance.specialProduct1.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%

                                    %{--</p>--}%
                                %{--</div>--}%
                                %{--<!-- /.text -->--}%
                                %{--<div class="ribbon sale">--}%
                                    %{--<div class="theribbon">SALE</div>--}%
                                    %{--<div class="ribbon-background"></div>--}%
                                %{--</div>--}%
                                %{--<!-- /.ribbon -->--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%
                    %{--</g:if>--}%
                    %{--<g:if test="${aboutUsInstance.specialProduct2.productDetails.isSale==false}">--}%
                        %{--<div class="col-md-6 col-sm-6 a">--}%
                            %{--<div class="product about-product">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.frontImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                        %{--<div class="back product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.backImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}" class="invisible product">--}%
                                    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.frontImageName])}" class="img-responsive product-img">--}%
                                %{--</g:link>--}%
                                %{--<div class="text">--}%
                                    %{--<h3 class="nameProduct">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">${aboutUsInstance.specialProduct2.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct2.productDetails.productName}</g:link>--}%
                                    %{--</h3>--}%
                                    %{--<p class="price"> Rs.<g:formatNumber number="${aboutUsInstance.specialProduct2.productDetails.price-(aboutUsInstance.specialProduct1.productDetails.discountPercentage*aboutUsInstance.specialProduct2.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>--}%

                                        %{--<del class="del-price" style="visibility: hidden;">Rs.${aboutUsInstance.specialProduct2.productDetails.price}</del></p>--}%

                                    %{--<p class="buttons">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}" class="btn btn-default">View detail</g:link>--}%
                                        %{--<a href="#" data-toggle="modal" data-target="#smallModal1"  class="btn btn-primary" onclick="addValueToField(${aboutUsInstance.specialProduct2.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%

                                    %{--</p>--}%
                                %{--</div>--}%

                                %{--<!-- /.text -->--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%
                    %{--</g:if>--}%
                %{--<!-- /.col-md-4 -->--}%
                    %{--<g:if test="${aboutUsInstance.specialProduct2.productDetails.isSale==true}">--}%
                        %{--<div class="col-md-6 col-sm-6 a">--}%
                            %{--<div class="product about-product">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.frontImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                        %{--<div class="back product">--}%
                                            %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">--}%
                                                %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.backImageName])}" class="img-responsive product-img">--}%
                                            %{--</g:link>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}" class="invisible product">--}%
                                    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProduct2.frontImageName])}" class="img-responsive product-img">--}%
                                %{--</g:link>--}%
                                %{--<div class="text">--}%
                                    %{--<h3 class="nameProduct">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}">${aboutUsInstance.specialProduct2.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct2.productDetails.productName}</g:link>--}%
                                    %{--</h3>--}%
                                    %{--<p class="price"> Rs.<g:formatNumber number="${aboutUsInstance.specialProduct2.productDetails.price-(aboutUsInstance.specialProduct1.productDetails.discountPercentage*aboutUsInstance.specialProduct2.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>--}%

                                        %{--<del class="del-price">Rs.${aboutUsInstance.specialProduct2.productDetails.price}</del></p>--}%

                                    %{--<p class="buttons">--}%
                                        %{--<g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.productId}" class="btn btn-default">View detail</g:link>--}%
                                        %{--<a href="#" data-toggle="modal" data-target="#smallModal1"  class="btn btn-primary" onclick="addValueToField(${aboutUsInstance.specialProduct2.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%

                                    %{--</p>--}%
                                %{--</div>--}%
                                %{--<div class="ribbon sale">--}%
                                    %{--<div class="theribbon">SALE</div>--}%
                                    %{--<div class="ribbon-background"></div>--}%
                                %{--</div>--}%

                                %{--<!-- /.text -->--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%
                    %{--</g:if>--}%

                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="imgwrapper height-img">
                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.specialProductSubCategoryImage])}" class="img-responsive img-texts">
                    <div class="w3lsshoesaits-info">
                        <h3>${aboutUsInstance.specialProductSubCategory.subCategoryName} TO DIE FOR</h3>
                        <p>${aboutUsInstance.specialProductSubCategory.subCategoryDescription}</p>
                        <div class="wthreeshop-a a-buttonsize">
                            <g:link action="specialSubCategory" controller="endUser">SHOP ${aboutUsInstance.specialProductSubCategory.subCategoryName}</g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="agilenwew3lsfashions about-background" style="background-image:url('${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:aboutUsInstance.backgroundImage])}')">
                </div>
            </div>
        </div>
    </div>
</div>
<g:hiddenField name="productId" id="productId" value=""></g:hiddenField>
<g:each in="${productSizeList}" var="list" status="i">
    <div class="modal fade" id="smallModal${i}" tabindex="-1" role="dialog" aria-labelledby="smallModal" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel${i}">Select Size</h4>
                </div>
                <div class="modal-body">
                    <g:select class="form-control" name="size" id="size${i}"
                              from="${list}" optionKey="id" optionValue="sizeName"
                              title="select size"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                    <div class="btn btn-primary" onclick="checkAddToCart(${i});"><i class="fa fa-shopping-cart"></i>Add to cart</div>
                </div>
            </div>
        </div>
    </div>
</g:each>

<script>
    $(document).ready(function() {
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
<script src="${resource(dir: 'js', file: 'yarsaa/jquery.magnific-popup.js')}" type="text/javascript" charset="utf-8"></script>
<script>
    function addValueToField(id){
        document.getElementById("productId").value = id;

    }
</script>

<script>
    function checkAddToCart(i){
        $('#smallModal'+i).modal('toggle');
        var productId=document.getElementById("productId").value;
        var sizeId=document.getElementById("size"+i).value;
        var array = [];
        array[0]=sizeId;
        array[1]=productId;
        var responseValue;
        $.ajax({
            url: "${createLink(controller:'cart', action:'checkAddToCart')}",
            type: "POST",
            data: { "array": JSON.stringify(array) },
            async : false,
            cache:false,
            success: function(result) {
                if(result=="ok"){
                    bootbox.alert({
                        message: "successfully added to cart.",
                        size: 'small',
                        callback: function(){
                            $('#cartShow').load(document.URL +  ' #cartShow');

                        }

                    });
                    responseValue=false;

                }
                else if(result=="notOk"){
                    $('#login-modal').modal('toggle');
                    document.getElementById("sizeIdLogin").value = sizeId;
                    document.getElementById("productIdLogin").value = productId;

                }
            }
        });
        return responseValue;

    }
</script>

</body>
</html>