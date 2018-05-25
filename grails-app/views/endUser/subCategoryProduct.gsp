

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
                <li><g:link action="allCategoryProducts" params="[category:totalArray[3].urlName]" controller="endUser">
                    ${totalArray[3].categoryName}</g:link>
                </li>
                <li><g:link action="specifiedProducts" params="[category:totalArray[3].urlName,subCategorySpecify:totalArray[4].productSubCategorySpecify.urlName]" controller="endUser">${totalArray[4].productSubCategorySpecify.specificationName}</g:link>
                </li>
                <li>${totalArray[4].subCategoryName}</li>
            </ul>

        </div>

        <!-- /.col-md-9 -->
    <div id="search-results">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"
              media="all"/>

        <script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"
                charset="utf-8"></script>
        <div class="col-md-3" id="filterColumn" style="visibility:hidden;">

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
                                        <option id="sortBy">Sort by</option>
                                        <option value="low" id="LP">Low Price</option>
                                        <option value="high" id="HP">High Price</option>
                                        <option value="sales" id="TS">Top Sales</option>
                                    </select>
                                    <div class="sort" id="lowToHigh" data-sort="priceProduct" style="display: none;">
                                        Sort
                                    </div>
                                    <div class="sort" id="topSales" data-sort="soldNumbers" style="display: none;">
                                        SoldNumbers
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div id='filters' class='sections'>
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Categories </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class=" categoryCheckBox form-group">

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
                            <div class="subCategoryCheckBox form-group">

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
                            <div class="brandCheckBox form-group">

                            </div>


                        </form>

                    </div>
                </div>

                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Discount(%) </h3>
                    </div>

                    <div class="panel-body filter-attributes">

                        <form>
                            <div class="form-group">
                                <div class="discountCheckBox checkbox">

                                </div>

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
                                    if($("#amount_min").val()>=${totalArray[1][0]}){
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
                                    if($("#amount_max").val()>=${totalArray[1][0]}){
                                        return false;
                                    }
                                }
                                return true;

                            }

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
            <div class="box b">
                <h1>${totalArray[3].categoryName}-${totalArray[4].subCategoryName}</h1>
                <p>${totalArray[4].subCategoryDescription}.</p>
            </div>

            <div class="pages">

                <ul id="prevPage">
                    <li><a id="prev" style="display: none;">&laquo;</a>
                    </li>
                </ul>

                <ul class="pagination paginationTop" id="pagesCount"></ul>

                <ul class="pagination" id="nextPage">

                    <li><a id="next" style="display: none;">&raquo;</a>
                    </li>
                </ul>

            </div>
            <div class="row" id="error-page" style="display: none;">
                <div class="box">

                    <p class="text-center">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:CompanyInformation.list()[0].logoImageName])}" class="hidden-xs">

                    </p>

                    <h4 class="text-muted text-center">O products found for your filter enquiry.</h4>

                    <p class="text-center">To continue please use the <strong>filter</strong> in left side or </p><strong>Search form</strong> or <strong>Menu</strong> above.</p>

                    <p class="buttons text-center"><g:link action="userHome" controller="endUser" class="btn btn-primary"><i class="fa fa-home"></i> Go to Homepage</g:link>
                    </p>
                </div>
            </div>

            <div class="list row products" id="myList">
                <g:each in="${totalArray[0]}" var="list" status="i">
                    <div class="grid-products">
                        <div class="category hidden">${list.productDetails.productCategory.categoryName}</div>
                        <div class="subCategory hidden">${list.productDetails.productSubCategory.subCategoryName}</div>
                        <div class="brand hidden">${list.productDetails.productBrand.brandName}</div>
                        <div class="discount hidden">${list.productDetails.discountPercentage}</div>
                        <div class="priceProduct hidden">${list.productDetails.price}</div>
                        <div class="soldNumbers hidden">${list.soldNumbers}</div>
                        <div class="col-md-4 col-sm-4 a">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">
                                                <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                            </g:link>
                                        </div>
                                        <div class="back">
                                            <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]">

                                                <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy" >

                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="invisible">
                                    <img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">

                                </g:link>
                                <div class="text">


                                    <div class="productDescription">${list.productDetails.briefDescription}</div>

                                    <g:if test="${list.productDetails.isSale==true}">
                                        <p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top: 2px;width: 190px;word-wrap: break-word;"> Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />
                                            <del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${list.productDetails.price}</del></p>
                                        <div class="discountBox">-${list.productDetails.discountPercentage}%</div>
                                    </g:if>
                                    <g:if test="${list.productDetails.isSale==false}">

                                        <p class="price priceWithoutDiscount" style="color:#202020;font-weight: 400;font-size: 14px;text-align: left;width: 163px;">Rs.${list.productDetails.price}</p>
                                    </g:if>
                                    <p class="buttons">
                                        <g:link action="singleProduct" controller="endUser" params="[specificationName:list.productSpecificationName]" class="btn btn-default">View detail</g:link>
                                        <a href="#" data-toggle="modal" data-target="#smallModal${i}"  class="btn btn-primary" onclick="addValueToField(${list.id});"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </p>
                                </div>
                                <!-- /.text -->


                            </div>
                            <!-- /.product -->
                        </div>
                    </div>

                </g:each>
            <!-- /.col-md-4 -->
            </div>

            <script>

                window.addEventListener('load', function(){
                    document.getElementById("filterColumn").style.visibility='visible';

                }, false);

            </script>

            <div class="pages">

                <ul id="prevPages">
                    <li><a id="prevs" style="display: none;">&laquo;</a>
                    </li>
                </ul>

                <ul class="pagination paginationBottom" id="pagesCounts"></ul>

                <ul class="pagination" id="nextPages">

                    <li><a id="nexts">&raquo;</a>
                    </li>
                </ul>

            </div>
            <p class="text-center" id="goToTop"><a href="#myList" class="scroll-to">Go to top</a></p>




        </div>
        <g:if test="${totalArray[0].size()<=15}">
            <script>
                document.getElementById("pagesCount").style.display='none';
                document.getElementById("next").style.display='none';
                document.getElementById("pagesCounts").style.display='none';
                document.getElementById("nexts").style.display='none';

            </script>
        </g:if>
        <script>
            $(function() {
                $("#slider-range").slider({
                    range: true,
                    min: ${totalArray[1][1]},
                    max: ${totalArray[1][0]},
                    values: [${totalArray[1][1]}, ${totalArray[1][0]}],
                    slide: function(event, ui) {
                        $("#amount_min").val(ui.values[0]);
                        $("#amount_max").val(ui.values[1]);
                        updateList();

                    }

                });
                $("#amount_min").val($("#slider-range").slider("values", 0));
                $("#amount_max").val($("#slider-range").slider("values", 1));
                $("#amount_min").change(function() {
                    $("#slider-range").slider("values", 0,$(this).val());
                    updateList();
                });
                $("#amount_max").change(function() {
                    $("#slider-range").slider("values", 1,$(this).val());
                    updateList();
                })
            });

        </script>
        <script>

            var paginationTopOptions = {
                name:"paginationTop",
                paginationClass:"paginationTop",
                left: 2,
                right: 1
            };
            var paginationBottomOptions = {
                name:"paginationBottom",
                paginationClass:"paginationBottom",
                left: 2,
                right: 1
            };

            var options = {
                valueNames: ['category', 'subCategory', 'brand','discount','priceProduct','soldNumbers'],
                page: 15,
                plugins: [
                    ListPagination(paginationTopOptions), ListPagination(paginationBottomOptions)
                ]
            };

            var userList = new List('search-results', options);
            var updateList = function () {

                var minPrice=parseFloat(document.getElementById("amount_min").value);
                var maxPrice=parseFloat(document.getElementById("amount_max").value);
                var category =[];
                var subCategory =[];
                var brand = [];
                var discount =[];

                $("input:checkbox[name=category]:checked").each(function () {
                    category.push($(this).val());
                });
                $("input:checkbox[name=subCategory]:checked").each(function () {
                    subCategory.push($(this).val());
                });$("input:checkbox[name=brand]:checked").each(function () {
                    brand.push($(this).val());
                });$("input:checkbox[name=discount]:checked").each(function () {
                    discount.push($(this).val());
                });

                var values_category = category.length > 0 ? category : null;
                var values_subCategory = subCategory.length > 0 ? subCategory : null;
                var values_brand = brand.length > 0 ? brand : null;
                var values_discount = discount.length > 0 ? discount : null;
                var priceProduct=0;

                var itemList=userList.filter(function (item) {
                            return (_(values_category).contains(item.values().category) || !values_category)
                                    && (_(values_subCategory).contains(item.values().subCategory) || !values_subCategory)
                                    && (_(values_brand).contains(item.values().brand) || !values_brand)
                                    && (_(values_discount).contains(item.values().discount) || !values_discount)
                                    && (_(parseFloat(item.values().priceProduct)) <= maxPrice || !maxPrice)
                                    && (_(parseFloat(item.values().priceProduct)) >= minPrice || !minPrice)
                                    && (_(parseFloat(item.values().priceProduct)) > priceProduct);

                        }
                );
                var allimages= document.getElementsByTagName('img');
                var element = $(".pagination li.active");
                var element1 = element.prev('li');
                var element2 = element.next('li');
                document.getElementById("goToTop").style.display='block';
                if (element1.length) {
                    document.getElementById("prev").style.display = 'block';
                    document.getElementById("prevs").style.display = 'block';

                }
                else {
                    document.getElementById("prev").style.display = 'none';
                    document.getElementById("prevs").style.display = 'none';

                }
                if (element2.length) {
                    document.getElementById("next").style.display = 'block';
                    document.getElementById("nexts").style.display = 'block';

                }
                else {
                    document.getElementById("next").style.display = 'none';
                    document.getElementById("nexts").style.display = 'none';
                }

                for (var i=0; i<allimages.length; i++) {
                    if (allimages[i].getAttribute('data-src')) {
                        allimages[i].setAttribute('src', allimages[i].getAttribute('data-src'));
                    }
                }
                if(itemList.length==0) {
                    document.getElementById("error-page").style.display='block';
                    document.getElementById("goToTop").style.display='none';
                }
                else{
                    document.getElementById("error-page").style.display='none';
                    document.getElementById("goToTop").style.display='block';
                }
                var pagesCountDiv=document.getElementsByClassName("pages");
                var number=$( ".paginationBottom li").length;
                if(number==1){
                    for(var m=0;m<pagesCountDiv.length;m++){
                        pagesCountDiv[m].style.display='none';
                    }

                }
                else{
                    for(m=0;m<pagesCountDiv.length;m++){
                        pagesCountDiv[m].style.display='block';
                    }
                }

            }


            var all_category = [];
            var all_subCategory = [];
            var all_brand = [];
            var all_discount = [];

            updateList();

            _(userList.items).each(function (item) {


                all_category.push(item.values().category);
                all_subCategory.push(item.values().subCategory);
                all_brand.push(item.values().brand);
                all_discount.push(item.values().discount)

            });


            _(all_category).uniq().each(function (item) {
                $(".categoryCheckBox").append('<div class="checkbox"> <label><input type="checkbox" name="category" value="' + item + '">' + item + '</label> </div>')
            });
            _(all_subCategory).uniq().each(function (item) {
                $(".subCategoryCheckBox").append('<div class="checkbox"><label><input type="checkbox" name="subCategory" value="' + item + '">' + item + '</label></div>')
            });
            _(all_brand).uniq().each(function (item) {
                $(".brandCheckBox").append('<div class="checkbox"><label><input type="checkbox" name="brand" value="' + item + '">' + item + '</label></div>')
            });
            _(all_discount).uniq().each(function (item) {
                if(item!='0.0') {
                    $(".discountCheckBox").append('<div class="checkbox"><label><input type="checkbox" name="discount" value="' + item + '">' + item + '</label></div>')
                }
            });

            $(document).off("change", "input:checkbox[name=category]");
            $(document).on("change", "input:checkbox[name=category]", updateList);
            $(document).off("change", "input:checkbox[name=subCategory]");
            $(document).on("change", "input:checkbox[name=subCategory]", updateList);
            $(document).off("change", "input:checkbox[name=brand]");
            $(document).on("change", "input:checkbox[name=brand]", updateList);
            $(document).off("change", "input:checkbox[name=discount]");
            $(document).on("change", "input:checkbox[name=discount]", updateList);

            var i=0;
            function prices() {
                var sortCriteria = document.getElementById("sortCriteria").value;
                if (sortCriteria == 'low') {
                    i=1;
                    document.getElementById("sortBy").style.display = 'none';
                    document.getElementById("LP").style.display = 'none';
                    document.getElementById("HP").style.display = 'block';
                    document.getElementById("lowToHigh").click();
                }
                else if (sortCriteria == 'high') {
                    document.getElementById("sortBy").style.display = 'none';
                    document.getElementById("HP").style.display = 'none';
                    document.getElementById("LP").style.display = 'block';
                    document.getElementById("lowToHigh").click();
                    if(i==0){
                        document.getElementById("lowToHigh").click();}
                }
                else if (sortCriteria == 'sales') {
                    i=0;
                    document.getElementById("sortBy").style.display = 'none';
                    document.getElementById("HP").style.display = 'block';
                    document.getElementById("LP").style.display = 'block';
                    document.getElementById("topSales").click();
                    document.getElementById("topSales").click();
                }
            }
            $('#prevPage').addClass('pagination');
            $('#prevPages').addClass('pagination');

            $("#next").on('click', function() {
                var element=$( ".pagination li.active" ).next('li');
                if(element.length){
                    $( element.click());
                    var allimages= document.getElementsByTagName('img');
                    lazyDisplayImage(allimages);
                    document.getElementById("prev").style.display='block';
                    var element1=$( ".pagination li.active" ).next('li');
                    if(element1.length){
                        document.getElementById("next").style.display='block';
                    }
                    else{
                        document.getElementById("next").style.display='none';

                    }
                    return  false;
                }
            });
            $('#prev').on('click', function() {
                var element=$( ".pagination li.active" ).prev('li');
                if(element.length){
                    $( element.click());
                    var allimages= document.getElementsByTagName('img');
                    lazyDisplayImage(allimages);
                    document.getElementById("next").style.display='block';
                    var element1=$( ".pagination li.active" ).prev('li');
                    if(element1.length){
                        document.getElementById("prev").style.display='block';
                    }
                    else{
                        document.getElementById("prev").style.display='none';

                    }
                    return  false;
                }
            });
            $("#nexts").on('click', function() {
                var element=$( ".pagination li.active" ).next('li');
                if(element.length){
                    $( element.click());
                    var allimages= document.getElementsByTagName('img');
                    lazyDisplayImage(allimages);
                    document.getElementById("prevs").style.display='block';
                    var element1=$( ".pagination li.active" ).next('li');
                    if(element1.length){
                        document.getElementById("nexts").style.display='block';
                    }
                    else{
                        document.getElementById("nexts").style.display='none';

                    }
                    return  false;
                }
            });
            $('#prevs').on('click', function() {
                var element=$( ".pagination li.active" ).prev('li');
                if(element.length){
                    $( element.click());
                    var allimages= document.getElementsByTagName('img');
                    lazyDisplayImage(allimages);
                    document.getElementById("nexts").style.display='block';
                    var element1=$( ".pagination li.active" ).prev('li');
                    if(element1.length){
                        document.getElementById("prevs").style.display='block';
                    }
                    else{
                        document.getElementById("prevs").style.display='none';

                    }
                    return  false;
                }
            });

        </script>
        <script>
            $("body").click(function(event){
                var allimages= document.getElementsByTagName('img');
                lazyDisplayImage(allimages);
            });
            function lazyDisplayImage(allimages){
                var element=$( ".pagination li.active" );
                var element1=element.prev('li');
                var element2=element.next('li');
                if(element1.length){
                    document.getElementById("prevs").style.display='block';
                    document.getElementById("prev").style.display='block';

                }
                else{
                    document.getElementById("prevs").style.display='none';
                    document.getElementById("prev").style.display='none';

                }
                if(element2.length){
                    document.getElementById("nexts").style.display='block';
                    document.getElementById("next").style.display='block';

                }
                else{
                    document.getElementById("nexts").style.display='none';
                    document.getElementById("next").style.display='none';

                }

                for (var i=0; i<allimages.length; i++) {
                    if (allimages[i].getAttribute('data-src')) {
                        allimages[i].setAttribute('src', allimages[i].getAttribute('data-src'));
                    }
                }
            }
        </script>
        <g:hiddenField name="productId" id="productId" value=""></g:hiddenField>
        <g:each in="${totalArray[2]}" var="list" status="i">
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


        <g:if test="${totalArray[0]}">
            <script>
                $(document).ready(function () {

                    $('html, body').animate({
                        scrollTop: $("#myList").offset().top
                    }, 2000);
                });

            </script>
        </g:if>


        <script>

            function addValueToField(id){
                document.getElementById("productId").value = id;

            }
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






    </div>

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






</body>

</html>