<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="userYarsaa">

</head>

<body>

<div id="content">

    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li><g:link action="allBrands" controller="endUser">Brand</g:link></li>


                <li>${specialBrandInstance.brandName}</li>
            </ul>



            <div class="box b">
                <h1>${specialBrandInstance.brandName}</h1>
                <p>${specialBrandInstance.brandDescription}.</p>
            </div>

            <div class="row products" id="myList">
            <g:each in="${productList}" var="list" status="i">
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


                                <div class="productDescription">${list.productDetails.productBrand.brandName+"-"+list.productDetails.briefDescription}</div>
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
                    var x=8;
                    var c;
                    var b=8;
                    var a=0;
                    if($("#myList .a").size()<=8){
                        $("#loadMore").hide();

                    }
                    $('#myList .a:lt('+x+')').show();
                    $('#loadMore').click(function () {
                        $('html, body').animate({
                            scrollTop: $(".loadMore").offset().top
                        }, 2000);
                        x= (x+4 <= size_li) ? x+4 : size_li;
                        $('#myList .a:lt('+x+')').show();
                        a=a+1;
                        b=b+4;
                        c=8+(4*a);
                        if(b>=size_li){
                            $("#loadMore").hide();

                        }
                        if(a>0){
                            $("#showLess").show();
                        }

                    });
                    $('#showLess').click(function () {
                        if(c==x+3){
                            x=(x-1<0) ? 8 : x-1;
                            $('#myList .a').not(':lt('+x+')').hide();
                            c=x;
                        }
                        else if(c==x+2){
                            x=(x-2<0) ? 8 : x-2;
                            $('#myList .a').not(':lt('+x+')').hide();
                            c=x;
                        }
                        else if(c==x+1){
                            x=(x-3<0) ? 8 : x-3;
                            $('#myList .a').not(':lt('+x+')').hide();
                            c=x;
                        }

                        else{
                            x=(x-4<0) ? 8 : x-4;
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


                });
            </script>
            <g:if test="${productList}">
                <script>
                    $(document).ready(function () {

                        $('html, body').animate({
                            scrollTop: $(".b").offset().top
                        }, 2000);
                    });

                </script>
            </g:if>
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




            <!-- /.col-md-9 -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#content -->
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