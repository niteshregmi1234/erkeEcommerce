<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/16/17
  Time: 7:15 PM
--%>

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
                    <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.coverImage}")}" alt="" class="img-responsive">
                </div>
            </div>
            <!-- /#main-slider -->
        </div>
    </div>
    <style>
    .coverUp img{
        height:520px;
        width: 1108px;
    }
    </style>

    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>About</li>
            </ul>
        </div>
        <div class="col-md-6 " data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">


                    </div>

                </div>


            </div>
            <!-- /#blog-homepage -->
        </div>
        <div class="col-md-6 small-screen screen1" data-animate="fadeInUp">
            <div class="box same-height clickable">

                <h1>ABOUT US</h1>
                <p>${aboutUsInstance.aboutUsDescription}</p>
            </div>


        </div>
    </div>
    <div class="container">
        <div class="col-md-12">
            &nbsp;
        </div>

        <div class="col-md-12" data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-5 quote1">
                    <div class="imgwrapper quote">
                        <img class="img-responsive about-img" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteLeftImage}")}">


                    </div>

                </div>

                <div class="col-sm-2 small-screen">
                    <div class="box height-same clickable small-screen">

                        <h3>"${aboutUsInstance.quote}"</h3>
                        <h4>― ${CompanyInformation.list()[0].proprietorName}</h4>

                    </div>

                </div>
                <div class="col-sm-5">
                    <div class="imgwrapper quote">
                        <img class="img-responsive about-img" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteRightImage}")}">


                    </div>

                </div>

            </div>
            <!-- /#blog-homepage -->
        </div>
        <div class="col-md-12">
            &nbsp;
        </div>

        <div class="col-md-12" data-animate="fadeInUp">

            <div class="row">
                <div class="col-sm-6">
                    <div class="box ">
                        <h2>SHOPPING VIDEO</h2>
                        <p class="box-text">${aboutUsInstance.videoDescription} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo varius vehicula. Mauris porta metus vitae nulla dignissim egestas. Aliquam sed molestie eros, in pharetra purus. Praesent consequat porta viverra. Praesent gravida dapibus condimentum. Vestibulum vel lacus aliquet, laoreet mi eu, tempor est. Quisque volutpat finibus tristique. Duis at nibh eget nulla pretium pretium. Quisque arcu sem, dignissim eu egestas quis, vulputate non mauris.</p>
                        <p class="box-text">Check out our latest commercial commercial commercial commercialcommercial commercial commercial commercial commercial commercial commercial commercial commercial commercial commercial, teaser and behind the scenes film.</p>
                        <p class="read-more"><a href="#small-dialog4" class="popup-with-zoom-anim btn btn-primary">WATCH NOW</a></p>

                    </div>
                </div>
                <div id="small-dialog4" class="mfp-hide agileinfo">
                    <div class="pop_up">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/${aboutUsInstance.videoName}" frameborder="0" allowfullscreen></iframe>

                    </div>
                </div>




                <div class="col-sm-6">
                    <div class="imgwrapper">
                        <img class="img-responsive" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.videoDescrptionImage}")}" width="645" height="431">


                    </div>

                </div>

            </div>
            <!-- /#blog-homepage -->
        </div>

        <div class="col-md-12">
            &nbsp;
        </div>
        <div class="col-md-12" data-animate="fadeInUp">

            <div class="row products" id="myList">
                <g:if test="${aboutUsInstance.specialProduct1.productDetails==false}">
                    <div class="col-md-6 col-sm-6 a">
                        <div class="product">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                    <div class="back product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}" class="invisible product">
                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive">

                            </g:link>
                            <div class="text">
                                <h3><g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">${aboutUsInstance.specialProduct1.productDetails.productName+" "+aboutUsInstance.specialProduct1.productColor+" "+aboutUsInstance.specialProduct1.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct1.productDetails.productName}</g:link></h3>
                                <p class="price">Rs.${aboutUsInstance.specialProduct1.productDetails.price}</p>
                                <p class="buttons">
                                    <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}" class="btn btn-default">View detail</g:link>
                                    <a href="#" onclick="checkAddToCart(${aboutUsInstance.specialProduct1.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                </p>
                            </div>
                            <!-- /.text -->
                        </div>
                        <!-- /.product -->
                    </div>

                </g:if>
                <g:if test="${aboutUsInstance.specialProduct1.productDetails.isSale==true}">

                    <div class="col-md-6 col-sm-6">
                        <div class="product">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                    <div class="back product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">

                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}" class="invisible product">
                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}" alt="" class="img-responsive">

                            </g:link>
                            <div class="text">
                                <h3><g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}">${aboutUsInstance.specialProduct1.productColor.colorName+" "+aboutUsInstance.specialProduct1.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct1.productDetails.productName}</g:link></h3>
                                <p class="price"><del>Rs.${aboutUsInstance.specialProduct1.productDetails.price}</del> Rs.${aboutUsInstance.specialProduct1.productDetails.price-(aboutUsInstance.specialProduct1.productDetails.discountPercentage*aboutUsInstance.specialProduct1.productDetails.price/100)}</p>
                                <p class="buttons">
                                    <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct1.id}" class="btn btn-default">View detail</g:link>
                                    <a href="#" onclick="checkAddToCart(${aboutUsInstance.specialProduct1.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                </p>
                            </div>

                            <!-- /.text -->

                            <div class="ribbon sale">
                                <div class="theribbon">SALE</div>
                                <div class="ribbon-background"></div>
                            </div>
                            <!-- /.ribbon -->

                            %{--<div class="ribbon new">--}%
                            %{--<div class="theribbon">NEW</div>--}%
                            %{--<div class="ribbon-background"></div>--}%
                            %{--</div>--}%
                            %{--<!-- /.ribbon -->--}%

                            %{--<div class="ribbon gift">--}%
                            %{--<div class="theribbon">GIFT</div>--}%
                            %{--<div class="ribbon-background"></div>--}%
                            %{--</div>--}%
                            %{--<!-- /.ribbon -->--}%
                        </div>
                        <!-- /.product -->
                    </div>
                </g:if>
                <g:if test="${aboutUsInstance.specialProduct2.productDetails==false}">
                    <div class="col-md-6 col-sm-6 a">
                        <div class="product">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                    <div class="back product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}" class="invisible product">
                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive">

                            </g:link>
                            <div class="text">
                                <h3><g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">${aboutUsInstance.specialProduct1.productDetails.productName+" "+aboutUsInstance.specialProduct1.productColor+" "+aboutUsInstance.specialProduct1.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct1.productDetails.productName}</g:link></h3>
                                <p class="price">Rs.${aboutUsInstance.specialProduct2.productDetails.price}</p>
                                <p class="buttons">
                                    <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}" class="btn btn-default">View detail</g:link>
                                    <a href="#" onclick="checkAddToCart(${aboutUsInstance.specialProduct2.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                </p>
                            </div>
                            <!-- /.text -->
                        </div>
                        <!-- /.product -->
                    </div>

                </g:if>
                <g:if test="${aboutUsInstance.specialProduct2.productDetails.isSale==true}">

                    <div class="col-md-6 col-sm-6 a">
                        <div class="product">
                            <div class="flip-container flip-height">
                                <div class="flipper">
                                    <div class="front product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">
                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                    <div class="back product">
                                        <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">

                                            <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive product-img">

                                        </g:link>
                                    </div>
                                </div>
                            </div>
                            <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}" class="invisible product">
                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}" alt="" class="img-responsive">

                            </g:link>
                            <div class="text">
                                <h3><g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}">${aboutUsInstance.specialProduct2.productColor.colorName+" "+aboutUsInstance.specialProduct2.productDetails.productBrand.brandName+" "+aboutUsInstance.specialProduct2.productDetails.productName}</g:link></h3>
                                <p class="price"><del>Rs.${aboutUsInstance.specialProduct2.productDetails.price}</del> Rs.${aboutUsInstance.specialProduct2.productDetails.price-(aboutUsInstance.specialProduct2.productDetails.discountPercentage*aboutUsInstance.specialProduct1.productDetails.price/100)}</p>
                                <p class="buttons">
                                    <g:link action="singleProduct" controller="endUser" id="${aboutUsInstance.specialProduct2.id}" class="btn btn-default">View detail</g:link>
                                    <a href="#" onclick="checkAddToCart(${aboutUsInstance.specialProduct2.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                </p>
                            </div>

                            <!-- /.text -->

                            <div class="ribbon sale">
                                <div class="theribbon">SALE</div>
                                <div class="ribbon-background"></div>
                            </div>
                            <!-- /.ribbon -->

                            %{--<div class="ribbon new">--}%
                            %{--<div class="theribbon">NEW</div>--}%
                            %{--<div class="ribbon-background"></div>--}%
                            %{--</div>--}%
                            %{--<!-- /.ribbon -->--}%

                            %{--<div class="ribbon gift">--}%
                            %{--<div class="theribbon">GIFT</div>--}%
                            %{--<div class="ribbon-background"></div>--}%
                            %{--</div>--}%
                            %{--<!-- /.ribbon -->--}%
                        </div>
                        <!-- /.product -->
                    </div>
                </g:if>

            <!-- /.col-md-4 -->
            </div>
        </div>
        <div class="col-md-12" data-animate="fadeInUp">
            <div class="imgwrapper">
                <img class="img-responsive text-img" src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.specialProductSubCategoryImage}")}">
                <div class="container">
                    <div class="middle">
                    <h1 class="about-text1">BRACE YOURSELVES! WINTER IS COMING...</h1>
                    <p class="about-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    <div class="wthreeshop-a">
                        <a href="womens.html">SHOP WINTER COLLECTION</a>
                    </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <div class="container">
        <div class="col-md-12 " >

            <div class="agilenwew3lsfashions about-background">


            </div>
        </div>
    </div>

</div>

<style>
.agilenwew3lsfashions {
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-attachment: fixed;
    padding: 150px 0;
    text-align: center;
    color: #FFF;
}

.quote img{
    height:600px;
    width: 525px;
}
</style>
<script>

    window.onload=function () {
        $.ajax({
            url: "${createLink(controller:'endUser', action:'fetchAboutUrl')}"
        }).done(function(fileLocation){
            $('.agilenwew3lsfashions').css('background-image', 'url(' + fileLocation + ')');



        });


    };

</script>

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
<script src="${resource(dir: 'js', file: 'yarsaa/jquery.magnific-popup.js')}" type="text/javascript"
        charset="utf-8"></script>
<script>
    function checkAddToCart(id){

        var responseValue;
        $.ajax({
            url: "${createLink(controller:'cart', action:'checkAddToCart')}",
            type: "POST",
            data: {id1:id},
            async : false,
            cache:false,
            success: function(result) {
                if(result=="ok"){
                    bootbox.alert({
                        message: "successfully added to cart.",
                        size: 'small',
                        callback: function(){
                            location.reload();
                        }

                    });
                    responseValue=false;

                }
                else if(result=="notOk"){
                    $('#login-modal').modal('toggle');
                }
            }
        });
        return responseValue;

    }
</script>

</body>
</html>