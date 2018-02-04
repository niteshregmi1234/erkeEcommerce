<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="userYarsaa">
</head>
<body>

<!-- *** TOPBAR ***
 _________________________________________________________ -->

%{--<div id="all">--}%

    <div id="content">
    %{--<div class="container">--}%
        %{--<div class="col-md-12">--}%
            %{--<div id="main-slider">--}%
                    %{--<div class="item coverUp">--}%
                        %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productSubCategory.coverImageName])}" class="img-responsive">--}%

                    %{--</div>--}%
            %{--</div>--}%
            %{--<!-- /#main-slider -->--}%
        %{--</div>--}%
    %{--</div>--}%
    %{--<style>--}%
    %{--.coverUp img{--}%
        %{--height:520px;--}%
        %{--width: 1108px;--}%
    %{--}--}%
    %{--</style>--}%

    <div class="container">

            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li><g:link action="allCategoryProducts" id="${productCategory.categoryId}" controller="endUser">
                        ${productCategory.categoryName}</g:link>
                    </li>
<li><g:link action="specifiedProducts" params="[category:productCategory.categoryId,subCategorySpecify:productSubCategory.productSubCategorySpecify.id]" controller="endUser">${productSubCategory.productSubCategorySpecify.specificationName}</g:link>
</li>
                    <li>${productSubCategory.subCategoryName}</li>
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

                            
                                <g:link action="allCategoryProducts" id="${productCategory.categoryId}" controller="endUser">${productCategory.categoryName} <span class="badge pull-right"></span></g:link>
                                    <g:each in="${ProductSubCategorySpecify.list()}" var="specifyList" status="i">
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

                                        <div class="dropdownA">
<ul>
    <%
        def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)
        def productList=new ArrayList<>()
        for(ProductSubCategory productSubCategory: subCategoryList1){
            def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,productCategory),false)
            if(product){
                productList.add(product)
            }
        }
    %>
    <g:if test="${productList}">
                                            <li><g:link action="specifiedProducts" params="[category:productCategory.categoryId,subCategorySpecify:specifyList.id]" controller="endUser" class="dropbtnA"> ${specifyList.specificationName}</g:link></li>
</g:if>
                                            </ul>
                                        <ul class="dropdown-contentA">
                                            <g:each in="${ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)}" var="subCategoryList">
                                                <g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(productCategory,subCategoryList),false)}">

                                                    <li><g:link action="subCategoryList" controller="endUser" params="[category:productCategory.categoryId,subCategory:subCategoryList.subCategoryId]">${subCategoryList.subCategoryName}</g:link>

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

                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Brands </h3>
                    </div>

                    <div class="panel-body">

                        <form>
                            <div class="form-group">
                                <g:each in="${ProductBrand.list()}" var="brandList" status="i">
                                <div class="checkbox">
                                    <label>
                                        <g:checkBox name="brand" id="brand${i}" value="${brandList.id}"/>${brandList.brandName}
                                    </label>
                                </div>
                                    <script>
                                        document.getElementById("brand${i}").checked = false;
                                        $("input[name=brand]").val();
                                    </script>

                                </g:each>
                                                           </div>

                            <button class="btn btn-default btn-sm btn-primary" id="filterBrand"><i class="fa fa-pencil"></i> Apply</button>

                        </form>

                    </div>
                </div>
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"
                      media="all"/>

                <script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"
                        charset="utf-8"></script>
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Price(Rs.)</h3>
                    </div>
                    <div class="panel-body">


                        <div id="slider-range">

                    </div>
<div style="margin-top: 10px;">
    <form>

        <div class="col-sm-6">
                            <div class="form-group">
                                <input type="text" class="form-control" id="amount_min" onkeypress="return isNumberKeyMin(event)"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input type="text" class="form-control" id="amount_max" onkeypress="return isNumberKeyMax(event)"/>


                            </div>
                        </div>
        <button class="btn btn-default btn-sm btn-primary" id="filterPrice"><i class="fa fa-pencil"></i> Apply</button>


    </form>

</div>

                        <script>
                            function isNumberKeyMin(evt)
                            {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57)){
                                    return false;}
                                else{
if($("#amount_min").val()>=500){
        return false;
}
                                }
                                return true;

                            }
                            function isNumberKeyMax(evt)
                            {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57)){
                                    return false;}
                                else{
                                    if($("#amount_max").val()>=500){
                                        return false;
                                    }
                                }
                                return true;

                            }
                            $(function() {
                                $("#slider-range").slider({
                                    range: true,
                                    min: ${prices[1]},
                                    max: ${prices[0]},
                                    values: [${prices[1]}, ${prices[0]}],
                                    slide: function(event, ui) {
                                        $("#amount_min").val(ui.values[0]);
                                        $("#amount_max").val(ui.values[1]);
                                    }
                                });
                                $("#amount_min").val($("#slider-range").slider("values", 0));
                                $("#amount_max").val($("#slider-range").slider("values", 1));
                                $("#amount_min").change(function() {
                                    $("#slider-range").slider("values", 0,$(this).val());
                                });
                                $("#amount_max").change(function() {
                                    $("#slider-range").slider("values", 1,$(this).val());
                                })
                            });

                        </script>
                        %{--<form>--}%
                            %{--<div class="form-group">--}%

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
                <div id="loader" style="display: none;">
                    <img src="/images/AjaxLoader.gif"/>
                </div>
                <style>
                    #loader{
                position: relative;
                        margin-top: 350px;
                margin-left: 310px;
                z-index: 1;}
                </style>
                <div class="box b">
                    <h1>${productCategory.categoryName}-${productSubCategory.subCategoryName}</h1>
                    <p>${productSubCategory.subCategoryDescription}.</p>
                </div>

                %{--<div class="box info-bar">--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-sm-12 col-md-4 products-showing">--}%
                            %{--Showing <strong>12</strong> of <strong>${productList.size()}</strong> products--}%
                        %{--</div>--}%

                        %{--<div class="col-sm-12 col-md-8  products-number-sort">--}%
                            %{--<div class="row">--}%
                                %{--<form class="form-inline">--}%
                                    %{--<div class="col-md-6 col-sm-6">--}%
                                        %{--<div class="products-number">--}%
                                            %{--<strong>Show</strong>  <a href="#" class="btn btn-default btn-sm btn-primary">12</a>  <a href="#" class="btn btn-default btn-sm">24</a>  <a href="#" class="btn btn-default btn-sm">All</a> products--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                    %{--<div class="col-md-6 col-sm-6">--}%
                                        %{--<div class="products-sort-by">--}%
                                            %{--<strong>Sort by</strong>--}%
                                            %{--<select name="sort-by" class="form-control">--}%
                                                %{--<option>Price</option>--}%
                                                %{--<option>Name</option>--}%
                                                %{--<option>Sales first</option>--}%
                                            %{--</select>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</form>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%

                <div class="row products" id="myList">

                <g:each in="${productList}" var="list" status="i">
                    <g:if test="${list.productDetails.isSale==false}">
                        <div class="col-md-4 col-sm-4 a brand${list.productDetails.productBrand.id}${list.id}" id="price${list.productDetails.price}${list.id}">
                            <input type="hidden" name="price" value="${list.productDetails.price}">
                            <input type="hidden" name="productId" value="${list.id}">
                            <input type="hidden" name="brandId" id="id${list.id}" value="${list.productDetails.productBrand.id}">

                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.frontImageName])}" class="img-responsive">

                                            </g:link>
                                        </div>
                                        <div class="back product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.backImageName])}" class="img-responsive">

                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="invisible product">
                                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.frontImageName])}" class="img-responsive">

                                </g:link>
                                <div class="text">
                                    <h3><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+" "+list.productDetails.productName}</g:link></h3>
                                    <p class="price"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>
                                        <del class="del-price" style="visibility:hidden;">Rs.${list.productDetails.price}</del></p>
                                    <p class="buttons">
                                        <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="btn btn-default">View detail</g:link>
                                        <a href="#" data-toggle="modal" data-target="#smallModal${i}"  class="btn btn-primary" onclick="addValueToField(${list.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                    </p>
                                </div>
                                <g:if test="${list.isLatest==true}">
                                    <div class="ribbon new">
                                        <div class="theribbon">NEW</div>
                                        <div class="ribbon-background"></div>
                                    </div>
                                </g:if>

                            <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>

                    </g:if>
                    <g:if test="${list.productDetails.isSale==true}">
                        <div class="col-md-4 col-sm-4 a brand${list.productDetails.productBrand.id}${list.id}" id="price${list.productDetails.price}${list.id}">
      <input type="hidden" name="productId" value="${list.id}">
                            <input type="hidden" name="brandId" id="id${list.id}" value="${list.productDetails.productBrand.id}">
                            <input type="hidden" name="price" value="${list.productDetails.price}">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.frontImageName])}" class="img-responsive">

                                            </g:link>
                                        </div>
                                        <div class="back product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.productId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.backImageName])}" class="img-responsive">
                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="invisible product">
                                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.frontImageName])}" class="img-responsive">

                                </g:link>
                                <div class="text">
                                    <h3><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+" "+list.productDetails.productName}</g:link></h3>
                                    <p class="price"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" /><br>
                                        <del class="del-price">Rs.${list.productDetails.price}</del></p>
                                    <p class="buttons">
                                        <g:link action="singleProduct" controller="endUser" id="${list.productId}" class="btn btn-default">View detail</g:link>
                                        <a href="#" data-toggle="modal" data-target="#smallModal${i}"  class="btn btn-primary" onclick="addValueToField(${list.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                </g:each>

            <!-- /.col-md-4 -->
                </div>
                <style>
                    .product img{
                        height:338px;
                        width:251px;
                    }
                </style>
                <!-- /.products -->
                <div class="pages">

                    <p class="loadMore">
                        <a class="btn btn-primary btn-lg" id="loadMore"><i class="fa fa-chevron-down"></i> Load more</a>
                    </p>
                <p class="loadLess">
                    <a class="btn btn-primary btn-lg" id="showLess"><i class="fa fa-chevron-up"></i> Show less</a>
                </p>

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
                    $(document).ready(function () {
                       var size_li = $("#myList .a").size();
                        var x=6;
                        var c;
                        var b=6;
                        var a=0;
                        if($("#myList .a").size()<=6){
                            $("#loadMore").hide();

                        }
                        $('#myList .a:lt('+x+')').show();
                        $('#loadMore').click(function () {
                            $('html, body').animate({
                                scrollTop: $(".loadMore").offset().top
                            }, 2000);
                            x= (x+3 <= size_li) ? x+3 : size_li;
                            $('#myList .a:lt('+x+')').show();
                            a=a+1;
                            b=b+3;
                            c=6+(3*a);
                            if(b>=size_li){
                                $("#loadMore").hide();

                            }
                            if(a>0){
                                $("#showLess").show();
                            }

                        });
                        $('#showLess').click(function () {

                            if(c==x+2){
                                x=(x-1<0) ? 6 : x-1;
                                $('#myList .a').not(':lt('+x+')').hide();
                                c=x;
                            }
                            else if(c==x+1){
                                x=(x-2<0) ? 6 : x-2;
                                $('#myList .a').not(':lt('+x+')').hide();
                                c=x;
                            }
                            else{
                            x=(x-3<0) ? 6 : x-3;
                            $('#myList .a').not(':lt('+x+')').hide();
}
                            a=a-1;
                            b=b-3;

                            if(a==0){
                                $("#showLess").hide();
                            }
                            if(b<size_li){
                                $("#loadMore").show();

                            }

                            $('html, body').animate({
                                scrollTop: $(".a").offset().top
                            }, 2000);

                        });
                        $("#showLess").hide();

                        $('html, body').animate({
                            scrollTop: $(".b").offset().top
                        }, 2000);
                    });
                </script>
                <style>
                #myList .a{
                    display:none;
                }
                /*#loadMore {*/
                /*color:green;*/
                /*cursor:pointer;*/
                /*}*/
                /*#loadMore:hover {*/
                /*color:black;*/
                /*}*/
                /*#showLess {*/
                /*color:red;*/
                /*cursor:pointer;*/
                /*}*/
                /*#showLess:hover {*/
                /*color:black;*/
                /*}*/
                </style>

                %{--<ul class="pagination">--}%
                        %{--<li><a href="#">&laquo;</a>--}%
                        %{--</li>--}%
                        %{--<li class="active"><a href="#">1</a>--}%
                        %{--</li>--}%
                        %{--<li><a href="#">2</a>--}%
                        %{--</li>--}%
                        %{--<li><a href="#">3</a>--}%
                        %{--</li>--}%
                        %{--<li><a href="#">4</a>--}%
                        %{--</li>--}%
                        %{--<li><a href="#">5</a>--}%
                        %{--</li>--}%
                        %{--<li><a href="#">&raquo;</a>--}%
                        %{--</li>--}%
                    %{--</ul>--}%
                </div>


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




<!-- /#all -->




<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->



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
<script src="${resource(dir: 'js', file: 'yarsaa/custom.js')}" type="text/javascript"
        charset="utf-8"></script>

</body>

</html>