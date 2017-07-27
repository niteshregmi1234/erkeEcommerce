<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="userYarsaa">

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

    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Shopping Department</li>
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
                                <li>

                            <g:link action="allCategoryProducts" id="${categoryList.id}" controller="endUser">${categoryList.categoryName} <span class="badge pull-right"></span></g:link>
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
            <div class="box b">
                <h1>Shopping Department</h1>
                <p>In our Ladies department we offer wide selection of the best products we have found and carefully selected worldwide.</p>
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
                <g:each in="${productList}" var="list">
                    <g:if test="${list.productDetails.isSale==false}">
                        <div class="col-md-4 col-sm-6 a">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.id}">
                                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                            </g:link>
                                        </div>
                                        <div class="back product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.id}">
                                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" id="${list.id}" class="invisible product">
                                    <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                </g:link>
                                <div class="text">
                                    <h3><g:link action="singleProduct" controller="endUser" id="${list.id}">${list.productDetails.productName+" "+list.productColor+" "+list.productDetails.productBrand.brandName+" "+list.productDetails.productName}</g:link></h3>
                                    <p class="price">Rs.${list.productDetails.price}</p>
                                    <p class="buttons">
                                        <g:link action="singleProduct" controller="endUser" id="${list.id}" class="btn btn-default">View detail</g:link>
                                        <a href="#" onclick="checkAddToCart(${list.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>


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

                        <div class="col-md-4 col-sm-6 a">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.id}">
                                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                            </g:link>
                                        </div>
                                        <div class="back product">
                                            <g:link action="singleProduct" controller="endUser" id="${list.id}">

                                                <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                            </g:link>
                                        </div>
                                    </div>
                                </div>
                                <g:link action="singleProduct" controller="endUser" id="${list.id}" class="invisible product">
                                    <img src="${resource(dir: "images/allProducts/specialImage",file: "${list.specialImageName}")}" alt="" class="img-responsive">

                                </g:link>
                                <div class="text">
                                    <h3><g:link action="singleProduct" controller="endUser" id="${list.id}">${list.productColor.colorName+" "+list.productDetails.productBrand.brandName+" "+list.productDetails.productName}</g:link></h3>
                                    <p class="price"><del>Rs.${list.productDetails.price}</del> Rs.${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}</p>
                                    <p class="buttons">
                                        <g:link action="singleProduct" controller="endUser" id="${list.id}" class="btn btn-default">View detail</g:link>
                                        <a href="#" onclick="checkAddToCart(${list.id});" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>

                                    </p>
                                </div>

                                <!-- /.text -->

                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <g:if test="${list.isLatest==true}">
                                    <div class="ribbon new">
                                        <div class="theribbon">NEW</div>
                                        <div class="ribbon-background"></div>
                                    </div>
                                </g:if>

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
            <script>
                function checkAddToCart(id){
                    alert(id);
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
                #myList .a{ display:none;
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