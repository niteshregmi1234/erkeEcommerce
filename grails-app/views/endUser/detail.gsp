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

                        <li><g:link action="allCategoryProducts" id="${productInstance.productDetails.productCategory.categoryId}" controller="endUser">
                    ${productInstance.productDetails.productCategory.categoryName}</g:link>
                        </li>
                        <li><g:link action="subCategoryList" controller="endUser" params="[category:productInstance.productDetails.productCategory.categoryId,subCategory:productInstance.productDetails.productSubCategory.subCategoryId]">
                        ${productInstance.productDetails.productSubCategory.subCategoryName}</g:link>
                        </li>

                        <li>${productInstance.productDetails.productName+" "+productInstance.productDetails.productBrand.brandName}</li>
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

                            <li class="active">


                                <g:link action="allCategoryProducts" id="${productInstance.productDetails.productCategory.categoryId}" controller="endUser">${productInstance.productDetails.productCategory.categoryName} <span class="badge pull-right"></span></g:link>
                                <g:each in="${ProductSubCategorySpecify.list()}" var="specifyList" status="i">

                                    <div class="dropdownA">
                                        <ul>
                                            <%
                                                def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)
                                                def productList=new ArrayList<>()
                                                for(ProductSubCategory productSubCategory: subCategoryList1){
                                                    def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,productInstance.productDetails.productCategory),false)
                                                    if(product){
                                                        productList.add(product)
                                                    }
                                                }
                                            %>
                                            <g:if test="${productList}">
                                                <li><g:link action="specifiedProducts" params="[category:productInstance.productDetails.productCategory.categoryId,subCategorySpecify:specifyList.id]" controller="endUser" class="dropbtnA"> ${specifyList.specificationName}</g:link></li>
                                            </g:if>
                                        </ul>
                                        <ul class="dropdown-contentA">
                                            <g:each in="${ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)}" var="subCategoryList">
                                                <g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(productInstance.productDetails.productCategory,subCategoryList),false)}">

                                                    <li><g:link action="subCategoryList" controller="endUser" params="[category:productInstance.productDetails.productCategory.categoryId,subCategory:subCategoryList.subCategoryId]">${subCategoryList.subCategoryName}</g:link>

                                                    </li>

                                                </g:if>
                                            </g:each>
                                        %{--<li><a href="category.html">Shirts</a>--}%
                                        %{--<li><a href="category.html">Pants</a>--}%
                                        %{--</li>--}%
                                        %{--<li><a href="category.html">Accessories</a>--}%
                                        %{--</li>--}%
                                        </ul>

                                    </div>
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

                    <style>
                    .dropbtnA {

                        cursor: pointer;
                        width:223px;
                    }

                    .dropdownA {
                        position: relative;
                        display: inline-block;
                    }

                    .dropdown-contentA {
                        display: none;
                        position: absolute;
                        background-color: #f9f9f9;
                        min-width: 223px;
                        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                        z-index: 1;
                    }

                    .dropdown-contentA a {
                        color: black;
                        padding: 12px 16px;
                        text-decoration: none;
                        display: block;
                    }

                    .dropdown-contentA a:hover {background-color: #f1f1f1;
                        color:#4fbfa8;
                        text-decoration: none;
                    }

                    .dropdownA:hover .dropdown-contentA {
                        display: block;
                    }

                    .dropdownA:hover .dropbtnA {

                    }
                    </style>

                    %{--<div class="panel panel-default sidebar-menu">--}%

                    %{--<div class="panel-heading">--}%
                    %{--<h3 class="panel-title">Brands </h3>--}%
                    %{--</div>--}%

                    %{--<div class="panel-body">--}%

                    %{--<g:form action="abc" controller="endUser">--}%
                    %{--<div class="form-group">--}%
                    %{--<g:each in="${productBrandList}" var="brandList">--}%
                    %{--<div class="checkbox">--}%
                    %{--<label>--}%
                    %{--<g:checkBox name="brand" value="${brandList.id}"  />${brandList.brandName}--}%
                    %{--</label>--}%
                    %{--</div>--}%
                    %{--</g:each>--}%
                    %{--</div>--}%

                    %{--<button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>--}%

                    %{--</g:form>--}%

                    %{--</div>--}%
                    %{--</div>--}%

                    %{--<div class="panel panel-default sidebar-menu">--}%

                    %{--<div class="panel-heading">--}%
                    %{--<h3 class="panel-title">Colours</h3>--}%
                    %{--</div>--}%

                    %{--<div class="panel-body">--}%

                    %{--<form>--}%
                    %{--<div class="form-group">--}%
                    %{--<g:each in="${productColourList}" var="colourList">--}%
                    %{--<div class="checkbox">--}%
                    %{--<label>--}%
                    %{--<g:checkBox name="colour" value="${colourList.id}"/>${colourList.colorName}--}%

                    %{--</label>--}%
                    %{--</div>--}%
                    %{--</g:each>--}%
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
                    %{--</div>--}%

                    %{--<button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>--}%

                    %{--</form>--}%

                    %{--</div>--}%
                    %{--</div>--}%

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
                                        <div id="mainImage" class="mainImage-coverDown mainImage-height">
                                            <img id="myImg" src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.frontImageName])}" class="img-responsive mainImage-height">

                                        </div>
                            <div id="myModal1" class="modal1">

                                <!-- The Close Button -->
                                <span class="close1" id="closes">&times;</span>

                                <!-- Modal Content (The Image) -->
                                <img class="modal-content1" id="img01">

                                <!-- Modal Caption (Image Text) -->
                                %{--<div id="caption"></div>--}%
                            </div>
                            <style>
                            #myImg {
                                border-radius: 5px;
                                cursor: pointer;
                                transition: 0.3s;
                            }

                            #myImg:hover {opacity: 0.7;}

                            /* The Modal (background) */
                            .modal1 {
                                display: none; /* Hidden by default */
                                position: fixed; /* Stay in place */
                                z-index: 1; /* Sit on top */
                                padding-top: 100px; /* Location of the box */
                                left: 0;
                                top: 0;
                                width: 100%; /* Full width */
                                height: 100%; /* Full height */
                                overflow: auto; /* Enable scroll if needed */
                                background-color: rgb(0,0,0); /* Fallback color */
                                background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
                            }

                            /* Modal Content (Image) */
                            .modal-content1 {
                                margin: auto;
                                display: block;
                                width: 80%;
                                max-width: 700px;
                            }

                            /* Caption of Modal Image (Image Text) - Same Width as the Image */
                            /*#caption {*/
                                /*margin: auto;*/
                                /*display: block;*/
                                /*width: 80%;*/
                                /*max-width: 700px;*/
                                /*text-align: center;*/
                                /*color: #ccc;*/
                                /*padding: 10px 0;*/
                                /*height: 150px;*/
                            /*}*/

                            /* Add Animation - Zoom in the Modal */
                            /*.modal-content, #caption {*/
                                /*animation-name: zoom;*/
                                /*animation-duration: 0.6s;*/
                            /*}*/

                            @keyframes zoom {
                                from {transform:scale(0)}
                                to {transform:scale(1)}
                            }

                            /* The Close Button */
                            .close1 {
                                position: absolute;
                                top: 15px;
                                right: 35px;
                                color: #f1f1f1;
                                font-size: 40px;
                                font-weight: bold;
                                transition: 0.3s;
                            }

                            .close1:hover,
                            .close1:focus {
                                color: #bbb;
                                text-decoration: none;
                                cursor: pointer;
                            }

                            /* 100% Image Width on Smaller Screens */
                            @media only screen and (max-width: 700px){
                                .modal-content {
                                    width: 100%;
                                }
                            }
                            </style>
                            <script>
                                var modal = document.getElementById('myModal1');

                                // Get the image and insert it inside the modal - use its "alt" text as a caption
                                var img = document.getElementById('myImg');
                                var modalImg = document.getElementById("img01");
                                var span = document.getElementById("closes");

                                //                    var captionText = document.getElementById("caption");
                                img.onclick = function(){
                                    modal.style.display = "block";
                                    modalImg.src = this.src;
                                };

                                // Get the <span> element that closes the modal

                                // When the user clicks on <span> (x), close the modal
                                span.onclick = function() {
                                    modal.style.display = "none";
                                }
                            </script>
<g:if test="${productInstance.productDetails.isSale}">
                                                       <div class="ribbon sale">
                                <div class="theribbon">SALE</div>
                                <div class="ribbon-background"></div>
                            </div>
</g:if>
<g:if test="${productInstance.isLatest}">
                            <!-- /.ribbon -->
                            <div class="ribbon new">
                                <div class="theribbon">NEW</div>
                                <div class="ribbon-background"></div>
                            </div>
                            <!-- /.ribbon -->
</g:if>
                        </div>
                        <div class="col-sm-6">
                            <div class="box box-height" id="detailInfo" style="height:400px;overflow-y: scroll;">
                                <h1 class="text-center bigName">${productInstance.productDetails.productBrand.brandName}</h1>
                                <h1 class="text-center bigName">${productInstance.productDetails.briefDescription}</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">${productInstance.productDetails.productName}</a>
                                </p>

                                <p class="price">

                                        Rs.<g:formatNumber number="${productInstance.productDetails.price-(productInstance.productDetails.discountPercentage*productInstance.productDetails.price/100)}" type="number" maxFractionDigits="2"/>
                                        <g:if test="${productInstance.productDetails.isSale}">
<br>
                                              <del class="del-price" style="font-size: 15px;">Rs.${productInstance.productDetails.price}</del>

                                        </g:if>
                                </p>


                                <g:if test="${session.endUser}">
                                    <form action="/cart/addToCart" method="post" class="text-center buttons" id="myForm">
                                                                              <g:hiddenField name="id" value="${productInstance.id}"></g:hiddenField>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <g:select class="form-control" name="size"
                                                  from="${productSizeList}" optionKey="id" id="size" optionValue="sizeName"
                                                          noSelection="${['null':'Select Size']}"
                                                />
                                                </div>
                                        </div>
                                        <p class="text-center buttons">

                                            <button type="button" data-toggle="modal" data-target="#confirmModel" class="btn btn-primary" id="submit_IdOrder"><i class="fa fa-shopping-cart"></i>Add to cart</button>

                                            %{--<button class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</button>--}%
                                        </p>
                                    </form>
                                    %{--<a href="basket.html" class="btn btn-default"><i class="fa fa-heart"></i> Add to wishlist</a>--}%

</g:if>
                                <div class="bootbox modal fade bootbox-confirm in" id="confirmModel" tabindex="-1" role="dialog"  aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
                                                <div class="bootbox-body">Are you sure want to add this item to cart?</div>
                                            </div><div class="modal-footer">
                                            <div data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</div>
                                            <button  type="button" class="btn btn-primary"  data-dismiss="modal" onclick="validAddToCart();"><i class="fa fa-check"></i> Confirm</button>
                                        </div>
                                        </div>
                                    </div>
                                </div>
<script>
    function preventMultipleSubmissions() {
        $('#submit_IdOrder').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
        function validAddToCart(){
            var responseValue;
            var size=document.getElementById("size").value;
            if(size=='null'){
              bootbox.alert({
                  size:"small",
                  message:"size of product not selected"
              } );
                responseValue=false;
            }
            else{
            $.ajax({
                url: "${createLink(controller:'cart', action:'checkSession')}",
                type: "POST",
                cache: false,
                async: false,
                success: function (text) {
                    if(text=="notOk"){
                        bootbox.alert({
                            message: "Sorry, your session has expired or you are not logged in. Try to login again!!!.",
                            callback: function(){
                                location.reload();
                            }

                        });


                        responseValue=false;
                    }
                    else if(text=="ok"){

                        document.getElementById("myForm").submit();

                    }
                }

            });
            return responseValue
        }}

</script>
                                <g:if test="${session.endUser==null}">
                                    <h5 class="text-center">You must login first to shop product</h5>


                                    <p class="text-center buttons">
                                    <a href="#" data-toggle="modal" data-target="#login-modal" class="btn btn-primary" ><i class="fa fa-sign-in"></i> Log in</a>
                                        <g:link action="register"  controller="endUserInformation" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</g:link>
                                    </p>
                                </g:if>

                            </div>

                            <div class="row"  id="thumbs">
                                <div class="col-xs-4">
                                    <a href="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.frontImageName])}" class="thumb" >
                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.frontImageName])}" class="img-responsive img-thumb">


                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.sideImageName])}" class="thumb" >

                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.sideImageName])}" class="img-responsive img-thumb">

                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.backImageName])}" class="thumb" >
                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.backImageName])}" class="img-responsive img-thumb">

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
                            <%
                                def string=productInstance.productDetails.detailDescription
                                String[] lines = string.split("\r\n|\r|\n");
                            %>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <%
                                        for (String line : lines) {
                                    %>
                                    ${line}
                                    <br> <% } %>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                        Sizes And Fits</a>
                                    <i class="indicator glyphicon glyphicon-plus  pull-right"></i>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
<g:each in="${productSizeList}" var="list">

    <li>${list.sizeName}-${list.sizeDetails}</li>
    </g:each>
                                </ul>

                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                        More Colors (${moreColorsList.size()})</a>
                                        <i class="indicator glyphicon glyphicon-plus  pull-right"></i>
                            </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="accordion-image">
                                        <g:each in="${moreColorsList}" var="list">
                                    <div class="ac-img">
                                        <div class="col-md-3 col-sm-6">
                                            <div class="product product-color">
                                                <div class="flip-container">
                                                    <div class="flipper">
                                                        <div class="front">
                                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive food1-img">

                                                            </g:link>
                                                        </div>
                                                        <div class="back">
                                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive food1-img">

                                                            </g:link>
                                                        </div>
                                                    </div>
                                                </div>
                                                <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="invisible food1">
                                                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive">

                                                </g:link>

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
                                    </div>
                                        </g:each>
                                    %{--<div class="ac-img">--}%
                                        %{--<a href="#"><img src="images/product-12.jpg" alt="Groovy Apparel"></a>--}%
                                    %{--</div>--}%
                                    <div class="clearfix"></div>
                                </div>
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
                            %{--<a id="btn_shareInstagram" title="instagram Share" class="btn btn-instagram a" data-animate-hover="pulse" href="">--}%
                                %{--<i class="fa fa-instagram"></i>--}%
                            %{--</a>--}%
                        </p>
                    </div>
                    </div>
                    <script>
                        var url=document.URL;

                        $('#accordion').on('hidden.bs.collapse', function () {
//do something...
                        })

                        $('#accordion .accordion-toggle').click(function (e){
                            var chevState = $(e.target).siblings("i.indicator").toggleClass('glyphicon-minus glyphicon-plus');
                            $("i.indicator").not(chevState).removeClass("glyphicon-minus").addClass("glyphicon-plus");
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'https://graph.facebook.com?id='+url+'&scrape=true',
                            success: function(data){
                                console.log(data);
                            }
                        });
                    </script>

                    <script>
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
<g:each in="${relatedProductList}" var="list" status="i">
    <g:if test="${i<3}">
        <div class="col-md-3 col-sm-6">
            <div class="product same-height">
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

                            <del class="del-price">Rs.<g:formatNumber number="${list.productDetails.price}" type="number" maxFractionDigits="2" /></del></p>
                    </g:if>
                    <g:if test="${list.productDetails.isSale==false}">

                        <p class="price"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>

                            <del class="del-price" style="visibility: hidden;">Rs.<g:formatNumber number="${list.productDetails.price}" type="number" maxFractionDigits="2" /></del></p>                                </g:if>
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

    </g:if>
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