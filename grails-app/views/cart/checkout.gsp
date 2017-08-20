<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

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

        <div class="col-md-12" id="basketBar">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Shopping cart</li>

            </ul>
        </div>
        <div class="col-md-12" id="addressBar" style="display: none;">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Checkout - Address</li>
            </ul>
        </div>
        <div class="col-md-12" id="deliveryBar" style="display: none;">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Checkout - Delivery method</li>
            </ul>
        </div>
        <div class="col-md-12" id="paymentBar" style="display: none;">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Checkout - Payment method</li>
            </ul>
        </div>
        <div class="col-md-12" id="orderReviewBar" style="display: none;">
            <ul class="breadcrumb">
                <li><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <li>Checkout - Order review</li>
            </ul>
        </div>

        <div class="col-md-9" id="basket">
            <div class="box" >

                <form method="POST">

                    <h1 class="bigName">Shopping cart</h1>
                    <p class="text-muted">You currently have ${Cart.findAllByEndUserInformation(session.endUser).size()} item(s) in your cart.</p>
                    <g:if test="${Cart.findAllByEndUserInformation(session.endUser)}">
                    <div class="table-responsive" id="tableResponsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th colspan="2">Product</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th>Unit price</th>
                                <th>Discount</th>
                                <th colspan="2">Total</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${Cart.findAllByEndUserInformation(session.endUser)}" var="list">
                                <g:hiddenField name="id" value="${list?.product.id}"> </g:hiddenField>

                                <g:hiddenField name="size" value="${list?.productSize.id}"> </g:hiddenField>

                                <tr>
                                    <td><a>
                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.product.specialImageName])}">

                                    </a>
                                    </td>
                                    <td>${list.product.productColor.colorName+" "+list.product.productDetails.productName+" "+list.product.productDetails.productBrand.brandName}
                                    </td>
                                    <td>${list.productSize.sizeName}</td>

                                    <td>

                                        <g:field  type="number" name="quantity" value="${list?.quantity}" min="1"  class="form-control quantity"/>
                                    </td>
                                    <td>Rs.<g:formatNumber number="${list.product.productDetails.price}" type="number" maxFractionDigits="2" /></td>
                                    <td>${list.product.productDetails.discountPercentage}%</td>
                                    <td>Rs.<g:formatNumber number="${(list.product.productDetails.price*list.quantity)-(list.product.productDetails.discountPercentage*(list.product.productDetails.price*list.quantity)/100)}" type="number" maxFractionDigits="2" /></td>
                                    <td><a class="deleteCart" onclick="deleteProduct(${list.id},this);"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="6">Total</th>
                                <th colspan="2" class="totalPrice">Rs.${totalPrice}</th>
                            </tr>
                            </tfoot>
                        </table>

                    </div>
                    </g:if>
                    <g:if test="${!Cart.findAllByEndUserInformation(session.endUser)}">
                        <h3>Your cart is empty.Yo can shop by clicking the button below. Thank you.</h3>
                        </g:if>
                    <!-- /.table-responsive -->

                    <div class="box-footer">
                        <div class="pull-left">
                            <g:link action="allProducts" controller="endUser" class="btn btn-default bigButton"><i class="fa fa-chevron-left"></i> Continue shopping</g:link>
                        </div>
                    <g:if test="${Cart.findAllByEndUserInformation(session.endUser).size()!=0}">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-default bigButton" id="updateBasket"><i class="fa fa-refresh" ></i> Update basket</button>
                            <div class="btn btn-primary bigButton" onclick="showAddress(this);">Proceed to checkout <i class="fa fa-chevron-right"></i>
                            </div>
                        </div>
                    </g:if>
                    </div>


</form>
            </div>


            <!-- /.box -->
<g:if test="${Cart.findAllByEndUserInformation(session.endUser)}">
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
                                <h3><g:link action="singleProduct" controller="endUser" id="${list.productId}">${list.productDetails.productName}</g:link></h3>
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
</g:if>
            </div>
<g:if test="${Cart.findAllByEndUserInformation(session.endUser)}">

    <div class="col-md-3" id="basketSummary">
            <div class="box" id="order-summary">
                <div class="box-header">
                    <h3>Order summary</h3>
                </div>
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>

                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>Order subtotal</td>
                            <th class="totalPrice">Rs.${totalPrice}</th>
                        </tr>
                        <tr>
                            <td>Shipping and handling</td>
                            <th class="shippingAndHandling">Rs.${shippingAndHandling}</th>
                        </tr>
                        <tr>
                            <td>Tax</td>
                            <th class="tax">Rs.${tax}</th>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <th class="totalPriceTotal">Rs.${totalPriceTotal}</th>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>



        </div>

</g:if>

        <div class="col-md-9" id="checkout">
            <form action="/checkOut/placeOrder" method="post" id="myForm">

                <div class="box" style="display: none;" id="deliveryAddress">

                <h1 class="bigName">Checkout-Address</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li class="active"><a onclick="showAddress(this);"><i class="fa fa-map-marker"></i><br>Address</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-truck"></i><br>Delivery Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>


                    <div class="content">
                      <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="firstName">Firstname</label>
                                <input type="text" name="firstName" placeholder="firstName" class="form-control" id="firstName">
                                <small style="color: #a94442; display: none;" id="firstNameBlank">
                                    Please supply your firstName</small>

                            </div>
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="lastName">Lastname</label>
                                    <input type="text" name="lastName" placeholder="lastName" class="form-control" id="lastName">
                                    <small style="color: #a94442; display: none;" id="lastNameBlank">
                                        Please supply your lastName</small>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address">Delivery Address</label>
                                    <input type="text" name="address" placeholder="address" class="form-control" id="address">
                                    <small style="color: #a94442; display: none;" id="addressBlank">
                                        Please supply your delivery address</small>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone">Mobile</label>
                                    <input type="text" name="phone" placeholder="mobile No" class="form-control" id="phone">
                                    <small style="color: #a94442; display: none;" id="phoneBlank">
                                        Please supply your phone number</small>
                                    <small style="color: #a94442; display: none;" id="phoneInvalid">
                                        Please supply your valid phone number</small>

                                </div>
                            </div>
                        </div>

                        <!-- /.row -->


                        <!-- /.row -->

                        <!-- /.row -->
                    </div>

                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="btn btn-default bigButton" onclick="backToBasket(this);"><i class="fa fa-chevron-left"></i>Back to basket</div>
                        </div>
                        <div class="pull-right">
                            <div class="btn btn-primary bigButton" onclick="deliveryMethod(this);">Continue to Delivery Method<i class="fa fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="box" style="display: none;" id="deliveryMethod">

                    <h1 class="bigName">Checkout - Delivery method</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li><div onclick="showAddress(this);"><i class="fa fa-map-marker"></i><br>Address</div>
                        </li>
                        <li class="active"><a onclick="deliveryMethod(this);"><i class="fa fa-truck"></i><br>Delivery Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="row">
                            <g:each in="${DeliveryMethod.findAllByIsShowStatus(true)}" var="list">
                            <div class="col-sm-6">
                                <div class="box shipping-method">

                                    <h4>${list.briefDescribe}</h4>

                                    <p>${list.detailDescribe}</p>

                                    <div class="box-footer text-center">

                                        <input type="radio" name="delivery" value="${list.id}">
                                    </div>
                                </div>
                            </div>
                            </g:each>
                        </div>
                        <!-- /.row -->

                    </div>
                    <!-- /.content -->

                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="btn btn-default bigButton" onclick="backToAddress(this);"><i class="fa fa-chevron-left" ></i>Back to Addresses</div>
                        </div>
                        <div class="pull-right">
                            <div class="btn btn-primary bigButton" onclick="paymentMethod(this);">Continue to Payment Method<i class="fa fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="box" style="display: none;" id="paymentMethod">

                    <h1 class="bigName">Checkout - Payment method</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li><div onclick="showAddress(this);"><i class="fa fa-map-marker"></i><br>Address</div>
                        </li>
                        <li><div onclick="deliveryMethod(this);"><i class="fa fa-truck"></i><br>Delivery Method</div>
                        </li>
                        <li class="active"><a onclick="paymentMethod(this);"><i class="fa fa-money"></i><br>Payment Method</a>
                        </li>
                        <li class="disabled"><a href="checkout4.html"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="row">
                            <g:each in="${PaymentMethod.findAllByIsShowStatus(true)}" var="list">
                            <div class="col-sm-6">
                                <div class="box payment-method">

                                    <h4>${list.briefDescribe}</h4>

                                    <p>${list.detailDescribe}</p>

                                    <div class="box-footer text-center">

                                        <input type="radio" name="payment" value="${list.id}">
                                    </div>
                                </div>
                            </div>
                            </g:each>
                        </div>
                        <!-- /.row -->

                    </div>
                    <!-- /.content -->

                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="btn btn-default bigButton" onclick="backToDeliveryMethod(this);"><i class="fa fa-chevron-left"></i>Back to Shipping method</div>
                        </div>
                        <div class="pull-right">
                            <div class="btn btn-primary bigButton" onclick="orderReview(this);">Continue to Order review<i class="fa fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="box" style="display: none;" id="orderReview">
                    <h1 class="bigName">Checkout - Order review</h1>
                    <ul class="nav nav-pills nav-justified">
                        <li><div onclick="showAddress(this);"><i class="fa fa-map-marker"></i><br>Address</div>
                        </li>
                        <li><div onclick="deliveryMethod(this);"><i class="fa fa-truck"></i><br>Delivery Method</div>
                        </li>
                        <li><div onclick="paymentMethod(this);"><i class="fa fa-money"></i><br>Payment Method</div>
                        </li>
                        <li class="active"><a onclick="orderReview(this);"><i class="fa fa-eye"></i><br>Order Review</a>
                        </li>
                    </ul>

                    <div class="content">
                        <div class="table-responsive" id="tableResponsive1">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th colspan="2">Product</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                    <th>Unit price</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${Cart.findAllByEndUserInformation(session.endUser)}" var="list">
                                    <tr>
                                        <td><a>
                                            <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.product.specialImageName])}">

                                        </a>
                                        </td>
                                        <td>${list.product.productColor.colorName+" "+list.product.productDetails.productName+" "+list.product.productDetails.productBrand.brandName}
                                        </td>
                                        <td>${list.productSize.sizeName}</td>

                                        <td>
${list.quantity}
                                        </td>
                                        <td>Rs.<g:formatNumber number="${list.product.productDetails.price}" type="number" maxFractionDigits="2" /></td>
                                        <td>${list.product.productDetails.discountPercentage}%</td>
                                        <td>Rs.<g:formatNumber number="${(list.product.productDetails.price*list.quantity)-(list.product.productDetails.discountPercentage*(list.product.productDetails.price*list.quantity)/100)}" type="number" maxFractionDigits="2" /></td>

                                    </tr>

                                </g:each>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="6">Total</th>
                                    <th id="totalPrice1">Rs.${totalPrice}</th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.content -->
<style>
                td img{
                    height:65px;
                    width: 50px;
                }
            </style>
                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="btn btn-default bigButton" onclick="backToPayment(this);"><i class="fa fa-chevron-left"></i>Back to Payment method</div>
                        </div>
                        <div class="pull-right">

                            <button type="button"  class="btn btn-primary bigButton" data-toggle="modal" data-target="#confirmModel" id="submit_IdOrder">Place an order<i class="fa fa-chevron-right"></i>
                            </button>
                            <div class="bootbox modal fade bootbox-confirm in" id="confirmModel" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
                                            <div class="bootbox-body">Are you sure want to place your order?</div>
                                        </div><div class="modal-footer">
                                        <div data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</div>
                                        <button  type="button" class="btn btn-primary"  data-dismiss="modal" onclick="ValidCheckOut();"><i class="fa fa-check"></i> Confirm</button>
                                    </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>

            <!-- /.box -->

            </form>

        </div>
        <div class="col-md-3" style="display: none;" id="checkoutSummary">

            <div class="box" id="order-summary">
                <div class="box-header">
                    <h3>Order summary</h3>
                </div>
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>

                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>Order subtotal</td>
                            <th class="totalPrice">Rs.${totalPrice}</th>
                        </tr>
                        <tr>
                            <td>Shipping and handling</td>
                            <th class="shippingAndHandling">Rs.${shippingAndHandling}</th>
                        </tr>
                        <tr>
                            <td>Tax</td>
                            <th class="tax">Rs.${tax}</th>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <th class="totalPriceTotal">Rs.${totalPriceTotal}</th>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>


        </div>



        <script>

            $( document ).ready(function() {
                document.getElementsByName("payment")[0].checked = true;
                document.getElementsByName("delivery")[0].checked = true;
                $('.quantity').keydown(function() {
                    return false;
                });
            });


            function preventMultipleSubmissions() {
                $('#submit_IdOrder').prop('disabled', true);
            }

            window.onbeforeunload = preventMultipleSubmissions;

            function ValidCheckOut(){

    var responseValue;
    $.ajax({
        url: "${createLink(controller:'checkOut', action:'checkCart')}",
        type: "POST",
        cache: false,
        async: false,
        success: function (text) {
            if(text=="sessionNull"){
                bootbox.alert({
                    message: "Sorry, your session has expired or you are not logged in. Try to login again.",
                    callback: function(){
                        location.reload();
                    }

                });


responseValue=false;
            }
            else if(text=="cartEmpty"){
                bootbox.alert({
                    message: "Sorry, your cart is empty. You must have something in your cart to send enquiry!!!.",
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
}
            $(function() {
                $("#updateBasket").click(function(evt) {
                    var quantity=document.getElementsByName("quantity");
                    var size=document.getElementsByName("size");

                    var id=document.getElementsByName("id");
                    var idList=[];
                    var quantityList=[];
                    var sizeList=[];
                    for (var i = 0; i < id.length; i++) {
                        idList.push(id[i].value);
                        quantityList.push(quantity[i].value);
                        sizeList.push(size[i].value)

                    }
                    var array = [];
                    array[0] = idList;
                    array[1] = quantityList;
                    array[2]=sizeList;
                    bootbox.confirm({
//                        title: "Destroy planet?",
                        message: "Are you sure want to update the basket?",
                        buttons: {
                            cancel: {
                                label: '<i class="fa fa-times"></i> Cancel'
                            },
                            confirm: {
                                label: '<i class="fa fa-check"></i> Confirm'
                            }
                        },
                        callback: function (result) {
                            if(result==true){
                                $.ajax({
                                    url: "${createLink(controller:'cart', action:'updateBasket')}",
                                    global: false,
                                    type: "POST",
                                    data: { "array": JSON.stringify(array) },
                                    cache: false,
                                    async: false,
                                    success: function (text) {
                                        $('#tableResponsive').load(document.URL +  ' #tableResponsive');
                                        $('.totalPrice').html("Rs."+text[0]);
                                        $('.shippingAndHandling').html("Rs."+text[1]);
                                        $('.tax').html("Rs."+text[2]);
                                        $('.totalPriceTotal').html("Rs."+text[3]);
                                        $('.hidden-sm').load(document.URL +  ' .hidden-sm');
//                            $('.hidden-xs').load(document.URL +  ' .hidden-xs');

                                        $('#tableResponsive1').load(document.URL +  ' #tableResponsive1');
                                        $('#totalPrice1').html("Rs."+text[0]);
                                        if ($(".deleteCart").length < 2){
                                            location.reload();
                                        }

                                    }

                                });

                            }
                        }
                    });

                    evt.preventDefault();
                })
            });
            function deleteProduct(id,evt){
                bootbox.confirm({
//                    title: "Destroy planet?",
                    message: "Are you sure want to remove this item from basket?",
                    buttons: {
                        cancel: {
                            label: '<i class="fa fa-times"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="fa fa-check"></i> Confirm'
                        }
                    },
                    callback: function (result) {
                        if(result==true){
                            $.ajax({
                                url: "${createLink(controller:'cart', action:'delete')}",
                                global: false,
                                type: "POST",
                                data: { "id":id },
                                cache: false,
                                async: false,
                                success: function (text) {
                                    $('#tableResponsive').load(document.URL +  ' #tableResponsive');
                                    $('.totalPrice').html("Rs."+text[0]);
                                    $('.shippingAndHandling').html("Rs."+text[1]);
                                    $('.tax').html("Rs."+text[2]);
                                    $('.totalPriceTotal').html("Rs."+text[3]);
                                    $('.hidden-sm').load(document.URL +  ' .hidden-sm');

                                    $('#tableResponsive1').load(document.URL +  ' #tableResponsive1');
                                    $('#totalPrice1').html("Rs."+text[0]);
                                    if ($(".deleteCart").length < 2)
                                    {
                                        location.reload();
                                    }


                                }

                            });
                        }
                    }
                });

evt.preventDefault();
            }
            function showAddress(evt){
                $('#basketBar').hide();

                $('#basket').hide();
                $('#basketSummary').hide();
                $('#paymentBar').hide();

                $('#paymentMethod').hide();

                $('#orderReviewBar').hide();

                $('#orderReview').hide();


                $('#addressBar').show();
                $('#deliveryAddress').show();
                $('#checkoutSummary').show();
                evt.preventDefault();
            }
            function backToBasket(evt){
                $('#addressBar').hide();
                $('#deliveryAddress').hide();
                $('#checkoutSummary').hide();
                $('#basketBar').show();
                $('#basket').show();
                $('#basketSummary').show();
                evt.preventDefault();
            }
            function deliveryMethod(evt){
                var phoneNumber=$('#phone').val();
                var phoneno = /^\d{10}$/;
                if($('#firstName').val()==''){
                    $('#firstNameBlank').show();
                    $("#firstName").css("border", "1px solid #a94442");
                    document.getElementById("firstName").focus();
                    return false;
                }
                if($('#lastName').val()==''){
                    $('#lastNameBlank').show();
                    $("#lastName").css("border", "1px solid #a94442");
                    document.getElementById("lastName").focus();
                    return false;
                }
                if($('#address').val()==''){
                    $('#addressBlank').show();
                    $("#address").css("border", "1px solid #a94442");
                    document.getElementById("address").focus();
                    return false;
                }
                if($('#phone').val()==''){
                    $('#phoneBlank').show();
                    $("#phone").css("border", "1px solid #a94442");
                    document.getElementById("phone").focus();
                    return false;
                }


                            if(!(phoneNumber.match(phoneno)))
                            {
                                $('#phoneBlank').hide();
                                $('#phoneInvalid').show();

                                $("#phone").css("border", "1px solid #a94442");
                                document.getElementById("phone").focus();
                                return false;

                            }




                else{

                $('#paymentBar').hide();

                $('#paymentMethod').hide();

                $('#orderReviewBar').hide();

                $('#orderReview').hide();

                $('#addressBar').hide();

                $('#deliveryAddress').hide();
                $('#deliveryBar').show();

                $('#deliveryMethod').show();
                evt.preventDefault();}

            }
            function backToAddress(evt){
                $('#deliveryBar').hide();

                $('#deliveryMethod').hide();

                $('#addressBar').show();

                $('#deliveryAddress').show();
                evt.preventDefault();


            }
            function paymentMethod(evt){
                $('#orderReviewBar').hide();

                $('#orderReview').hide();

                $('#addressBar').hide();

                $('#deliveryAddress').hide();

                $('#deliveryBar').hide();

                $('#deliveryMethod').hide();

                $('#paymentBar').show();

                $('#paymentMethod').show();

                evt.preventDefault();


            }
            function backToDeliveryMethod(evt){
                $('#paymentBar').hide();

                $('#paymentMethod').hide();
                $('#deliveryBar').show();

                $('#deliveryMethod').show();

                evt.preventDefault();

            }
            function orderReview(evt){

                $('#addressBar').hide();

                $('#deliveryAddress').hide();

                $('#deliveryBar').hide();

                $('#deliveryMethod').hide();

                $('#paymentBar').hide();

                $('#paymentMethod').hide();
                $('#orderReviewBar').show();

                $('#orderReview').show();


                evt.preventDefault();

            }
            function backToPayment(){
                $('#orderReview').hide();

                $('#orderReviewBar').hide();
                $('#paymentBar').show();

                $('#paymentMethod').show();
                e.preventDefault();

            }
        </script>
        <!-- /.col-md-9 -->

        <!-- /.col-md-3 -->

    </div>
    <div class="bootbox modal fade bootbox-confirm in" id="messageModel" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;" onclick="reloadPage();">×</button>

                                <p class="text-center">
                                    <img src="${resource(dir: "images/companyInformation",file: "${CompanyInformation.list()[0].logoImageName}")}" alt="yarsaa-logo" />

                                </p>

                                <h3 class="alert alert-success fade in">Dear,Customer. Your order has been successfully kept under process. And Your order Id is-<h2 style="text-align: center;">${flash.message1}</h2></h2></h3>
                                <h4>Dear Customer, you are requested to remember your order Id. Thank you!!</h4>

                </div>
                <div class="modal-footer">
                <div data-bb-handler="cancel" type="button" class="btn btn-primary" data-dismiss="modal" onclick="reloadPage();">Okey</div>
            </div>
            </div>
        </div>
    </div>
    <div class="bootbox modal fade bootbox-confirm in" id="messageModel1" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;" onclick="reloadPage();">×</button>

                    <p class="text-center">
                        <img src="${resource(dir: "images/companyInformation",file: "${CompanyInformation.list()[0].logoImageName}")}" alt="yarsaa-logo" />

                    </p>

                    <h3 class="alert alert-danger fade in">${flash.message}.</h3>

                </div>
                <div class="modal-footer">
                    <div data-bb-handler="cancel" type="button" class="btn btn-primary" data-dismiss="modal" onclick="reloadPage();">Okey</div>
                </div>
            </div>
        </div>
    </div>

    <g:if test="${flash.message1}">
        <script>
            function reloadPage(){
                location.reload();
            }
            $('#messageModel').modal('toggle');
        </script>
    </g:if>
    <g:if test="${flash.message}">

            <script>
            function reloadPage(){
                location.reload();
            }
            $('#messageModel1').modal('toggle');
        </script>
        </script>
    </g:if>

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