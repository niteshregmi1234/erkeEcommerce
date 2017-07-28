<!DOCTYPE html>
<html lang="en">

<head>
<meta name="layout" content="userYarsaa">
<title>


</title>

</head>

<body>

    <!-- *** TOPBAR ***
 _________________________________________________________ -->

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><g:link action="userHome" controller="endUser">Home</g:link>
                        </li>
                        <li><a href="#">Ladies</a>
                        </li>
                        <li><a href="#">Tops</a>
                        </li>
                        <li>${productInstance.productColor.colorName+" "+productInstance.productDetails.productBrand.brandName+" "+productInstance.productDetails.productName}</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                <g:each in="${productCategoryList}" var="categoryList">
                                    <g:if test="${categoryList.id==productInstance.productDetails.productCategory.id}">

                                        <li class="active">
                                    </g:if>
                                <g:if test="${categoryList.id!=productInstance.productDetails.productCategory.id}">

                                        <li>
                                    </g:if>
                                    <g:link action="allCategoryProducts" id="${categoryList.id}" controller="endUser">${categoryList.categoryName}<span class="badge pull-right"></span></g:link>
                                    <ul>
                                        <g:each in="${productSubCategoryList}" var="subCategoryList">
                                            <li><g:link action="subCategoryList" controller="endUser" params="[id1:categoryList.id,id2:subCategoryList.id]">${subCategoryList.subCategoryName}</g:link>

                                            </li>
                                        %{--<li><a href="category.html">Shirts</a>--}%
                                        </g:each>   %{--</li>--}%
                                    %{--<li><a href="category.html">Pants</a>--}%
                                    %{--</li>--}%
                                    %{--<li><a href="category.html">Accessories</a>--}%
                                    %{--</li>--}%
                                    </ul>
                                    </li>
                                </g:each>
                            %{--<li class="active">--}%
                            %{--<a href="category.html">Ladies  <span class="badge pull-right">123</span></a>--}%
                            %{--<ul>--}%
                            %{--<li><a href="category.html">T-shirts</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Skirts</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Pants</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Accessories</a>--}%
                            %{--</li>--}%
                            %{--</ul>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                            %{--<a href="category.html">Kids  <span class="badge pull-right">11</span></a>--}%
                            %{--<ul>--}%
                            %{--<li><a href="category.html">T-shirts</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Skirts</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Pants</a>--}%
                            %{--</li>--}%
                            %{--<li><a href="category.html">Accessories</a>--}%
                            %{--</li>--}%
                            %{--</ul>--}%
                            %{--</li>--}%

                            </ul>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Brands </h3>
                        </div>

                        <div class="panel-body">

                            <g:form action="abc" controller="endUser">
                                <div class="form-group">
                                    <g:each in="${productBrandList}" var="brandList">
                                        <div class="checkbox">
                                            <label>
                                                <g:checkBox name="brand" value="${brandList.id}"  />${brandList.brandName}
                                            </label>
                                        </div>
                                    </g:each>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </g:form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Colours</h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <g:each in="${productColourList}" var="colourList">
                                        <div class="checkbox">
                                            <label>
                                                <g:checkBox name="colour" value="${colourList.id}"/>${colourList.colorName}

                                            </label>
                                        </div>
                                    </g:each>
                                %{--<div class="checkbox">--}%
                                %{--<label>--}%
                                %{--<input type="checkbox"> <span class="colour blue"></span> Blue (10)--}%
                                %{--</label>--}%
                                %{--</div>--}%
                                %{--<div class="checkbox">--}%
                                %{--<label>--}%
                                %{--<input type="checkbox"> <span class="colour green"></span> Green (20)--}%
                                %{--</label>--}%
                                %{--</div>--}%
                                %{--<div class="checkbox">--}%
                                %{--<label>--}%
                                %{--<input type="checkbox"> <span class="colour yellow"></span> Yellow (13)--}%
                                %{--</label>--}%
                                %{--</div>--}%
                                %{--<div class="checkbox">--}%
                                %{--<label>--}%
                                %{--<input type="checkbox"> <span class="colour red"></span> Red (10)--}%
                                %{--</label>--}%
                                %{--</div>--}%
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <!-- *** MENUS AND FILTERS END *** -->

                    %{--<div class="banner">--}%
                    %{--<a href="#">--}%
                    %{--<img src="img/banner.jpg" alt="sales 2014" class="img-responsive">--}%
                    %{--</a>--}%
                    %{--</div>--}%
                </div>


                <div class="col-md-9">
                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                                        <div id="mainImage"class="mainImage-coverDown mainImage-height">
                                            <img class="img-responsive mainImage-height" id="myImg" src="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}" data-zoom-image="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}">

                                        </div>


                                                       <div class="ribbon sale">
                                <div class="theribbon">SALE</div>
                                <div class="ribbon-background"></div>
                            </div>


                            <!-- /.ribbon -->
                            <div class="ribbon new">
                                <div class="theribbon">NEW</div>
                                <div class="ribbon-background"></div>
                            </div>
                            <!-- /.ribbon -->

                        </div>
                        <div class="col-sm-6">
                            <div class="box box-height" id="detailInfo">
                                <h1 class="text-center">White Blouse Armani</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material & care and sizing</a>
                                </p>
                                <div class="price">
                                    <ul style="list-style: none;">
                                        <li>$124.00</li>
                                        <li>
                                            <small><del>$200</del></small>
                                        </li>
                                    </ul>
                                </div>

                                <g:if test="${session.endUser}">
                                <p class="text-center buttons">
                                    <g:form action="addToCart" controller="cart" class="text-center buttons" onsubmit="return ValidShopping();">
                                        <g:hiddenField name="id" value="${productInstance.id}"></g:hiddenField>
                                    <button class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                                    </g:form>
                                    %{--<a href="basket.html" class="btn btn-default"><i class="fa fa-heart"></i> Add to wishlist</a>--}%
                                </p>
</g:if>
                                <g:if test="${session.endUser==null}">
                                    <h4 class="text-center">You must login first to shop product</h4>


                                    <p class="text-center buttons">
                                    <a href="#" data-toggle="modal" data-target="#login-modal" class="btn btn-primary" >Login</a>
                                        <g:link action="register"  controller="endUserInformation" class="btn btn-primary">Register</g:link>
                                    </p>
                                </g:if>

                            </div>

                            <div class="row"  id="thumbs">
                                <div class="col-xs-4">
                                    <a href="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}" class="thumb" >

                                        <img src="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}" alt="" class="img-responsive img-thumb">

                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${resource(dir: "images/allProducts/sideImage",file: "${productInstance.sideImageName}")}" class="thumb" >
                                        <img src="${resource(dir: "images/allProducts/sideImage",file: "${productInstance.sideImageName}")}" alt="" class="img-responsive img-thumb" >


                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${resource(dir: "images/allProducts/backImage",file: "${productInstance.backImageName}")}" class="thumb" >
                                        <img src="${resource(dir: "images/allProducts/backImage",file: "${productInstance.backImageName}")}" alt="" class="img-responsive img-thumb">
</a>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="box" id="details">
                    <div class="pannel-tab">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                        Description</a>
                                        <i class="indicator glyphicon glyphicon-minus  pull-right"></i>
                                        </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                        More Colors (2)</a>
                                        <i class="indicator glyphicon glyphicon-plus  pull-right"></i>
                            </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="accordion-image">
                                    <div class="ac-img">
                                        <a href="#"><img src="images/product-11.jpg" alt="Groovy Apparel"></a>
                                    </div>
                                    <div class="ac-img">
                                        <a href="#"><img src="images/product-12.jpg" alt="Groovy Apparel"></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                        Rating & Reviews (40+)</a>
                                        <i class="indicator glyphicon glyphicon-plus pull-right"></i>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h3>"Excellent Quality & Fitting!"</h3>
                                    <h4>Mathilda, Certified Buyer.</h4>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                                    <span>5 Stars</span>
                                    <a href="#" class="next">Next Review &rarr;</a>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                        Shipping Info</a>
                                        <i class="indicator glyphicon glyphicon-plus pull-right"></i>
                                </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h3>Shipping</h3>
                                    <ul class="ship">
                                        <li class="day"><i class="fa fa-calendar" aria-hidden="true"></i> 5-10 Business Days</li>
                                        <li class="home"><i class="fa fa-truck" aria-hidden="true"></i> Free Home Delivery</li>
                                        <li class="cod"><i class="fa fa-male" aria-hidden="true"></i> Cash On Delivery Available*</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <hr>
                    <div class="social">
                        <h4>Show it to your friends</h4>
                        <p>
                            <a id="btn_shareFacebook" class="facebook customer share" title="Facebook share" data-animate-hover="pulse" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a id="btn_shareTWI" class="twitter customer share" href="" title="Twitter share" data-animate-hover="pulse" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a id="btn_shareExternalGplus" class="gplus google_plus customer share" data-animate-hover="pulse" href="" title="Google Plus Share" target="_blank"><i class="fa fa-google-plus"></i></a>
                            <a id="btn_shareLinkedIn" class="a btn btn-linkedin customer share" href="" title="linkedin Share" target="_blank" data-animate-hover="pulse"><i class="fa fa-linkedin"></i>
                            </a>
                            <a id="btn_shareInstagram" title="instagram Share" class="btn btn-instagram a" data-animate-hover="pulse" href="">
                                <i class="fa fa-instagram"></i>
                            </a>
                        </p>
                    </div>
                    </div>
                    <script>
                        $('#accordion').on('hidden.bs.collapse', function () {
//do something...
                        })

                        $('#accordion .accordion-toggle').click(function (e){
                            var chevState = $(e.target).siblings("i.indicator").toggleClass('glyphicon-minus glyphicon-plus');
                            $("i.indicator").not(chevState).removeClass("glyphicon-minus").addClass("glyphicon-plus");
                        });
                    </script>

                    <script>
    function ValidShopping(){
        var responseValue;
        $.ajax({
            url: "${createLink(controller:'cart', action:'checkUser')}",
            async : false,
            success: function(result) {
                if(result=="notOk"){
                   bootbox.alert("Sorry, your session has expired or you are not logged in. Try to login again.");
                    $('#detailInfo').load(document.URL +  ' #detailInfo');

                    responseValue=false;

                }
            }
        });
return responseValue;
    }
    (function($){


        $.fn.customerPopup = function (e, intWidth, intHeight, blnResize) {

            // Prevent default anchor event
            e.preventDefault();

            // Set values for window
            intWidth = intWidth || '500';
            intHeight = intHeight || '400';
            strResize = (blnResize ? 'yes' : 'no');

            // Set title and open popup with focus on it
            var strTitle = ((typeof this.attr('title') !== 'undefined') ? this.attr('title') : 'Social Share'),
                    strParam = 'width=' + intWidth + ',height=' + intHeight + ',resizable=' + strResize,
                    objWindow = window.open(this.attr('href'), strTitle, strParam).focus();
        }

        /* ================================================== */

        $(document).ready(function ($) {
            $('.customer.share').on("click", function(e) {
                var url=document.URL;
                document.getElementById("btn_shareTWI").href="https://twitter.com/share?url="+url;
                document.getElementById("btn_shareFacebook").href="https://www.facebook.com/sharer.php?u="+url;
                document.getElementById("btn_shareExternalGplus").href="https://plus.google.com/share?url="+url;
                document.getElementById("btn_shareLinkedIn").href="https://www.linkedin.com/shareArticle?mini=true&url="+url;

                $(this).customerPopup(e);
            });
        });

    }(jQuery));

</script>
                    <style>

                    .btn-linkedin{
                        background-color: #0976B4;

                    }
                        .a{
                            border: none;
                            line-height: 40px;
                            border-radius: 20px;
                            outline: 0;
                            overflow:hidden;
                            position: relative;
                            position: relative;
                            padding: 0;
                            margin: 10px 1px;
                            font-size: 16px;
                            font-weight: 400;
                            text-transform: uppercase;
                            letter-spacing: 0;
                            color: #FFF;
                            will-change: box-shadow, transform;
                            transition: box-shadow 0.2s cubic-bezier(0.4, 0, 1, 1), background-color 0.2s cubic-bezier(0.4, 0, 0.2, 1);
                            box-shadow: 0 2px 2px 0 rgba(153, 153, 153, 0.14), 0 3px 1px -2px rgba(153, 153, 153, 0.2), 0 1px 5px 0 rgba(153, 153, 153, 0.12);

                        }

                    </style>
                    <div class="row same-height-row">
                        <div class="col-md-3 col-sm-6">
                            <div class="box same-height">
                                <h3>You may also like these products</h3>
                            </div>
                        </div>
<g:each in="${relatedProductList}" var="list">
                        <div class="col-md-3 col-sm-6">
                            <div class="product same-height">
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
                                    <g:if test="${list.productDetails.isSale==true}">
                                        <p class="price"><del>Rs.${list.productDetails.price}</del> Rs.${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}</p>
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


                            </div>
                            <!-- /.product -->
                        </div>
</g:each>



                    </div>

                    %{--<div class="row same-height-row">--}%
                        %{--<div class="col-md-3 col-sm-6">--}%
                            %{--<div class="box same-height">--}%
                                %{--<h3>Products viewed recently</h3>--}%
                            %{--</div>--}%
                        %{--</div>--}%


                        %{--<div class="col-md-3 col-sm-6">--}%
                            %{--<div class="product same-height">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product2.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                        %{--<div class="back">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product2_2.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<a href="detail.gsp" class="invisible">--}%
                                    %{--<img src="img/product2.jpg" alt="" class="img-responsive">--}%
                                %{--</a>--}%
                                %{--<div class="text">--}%
                                    %{--<h3>Fur coat</h3>--}%
                                    %{--<p class="price">$143</p>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%

                        %{--<div class="col-md-3 col-sm-6">--}%
                            %{--<div class="product same-height">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product1.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                        %{--<div class="back">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product1_2.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<a href="detail.gsp" class="invisible">--}%
                                    %{--<img src="img/product1.jpg" alt="" class="img-responsive">--}%
                                %{--</a>--}%
                                %{--<div class="text">--}%
                                    %{--<h3>Fur coat</h3>--}%
                                    %{--<p class="price">$143</p>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%


                        %{--<div class="col-md-3 col-sm-6">--}%
                            %{--<div class="product same-height">--}%
                                %{--<div class="flip-container">--}%
                                    %{--<div class="flipper">--}%
                                        %{--<div class="front">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product3.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                        %{--<div class="back">--}%
                                            %{--<a href="detail.gsp">--}%
                                                %{--<img src="img/product3_2.jpg" alt="" class="img-responsive">--}%
                                            %{--</a>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<a href="detail.gsp" class="invisible">--}%
                                    %{--<img src="img/product3.jpg" alt="" class="img-responsive">--}%
                                %{--</a>--}%
                                %{--<div class="text">--}%
                                    %{--<h3>Fur coat</h3>--}%
                                    %{--<p class="price">$143</p>--}%

                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<!-- /.product -->--}%
                        %{--</div>--}%

                    %{--</div>--}%

                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


        <!-- *** FOOTER ***
 _________________________________________________________ -->
        <!-- /#footer -->

        <!-- *** FOOTER END *** -->




        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
        <!-- *** COPYRIGHT END *** -->



    </div>
    <!-- /#all -->
</body>

</html>