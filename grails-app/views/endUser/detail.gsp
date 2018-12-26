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
    <div class="container-fluid">

      <div class="col-md-12">
        <ul class="breadcrumb">
          <li><g:link action="userHome" controller="endUser">Home</g:link>
          </li>

          <li><g:link action="allCategoryProducts" params="[category:totalArray[0].productDetails.productCategory.urlName]" controller="endUser">
            ${totalArray[0].productDetails.productCategory.categoryName}</g:link>
          </li>
          <li><g:link action="subCategoryList" controller="endUser" params="[category:totalArray[0].productDetails.productCategory.urlName,subCategorySpecify: totalArray[0].productDetails.productSubCategory.productSubCategorySpecify.urlName,subCategory:totalArray[0].productDetails.productSubCategory.urlName]">
            ${totalArray[0].productDetails.productSubCategory.subCategoryName}</g:link>
          </li>

          <li>${totalArray[0].productDetails.productName+" "+totalArray[0].productDetails.productBrand.brandName}</li>
        </ul>

      </div>

      %{--<div class="col-md-3">--}%
      %{--<!-- *** MENUS AND FILTERS ***--}%
      %{--_________________________________________________________ -->--}%
      %{--<div class="panel panel-default sidebar-menu">--}%

      %{--<div class="panel-heading">--}%
      %{--<h3 class="panel-title">Categories</h3>--}%
      %{--</div>--}%

      %{--<div class="panel-body">--}%
      %{--<ul class="nav nav-pills nav-stacked category-menu">--}%

      %{--<li class="active">--}%


      %{--<g:link action="allCategoryProducts" params="[category:totalArray[0].productDetails.productCategory.urlName]" controller="endUser">${totalArray[0].productDetails.productCategory.categoryName} <span class="badge pull-right"></span></g:link>--}%
      %{--<g:each in="${ProductSubCategorySpecify.list()}" var="specifyList" status="i">--}%

      %{--<div class="dropdownA">--}%
      %{--<ul>--}%
      %{--<%--}%
      %{--def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)--}%
      %{--def productList=new ArrayList<>()--}%
      %{--for(ProductSubCategory productSubCategory: subCategoryList1){--}%
      %{--def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,totalArray[0].productDetails.productCategory),false)--}%
      %{--if(product){--}%
      %{--productList.add(product)--}%
      %{--}--}%
      %{--}--}%
      %{--%>--}%
      %{--<g:if test="${productList}">--}%
      %{--<li><g:link action="specifiedProducts" params="[category:totalArray[0].productDetails.productCategory.urlName,subCategorySpecify:specifyList.urlName]" controller="endUser" class="dropbtnA"> ${specifyList.specificationName}</g:link></li>--}%
      %{--</g:if>--}%
      %{--</ul>--}%
      %{--<ul class="dropdown-contentA">--}%
      %{--<g:each in="${ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)}" var="subCategoryList">--}%
      %{--<g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(totalArray[0].productDetails.productCategory,subCategoryList),false)}">--}%

      %{--<li><g:link action="subCategoryList" controller="endUser" params="[category:totalArray[0].productDetails.productCategory.urlName,subCategorySpecify:subCategoryList.productSubCategorySpecify.urlName,subCategory:subCategoryList.urlName]">${subCategoryList.subCategoryName}</g:link>--}%

      %{--</li>--}%

      %{--</g:if>--}%
      %{--</g:each>--}%
      %{--<li><a href="category.html">Shirts</a>--}%
      %{--<li><a href="category.html">Pants</a>--}%
      %{--</li>--}%
      %{--<li><a href="category.html">Accessories</a>--}%
      %{--</li>--}%
      %{--</ul>--}%

      %{--</div>--}%
      %{--</li>--}%
      %{--</g:each>--}%


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

      %{--</ul>--}%

      %{--</div>--}%
      %{--</div>--}%

      %{--<style>--}%
      %{--.dropbtnA {--}%

      %{--cursor: pointer;--}%
      %{--width:223px;--}%
      %{--}--}%

      %{--.dropdownA {--}%
      %{--position: relative;--}%
      %{--display: inline-block;--}%
      %{--}--}%

      %{--.dropdown-contentA {--}%
      %{--display: none;--}%
      %{--position: absolute;--}%
      %{--background-color: #f9f9f9;--}%
      %{--min-width: 223px;--}%
      %{--box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);--}%
      %{--z-index: 1;--}%
      %{--}--}%

      %{--.dropdown-contentA a {--}%
      %{--color: black;--}%
      %{--padding: 12px 16px;--}%
      %{--text-decoration: none;--}%
      %{--display: block;--}%
      %{--}--}%

      %{--.dropdown-contentA a:hover {background-color: #f1f1f1;--}%
      %{--color:rgb(17, 102, 183);--}%
      %{--text-decoration: none;--}%
      %{--}--}%

      %{--.dropdownA:hover .dropdown-contentA {--}%
      %{--display: block;--}%
      %{--}--}%

      %{--.dropdownA:hover .dropbtnA {--}%

      %{--}--}%
      %{--</style>--}%

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

      %{--<!-- *** MENUS AND FILTERS END *** -->--}%

      %{--<div class="banner">--}%
      %{--<a href="#">--}%
      %{--<img src="img/banner.jpg" alt="sales 2014" class="img-responsive">--}%
      %{--</a>--}%
      %{--</div>--}%
      %{--</div>--}%

      <div class="col-md-1" id="thumbList">
        <div class="row" id="thumbs">
          <g:each in="${totalArray[4]}" var="list" status="i">

            <div class="col-md-12 col-xs-2 thumbList">
              %{--<a href="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[0].frontImageName])}" class="thumb" >--}%
              %{--<img data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[0].frontImageName])}" class="img-responsive lazy">--}%


              %{--</a>--}%
              <a href="#" class="thumb" id="thumb${i}" data-image="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.mediumImageName])}" data-zoom-image="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.zoomImageName])}">

                <img id="changeImage${i}" src="${resource(dir: 'images', file: 'spinner-product-small.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.thumbnailImageName])}" class="img-responsive lazy" >
              </a>
              &nbsp;

            </div>
          </g:each>

        </div>
      </div>
      <div class="col-md-11">
        <div class="row" id="productMain">
          <div class="col-sm-6">
            %{--<div id="mainImage" class="mainImage-coverDown mainImage-height">--}%
            %{--<img id="myImg" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[0].frontImageName])}" class="img-responsive mainImage-height lazy">--}%

            %{--</div>--}%
            <div id="mainImage">
            %{--<img id="myImg" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[0].frontImageName])}" class="img-responsive lazy">--}%
              <g:if test="${totalArray[4]}">
                <img id="zoom" src="${resource(dir: 'images', file: 'spinner-product-medium.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[4][0].mediumImageName])}" data-zoom-image="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[4][0].zoomImageName])}" class="img-responsive lazy">
              </g:if>
            </div>





          </div>
          <script src="${resource(dir: 'js', file: 'yarsaa/fancyGallery.js')}" type="text/javascript"
                  charset="utf-8"></script>


          <div class="col-sm-6">
            <div class="box detailBox" style="height:500px;">
              <h3 class="detailName">${totalArray[0].productDetails.productBrand.brandName+" "+totalArray[0].productDetails.briefDescription}</h3>

<g:hiddenField name="productIdWithColor" id="productIdWithColor" value="${totalArray[0].id}"></g:hiddenField>
              %{--<h5 style="color:#337ab7">vendido por <a href="#">Samsung</a> · <small style="color:#337ab7">(5054 ventas)</small></h5>--}%

              <!-- Precios -->
              <h3 style="margin-top:0px;" class="productDetailPrice">Rs. <g:formatNumber number="${totalArray[0].productDetails.price-(totalArray[0].productDetails.discountPercentage*totalArray[0].productDetails.price/100)}" type="number" maxFractionDigits="2"/></h3>
              <g:if test="${totalArray[0].productDetails.isSale==true}">
                <p style="margin-top: -10px;" class="delPriceDetail"><del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.${totalArray[0].productDetails.price}</del>
                <div class="discountBoxDetail">-${totalArray[0].productDetails.discountPercentage}%</div></p>
              </g:if>

            <!-- Detalles especificos del producto -->
              <div class="section colorSection">
                <h6 class="title-attr" style="margin-top:15px;"><small>color</small></h6>
                <div>
                  <div class="attr active" style="width:50px;"><img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:totalArray[0].specialImageName])}" class="img-responsive lazy">
                    <input type="hidden" name="productColor" id="productColor0" value="${totalArray[0].id}"/>
                  </div>

                  <g:each in="${totalArray[2]}" var="list" status="i">

                    <div class="attr" style="width:50px;"><img src="${resource(dir: 'images', file: 'Spinner-1s-25px.gif')}" data-src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.specialImageName])}" class="img-responsive lazy">
                      <input type="hidden" name="productColor" id="productColor${i+1}" value="${list.id}"/>
                    </div>

                  </g:each>
                </div>
              </div>
              <div class="section" style="padding-bottom:5px;">
                <h6 class="title-attr"><small>size</small></h6>
                <div>
                  <g:each in="${totalArray[1]}" var="list">
                  <div class="attr2">${list.sizeName}</div>
                  </g:each>
                  <h6 id="errorSize" style="display: none;"><small class="errorSize" style="font-size: 10px;color: #D10B23;">Please select an option to continue</small></h6>
                </div>
              </div>

              <div class="section" style="padding-bottom:20px;">
                <h6 class="title-attr"><small>QUANTITY</small></h6>
                <div>
                  <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                  <input value="1" name="quantity" id="quantity" onkeypress="return isNumber(event)"/>
                  <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                </div>
                <h6 id="errorQuantity" style="display: none;"><small style="font-size: 10px;color: #D10B23;">Quantity must be number greater than 0</small></h6>

              </div>

              <!-- Botones de compra -->
              <div class="section" style="padding-bottom:20px;">
                <button class="btn btn-primary AddTocartButton" id="addToCart"><span style="margin-right:20px" class="fa fa-shopping-cart" aria-hidden="true"></span> Add to cart</button>
                %{--<h6><a href="#"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span> Agregar a lista de deseos</a></h6>--}%
              </div>
                  <script>
                      function isNumber(evt) {
                          evt = (evt) ? evt : window.event;
                          var charCode = (evt.which) ? evt.which : evt.keyCode;
                          if (charCode > 31 && (charCode <= 48 || charCode > 57)) {
                              document.getElementById("errorQuantity").style.display='block';
                              document.getElementById("quantity").value=1;
                              return false;
                          }
                          return true;
                      }
                      $("#addToCart").on("click", function(e) {
                          var quantity=parseInt(document.getElementById("quantity").value);
                          var size=($('.attr2').hasClass( "active"));
                          if(!size){

                              document.getElementById("errorSize").style.display='block';

                          }
                          else{
                              document.getElementById("errorSize").style.display='none';
                          }
                          if(!(quantity === parseInt(quantity, 10))){
                              document.getElementById("errorQuantity").style.display='block';

                          }
                          else{
                              document.getElementById("errorQuantity").style.display='none';

                          }
                          if(size && (quantity === parseInt(quantity, 10))){

                              var sizes=document.getElementsByClassName("attr2 active");
                              for(var i=0;i<sizes.length;i++){
                                  var productSize=sizes[i].innerHTML
                              }
                              var productIdWithColor=document.getElementById("productIdWithColor").value;
                              var array = [];
                              array[0]=productIdWithColor;
                              array[1]=productSize;
                              array[2]=quantity;
                              $.ajax({
                                  url: "${createLink(controller:'cart', action:'addToCart')}",
                                  type: "POST",
                                  data: { "array": JSON.stringify(array) },
                                  async : false,
                                  cache:false,
                                  success: function() {
                                      $('#cart').load(document.URL +  ' #cart');
                                      $('#cartShow').load(document.URL +  ' #cartShow');
                                      $('#cartDelete').hide();
                                      $('#cartUnableToDelete').hide();
                                      $('#cartSuccessful').show();
                                      $('#checkOutFromPopUp').show();
                                      $('#messageModelCart').modal('toggle');
                                  }
                              });

                          }
                          e.preventDefault();
                      });
                  </script>

                  %{--<h1 class="text-center bigName">${totalArray[0].productDetails.productBrand.brandName}</h1>--}%
              %{--<h1 class="text-center bigName1">${totalArray[0].productDetails.briefDescription}</h1>--}%
              %{--<p class="goToDescription"><a href="#details" class="scroll-to">${totalArray[0].productDetails.productName}</a>--}%
              %{--</p>--}%

              %{--<p class="price">--}%

              %{--Rs.<g:formatNumber number="${totalArray[0].productDetails.price-(totalArray[0].productDetails.discountPercentage*totalArray[0].productDetails.price/100)}" type="number" maxFractionDigits="2"/>--}%
              %{--<g:if test="${totalArray[0].productDetails.isSale}">--}%
              %{--<br>--}%
              %{--<del class="del-price" style="font-size: 15px;">Rs.${totalArray[0].productDetails.price}</del>(-${totalArray[0].productDetails.discountPercentage}%)--}%

              %{--</g:if>--}%
              %{--</p>--}%


              %{--<g:if test="${session.endUser}">--}%
              %{--<form action="/cart/addToCart" method="post" class="text-center buttons" id="myForm">--}%
              %{--<g:hiddenField name="id" value="${totalArray[0].id}"></g:hiddenField>--}%
              %{--<div class="col-sm-6 col-md-6">--}%
              %{--<div class="form-group">--}%
              %{--<g:select class="form-control" name="size"--}%
              %{--from="${totalArray[1]}" optionKey="id" id="size" optionValue="sizeName"--}%
              %{--noSelection="${['null':'Select Size']}"--}%
              %{--/>--}%
              %{--</div>--}%
              %{--</div>--}%
              %{--<p class="text-center buttons">--}%

              %{--<button type="button" data-toggle="modal" data-target="#confirmModel" class="btn btn-primary" id="submit_IdOrder"><i class="fa fa-shopping-cart"></i>Add to cart</button>--}%

              %{--<button class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</button>--}%
              %{--</p>--}%
              %{--</form>--}%
              %{--<a href="basket.html" class="btn btn-default"><i class="fa fa-heart"></i> Add to wishlist</a>--}%

              %{--</g:if>--}%
              %{--<div class="bootbox modal fade bootbox-confirm in" id="confirmModel" tabindex="-1" role="dialog"  aria-hidden="true">--}%
              %{--<div class="modal-dialog">--}%
              %{--<div class="modal-content">--}%
              %{--<div class="modal-body">--}%
              %{--<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>--}%
              %{--<div class="bootbox-body">Are you sure want to add this item to cart?</div>--}%
              %{--</div><div class="modal-footer">--}%
              %{--<div data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</div>--}%
              %{--<button  type="button" class="btn btn-primary"  data-dismiss="modal" onclick="validAddToCart();"><i class="fa fa-check"></i> Confirm</button>--}%
              %{--</div>--}%
              %{--</div>--}%
              %{--</div>--}%
              %{--</div>--}%
              %{--<script>--}%
              %{--function preventMultipleSubmissions() {--}%
              %{--$('#submit_IdOrder').prop('disabled', true);--}%
              %{--}--}%

              %{--window.onbeforeunload = preventMultipleSubmissions;--}%
              %{--function validAddToCart(){--}%
              %{--var responseValue;--}%
              %{--var size=document.getElementById("size").value;--}%
              %{--if(size=='null'){--}%
              %{--bootbox.alert({--}%
              %{--size:"small",--}%
              %{--message:"size of product not selected"--}%
              %{--} );--}%
              %{--responseValue=false;--}%
              %{--}--}%
              %{--else{--}%
              %{--$.ajax({--}%
              %{--url: "${createLink(controller:'cart', action:'checkSession')}",--}%
              %{--type: "POST",--}%
              %{--cache: false,--}%
              %{--async: false,--}%
              %{--success: function (text) {--}%
              %{--if(text=="notOk"){--}%
              %{--bootbox.alert({--}%
              %{--message: "Sorry, your session has expired or you are not logged in. Try to login again!!!.",--}%
              %{--callback: function(){--}%
              %{--location.reload();--}%
              %{--}--}%

              %{--});--}%


              %{--responseValue=false;--}%
              %{--}--}%
              %{--else if(text=="ok"){--}%

              %{--document.getElementById("myForm").submit();--}%

              %{--}--}%
              %{--}--}%

              %{--});--}%
              %{--return responseValue--}%
              %{--}}--}%

              %{--</script>--}%
              %{--<g:if test="${session.endUser==null}">--}%
              %{--<h5 class="text-center">You must login first to shop product</h5>--}%


              %{--<p class="text-center buttons">--}%
              %{--<a href="#" data-toggle="modal" data-target="#login-modal" class="btn btn-primary" ><i class="fa fa-sign-in"></i> Log in</a>--}%
              %{--<g:link action="register"  controller="endUserInformation" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</g:link>--}%
              %{--</p>--}%
              %{--</g:if>--}%

            </div>

          </div>

        </div>

        <style>

        .item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
        .menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0;margin-top:20px}
        .AddTocartButton{width:100%;border-radius:0;}
        .section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;background:#f8f9f9}
        .title-price{margin-top:30px;margin-bottom:0;color:black}
        .title-attr{margin-top:0;margin-bottom:0;color:black;}
        .btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
        .btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}
        div.section > div {width:100%;display:inline-flex;}
        div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
        .attr{cursor:pointer;margin-right:5px;height:50px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
        .attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
        .attr.active,.attr2.active{ border:1px solid orange;}

        </style>
        <script>
            var $imgss;

            $(document).ready(function(){
                //-- Click on detail
                $("ul.menu-items > li").on("click",function(){
                    $("ul.menu-items > li").removeClass("active");
                    $(this).addClass("active");
                })

                $(".attr").on("click",function(e){
                    if(!($(this).hasClass( "active"))) {
                        index=0;
                        var clase = $(this).attr("class");

                        $("." + clase).removeClass("active");
                        $(this).addClass("active");
                        var index1 = $(".attr").index(this);
                        var id = document.getElementById("productColor" + index1).value;
                        $.ajax({
                            url: "${createLink(controller:'endUser', action:'findView')}",
                            type: "POST",
                            data: {"id": id},
                            async: false,
                            cache: false,
                            success: function (result) {
                                $('.thumbList').remove();
                                $('#fancybox-container-1').remove();
                                for (var i = 0; i < result.length; i++) {
                                    $('#thumbs').append('<div class="col-md-12 col-xs-2 thumbList"> <a href="#" class="thumb" id="thumb' + i + '" data-image="/imageRender/renderImage?imageName=' + result[i]["mediumImageName"] + '" data-zoom-image="/imageRender/renderImage?imageName=' + result[i]["zoomImageName"] + '" onclick="myFunction(this);"> <img id="changeImage' + i + '" src="${resource(dir: 'images', file: 'spinner-product-small.gif')}" data-src="/imageRender/renderImage?imageName=' + result[i]["thumbnailImageName"] + '" class="img-responsive lazy"> </a> &nbsp; </div>');
                                }
                                document.getElementById("productIdWithColor").value=id;
                                var elements = document.getElementById("thumb0");
                                elements.className += " active";
                                // define the gallery object
                                var $gallerys = $('#thumbs');

                                // Build array of objects to open in Fancybox.
                                $imgss = [];
                                $('a', $gallerys).each(function() {
                                    $imgss.push({'src': $(this).data('zoom-image')});
                                });
                                // Initiate ElevateZoom
                                if(width>=1000) {
                                    $("#zoom").attr('src', "/imageRender/renderImage?imageName=" + result[0]["mediumImageName"]).data('zoom-image', "/imageRender/renderImage?imageName=" + result[0]["zoomImageName"]).elevateZoom({
                                        gallery: $gallerys.attr('id'),
                                        zoomWindowWidth:500,
                                        zoomWindowHeight:500,
                                        cursor: 'pointer',
                                        galleryActiveClass: 'active',
                                        responsive: true,
                                        imageCrossfade: true
                                    });
                                }
                                else{
                                    $("#zoom").attr('src', "/imageRender/renderImage?imageName=" + result[0]["mediumImageName"]).data('zoom-image', "/imageRender/renderImage?imageName=" + result[0]["zoomImageName"]).elevateZoom({
                                        gallery: $gallerys.attr('id'),
                                        zoomType: "inner",
                                        cursor: "crosshair",
                                        responsive: true
                                    });

                                }
                                $("#zoom").on("click", function(e) {
                                    $.fancybox.close();
                                    $.fancybox.open($imgss, false,index);
                                });

                            }

                        });
                    }

                    e.preventDefault();
                })


                $(".attr2").on("click",function(){
                    var clase = $(this).attr("class");

                    $("." + clase).removeClass("active");
                    $(this).addClass("active");
                })

                //-- Click on QUANTITY
                $(".btn-minus").on("click",function(){
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)){
                        if (parseInt(now) -1 > 0){ now--;}
                        $(".section > div > input").val(now);
                    }else{
                        $(".section > div > input").val("1");
                    }
                })
                $(".btn-plus").on("click",function(){
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)){
                        $(".section > div > input").val(parseInt(now)+1);
                    }else{
                        $(".section > div > input").val("1");
                    }
                })
            })
            function myFunction(element){
                index = $('.thumb').index(element);
            }
        </script>
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
                  def string=totalArray[0].productDetails.detailDescription
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
            FB.api('https://graph.facebook.com/', 'post', {
                id: url,
                scrape: true
            }, function(response) {

            });
            $('#accordion').on('hidden.bs.collapse', function () {
//do something...
            })

            $('#accordion .accordion-toggle').click(function (e){
                var chevState = $(e.target).siblings("i.indicator").toggleClass('glyphicon-minus glyphicon-plus');
                $("i.indicator").not(chevState).removeClass("glyphicon-minus").addClass("glyphicon-plus");
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
  <script>
      $(document).ready(function () {

          $('html, body').animate({
              scrollTop: $("#thumbList").offset().top
          }, 2000);
      });

  </script>



</div>
</body>

</html>