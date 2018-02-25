
<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="userYarsaa">
    %{--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--}%

</head>

<body>
<!-- *** TOPBAR ***
 _________________________________________________________ -->

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
 _________________________________________________________ -->

<!-- /#navbar -->

<!-- *** NAVBAR END *** -->

<div id="content">
    %{--<div class="container">--}%
    %{--<div class="col-md-12">--}%
    %{--<div id="main-slider">--}%
    %{--<div class="item coverUp">--}%
    %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategory.coverImageName])}" class="img-responsive">--}%

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
                <li>Latest Products</li>
            </ul>

        </div>
        <div class="col-md-3">

            <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
            <div class="panel panel-default sidebar-menu">
                <div class="panel-body ">

                    <form class="form-horizontal">

                        <div class="form-group ">
                            <label class="control-label col-lg-4">Sort by:</label>
                            <div class="col-md-7">
                                <div class="products-sort-by">
                                    <select name="sort-by" id="sortCriteria" onchange="prices();" class="form-control">
                                        <option>Sort by</option>
                                        <option value="low">Low Price</option>
                                        <option value="high">High Price</option>
                                        <option value="sales">Top Sales</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <script>
                var ascending = false;

                function prices() {
                    var sortCriteria=document.getElementById("sortCriteria").value;
                    if(sortCriteria=='low'){
                        var sorted = $('.grid-products').sort(function (a, b) {
                            return (ascending ==
                            (convertToNumber($(a).find('.pricesF').html()) <
                            convertToNumber($(b).find('.pricesF').html()))) ? 1 : -1;
                        });

                        $('#myList').html(sorted);

                    }
                    else if(sortCriteria=='high'){
                        sorted = $('.grid-products').sort(function (a, b) {
                            return (ascending ==
                            (convertToNumber($(a).find('.pricesF').html()) >
                            convertToNumber($(b).find('.pricesF').html()))) ? 1 : -1;
                        });

                        $('#myList').html(sorted);

                    }
                    else if(sortCriteria=='sales'){
                        sorted = $('.grid-products').sort(function (a, b) {
                            return (ascending ==
                            (convertToNum($(a).find('.pricesT').html()) >
                            convertToNum($(b).find('.pricesT').html()))) ? 1 : -1;
                        });

                        $('#myList').html(sorted);

                    }
                }
                var convertToNum = function(value){
                    return parseInt(value.replace('Rs',''));
                }
                var convertToNumber = function(value){
                    return parseFloat(value.replace('Rs',''));
                }

            </script>

            <div id='filters' class='sections'>
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Categories </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class="form-group">
                                <g:each in="${productCategoryList}" var="categoryList" status="i">
                                    <div class="checkbox">
                                        <label>
                                            <g:checkBox name="category" id="category${i}" value="${categoryList.id}"/>${categoryList.categoryName}
                                        </label>
                                    </div>
                                    <script>
                                        document.getElementById("category${i}").checked = false;
                                        $("input[name=category]").val();
                                    </script>

                                </g:each>
                            </div>


                        </form>

                    </div>
                </div>

                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Sub Categories </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class="form-group">
                                <g:each in="${productSubCategoryList}" var="subCategoryList" status="i">
                                    <div class="checkbox">
                                        <label>
                                            <g:checkBox name="subCategory" id="subCategory${i}" value="${subCategoryList.id}"/>${subCategoryList.subCategoryName}
                                        </label>
                                    </div>
                                    <script>
                                        document.getElementById("subCategory${i}").checked = false;
                                        $("input[name=subCategory]").val();
                                    </script>

                                </g:each>
                            </div>


                        </form>

                    </div>
                </div>

                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Brands </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class="form-group">
                                <g:each in="${productBrandList}" var="brandList" status="i">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="productBrand" id="${brandList.id}" value="${brandList.id}">${brandList.brandName}</input>
                                        </label>
                                    </div>
                                    <script>
                                        document.getElementById("${brandList.id}").checked = false;
                                        $("input[name=productBrand]").val();
                                    </script>

                                </g:each>
                            </div>


                        </form>

                    </div>
                </div>
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"
                      media="all"/>

                <script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"
                        charset="utf-8"></script>
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Discount(%) </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class="form-group">
                                <g:each in="${discountList}" var="discount" status="i">
                                    <div class="checkbox">
                                        <label>
                                            <g:checkBox name="discount" id="discount${i}" value="${discount}"/>${discount}
                                        </label>
                                    </div>
                                    <script>
                                        document.getElementById("discount${i}").checked = false;
                                        $("input[name=discount]").val();
                                    </script>

                                </g:each>
                            </div>


                        </form>

                    </div>
                </div>

                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Price(Rs.)</h3>
                    </div>
                    <div class="panel-body filter-attributes">


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
                                %{--<button class="btn btn-default btn-sm btn-primary" id="filterPrice"><i class="fa fa-pencil"></i> Apply</button>--}%


                            </form>

                        </div>

                        <script>
                            function isNumberKeyMin(evt)
                            {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57)){
                                    return false;}
                                else{
                                    if($("#amount_min").val()>=${prices[0]}){
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
                                    if($("#amount_max").val()>=${prices[0]}){
                                        return false;
                                    }
                                }
                                return true;

                            }
                            function filterPrice(){
                                var minPrice=parseFloat(document.getElementById("amount_min").value);
                                var maxPrice=parseFloat(document.getElementById("amount_max").value);
                                var brandList=[];
                                var subCategoryList=[];
                                var categoryList=[];
                                var discountList=[];
                                var idList=[];
                                $('input[name="subCategory"]:checked').each(function() {
                                    subCategoryList.push($(this).val());
                                });
                                $('input[name="category"]:checked').each(function() {
                                    categoryList.push($(this).val());
                                });
                                $('input[name="productBrand"]:checked').each(function() {
                                    brandList.push($(this).val());
                                });
                                $('input[name="discount"]:checked').each(function() {
                                    discountList.push($(this).val());
                                });
                                $("input[name='productId']").each(function() {
                                    idList.push($(this).val());
                                });
                                for(var i=0;i<idList.length;i++) {
                                    var price=$( "#price"+idList[i] ).val();
                                    if(price<minPrice){
                                        document.getElementById("product"+idList[i]).style.display="none";
                                    }
                                    else if(price>maxPrice){
                                        document.getElementById("product"+idList[i]).style.display="none";

                                    }
                                    else{
                                        var categoryId=$( "#category"+idList[i] ).val();
                                        var brandId=$( "#brand"+idList[i] ).val();
                                        var subCategoryId=$( "#subCategory"+idList[i] ).val();
                                        var discount=$( "#discount"+idList[i] ).val();
                                        if(brandList!='' && subCategoryList!='' && discountList!='' &&categoryList!=''){
                                            if(categoryList.includes(categoryId) && brandList.includes(brandId) && subCategoryList.includes(subCategoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(brandList!='' && subCategoryList!='' && categoryList!=''){
                                            if(brandList.includes(brandId) && categoryList.includes(categoryId) && subCategoryList.includes(subCategoryId)){
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(brandList!='' && discountList!='' && categoryList!=''){
                                            if(brandList.includes(brandId) && categoryList.includes(categoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(brandList!='' && subCategoryList!='' && discountList!=''){
                                            if(brandList.includes(brandId) && subCategoryList.includes(subCategoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(subCategoryList!='' && discountList!='' && categoryList!=''){
                                            if(subCategoryList.includes(subCategoryId) && categoryList.includes(categoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(brandList!='' && categoryList!=''){
                                            if(brandList.includes(brandId) && categoryList.includes(categoryId)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }}
                                        else if(brandList!='' && subCategoryList!=''){
                                            if(brandList.includes(brandId) && subCategoryList.includes(subCategoryId)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }}
                                        else if(brandList!='' && discountList!=''){
                                            if(brandList.includes(brandId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }
                                        else if(subCategoryList!='' && discountList!=''){
                                            if(subCategoryList.includes(subCategoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }
                                        else if(subCategoryList!='' && categoryList!=''){
                                            if(subCategoryList.includes(subCategoryId) && categoryList.includes(categoryId)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }
                                        else if(categoryList!='' && discountList!=''){
                                            if(categoryList.includes(categoryId) && discountList.includes(discount)){
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }

                                        else if(subCategoryList!=''){
                                            if(subCategoryList.includes(subCategoryId)) {
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }
                                        else if(discountList!=''){
                                            if(discountList.includes(discount)) {
                                                document.getElementById("product"+idList[i]).style.display="block";
                                            }
                                        }
                                        else if(brandList!=''){
                                            if(brandList.includes(brandId)) {
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }
                                        else if(categoryList!=''){
                                            if(categoryList.includes(categoryId)) {
                                                document.getElementById("product"+idList[i]).style.display="block";

                                            }
                                        }

                                        else{
                                            document.getElementById("product"+idList[i]).style.display="block";

                                        }

                                    }
                                }

                                brandList=[];
                                subCategoryList=[];
                                discountList=[];
                                idList=[];
                                categoryList=[]
                            }
                            $(function() {
                                $("#slider-range").slider({
                                    range: true,
                                    min: ${prices[1]},
                                    max: ${prices[0]},
                                    values: [${prices[1]}, ${prices[0]}],
                                    change: function(event, ui) {
                                        $("#amount_min").val(ui.values[0]);
                                        $("#amount_max").val(ui.values[1]);
                                        filterPrice();
                                    }

                                });
                                $("#amount_min").val($("#slider-range").slider("values", 0));
                                $("#amount_max").val($("#slider-range").slider("values", 1));
                                $("#amount_min").change(function() {
                                    $("#slider-range").slider("values", 0,$(this).val());
                                    filterPrice();
                                });
                                $("#amount_max").change(function() {
                                    $("#slider-range").slider("values", 1,$(this).val());
                                    filterPrice();
                                })
                            });

                        </script>

                    </div>
                </div>

                <!-- *** MENUS AND FILTERS END *** -->

                %{--<div class="banner">--}%
                %{--<a href="#">--}%
                %{--<img src="img/banner.jpg" alt="sales 2014" class="img-responsive">--}%
                %{--</a>--}%
                %{--</div>--}%
            </div>
        </div>
        <div class="col-md-9">

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
                        <div class="grid-products" id="product${list.id}" data-category="${list.productDetails.productCategory.id}" data-discount="${list.productDetails.discountPercentage}" data-subCategory="${list.productDetails.productSubCategory.id}" data-productBrand="${list.productDetails.productBrand.id}">
                            <input type="hidden" name="price" id="price${list.id}" value="${list.productDetails.price}">
                            <input type="hidden" name="productId" value="${list.id}">
                            <input type="hidden" name="categoryId" id="category${list.id}" value="${list.productDetails.productCategory.id}">

                            <input type="hidden" name="brandId" id="brand${list.id}" value="${list.productDetails.productBrand.id}">
                            <input type="hidden" name="subCategoryId" id="subCategory${list.id}" value="${list.productDetails.productSubCategory.id}">
                            <input type="hidden" name="discount" id="discount${list.id}" value="${list.productDetails.discountPercentage}">
                            <div class="col-md-4 col-sm-4 a ">
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
                                        <div class="tooltips">
                                            <h3 class="textHeight"><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>
                                            <span class="tooltiptext">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</span>
                                        </div>
                                        <span class="pricesT" style="display: none;">Rs${list.soldNumbers}</span>

                                        <span class="pricesF" style="display: none;">Rs${list.productDetails.price}</span>
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
                        </div>
                    </g:if>
                    <g:if test="${list.productDetails.isSale==true}">
                        <div class="grid-products" id="product${list.id}" data-category="${list.productDetails.productCategory.id}" data-price="${list.productDetails.price}" data-discount="${list.productDetails.discountPercentage}" data-subCategory="${list.productDetails.productSubCategory.id}" data-productBrand="${list.productDetails.productBrand.id}">
                            <input type="hidden" name="price" id="price${list.id}" value="${list.productDetails.price}">
                            <input type="hidden" name="productId" value="${list.id}">
                            <input type="hidden" name="brandId" id="brand${list.id}" value="${list.productDetails.productBrand.id}">
                            <input type="hidden" name="subCategoryId" id="subCategory${list.id}" value="${list.productDetails.productSubCategory.id}">
                            <input type="hidden" name="discount" id="discount${list.id}" value="${list.productDetails.discountPercentage}">
                            <input type="hidden" name="categoryId" id="category${list.id}" value="${list.productDetails.productCategory.id}">
                            <div class="col-md-4 col-sm-4 a">
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
                                        <div class="tooltips">
                                            <h3 class="textHeight"><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</g:link></h3>
                                            <span class="tooltiptext">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</span>
                                        </div>
                                        <span class="pricesT" style="display: none;">Rs${list.soldNumbers}</span>
                                        <span class="pricesF" style="display: none;">Rs${list.productDetails.price}</span>

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


                <ul class="pagination">
                    <li><g:paginate  next="&laquo;" prev="&raquo;" total="${countPaginate}"/></li>
                    %{--<li><g:paginate next="Forward" prev="Back"--}%
                                %{--maxsteps="0" controller="endUser"--}%
                                %{--action="latestProducts"  />--}%
                   %{--</li>--}%
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
                </ul>
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


            <g:if test="${productList}">
                    <script>
                        $(document).ready(function () {

                            $('html, body').animate({
                                scrollTop: $(".b").offset().top
                            }, 2000);
                        });

                    </script>
                </g:if>

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

        <!-- /.col-md-9 -->

    </div>
    <!-- /.container -->
</div>
<!-- /#content -->

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






</body>

</html>
