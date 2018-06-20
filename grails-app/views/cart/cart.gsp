<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 6/9/18
  Time: 1:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userYarsaa">

    <title></title>
</head>

<body>
<div id="content">
<div class="container">
    <div class="col-md-12" id="basketBar">
        <ul class="breadcrumb">
            <li><g:link action="userHome" controller="endUser">Home</g:link>
            </li>
            <li>Basket</li>

        </ul>
    </div>
    <div class="col-md-9" id="basket">
        <div class="box" >

            <form method="POST">
                <h1 class="bigName">Shopping cart</h1>
                <p class="text-muted" id="itemsInCart">You currently have ${session.cart.size()} item(s) in your cart.</p>
                <p class="text-muted updateCart" id="updateItem" style="display: none;">Cart has been updated successfully.</p>
                <p class="text-muted updateCart" id="deleteItem" style="display: none;">Item has been successfully removed from cart.</p>
                <p class="text-muted updateCart" id="unableToPerformAction" style="display: none;">unable to perform this operation.Try again later.</p>

                <g:if test="${session.cart.size>0}">
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
                            <g:each in="${session.cart}" var="list" status="i">
                                <g:hiddenField name="id" value="${list?.product.id}"> </g:hiddenField>

                                <g:hiddenField name="size" value="${list?.productSize.id}"> </g:hiddenField>

                                <tr>
                                    <td><a>
                                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.product.specialImageName])}">

                                    </a>
                                    </td>
                                    <td>${list.productDetails.productName+" "+list.productBrand.brandName}
                                    </td>
                                    <td>${list.productSize.sizeName}</td>

                                    <td>

                                        <g:field  type="number" name="quantity" value="${list?.quantity}" class="form-control quantity" onchange="handleChange(this);"/>
                                    </td>
                                    <td>Rs.<g:formatNumber number="${list.productDetails.price}" type="number" maxFractionDigits="2" /></td>
                                    <td>${list.productDetails.discountPercentage}%</td>
                                    <td>Rs.<g:formatNumber number="${(list.productDetails.price*list.quantity)-(list.productDetails.discountPercentage*(list.productDetails.price*list.quantity)/100)}" type="number" maxFractionDigits="2" /></td>
                                    <td><a class="deleteCart" onclick="deleteProduct(${i},${list.product.id},${list.productSize.id},this);"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="6">Total</th>
                                <th colspan="2" class="totalPrice">Rs.${totalArray[0]}</th>
                            </tr>
                            </tfoot>
                        </table>

                    </div>
                    <script>
                        function handleChange(input) {
                            if (input.value < 1) input.value =1 ;
                        }
                    </script>
                </g:if>
                <g:if test="${session.cart.size()==0}">
                    <h3>Your cart is empty.Yo can shop by clicking the button below. Thank you.</h3>
                </g:if>
            <!-- /.table-responsive -->

                <div class="box-footer">
                    <div class="pull-left">
                        <g:link action="allProducts" controller="endUser" class="btn btn-default bigButton"><i class="fa fa-chevron-left"></i> Continue shopping</g:link>
                    </div>
                    <g:if test="${session.cart.size()>0}">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-default bigButton" id="updateBasket"><i class="fa fa-refresh" ></i> Update basket</button>
                            <g:link action="checkout" controller="cart" class="btn btn-primary bigButton">Proceed to checkout <i class="fa fa-chevron-right"></i>
                            </g:link>
                        </div>
                    </g:if>
                </div>


            </form>
        </div>


        <!-- /.box -->
    </div>
    <g:if test="${session.cart.size()>0}">

        <div class="col-sm-3" id="basketSummary">
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
                            <th class="totalPrice">Rs.${totalArray[0]}</th>
                        </tr>
                        <tr>
                            <td>Shipping and handling</td>
                            <th class="shippingAndHandling">Rs.${totalArray[2]}</th>
                        </tr>
                        <tr>
                            <td>Tax</td>
                            <th class="tax">Rs.${totalArray[3]}</th>
                        </tr>
                        <tr class="total">
                            <td>Total</td>
                            <th class="totalPriceTotal">Rs.${totalArray[4]}</th>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>



        </div>
    </g:if>
</div>


    <g:if test="${flash.cartEmptyMessage}">

        <script>
            bootbox.alert({
                message: '${flash.cartEmptyMessage}',
                size: 'small',
                callback: function(){
                    window.location="/basket";
                }

            });
        </script>

    </g:if>

</div>
<script>
    $( document ).ready(function() {
        $('.quantity').keydown(function() {
            return false;
        });
    });

    $(function() {
        $("#updateBasket").click(function(evt) {
            var quantity=document.getElementsByName("quantity");
            var quantityList=[];
            for (var i = 0; i < quantity.length; i++) {
                quantityList.push(quantity[i].value);

            }
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
                            data: { "array": JSON.stringify(quantityList) },
                            cache: false,
                            async: false,
                            success: function (text) {
                                if(text=="cartEmpty"){
                                    bootbox.alert({
                                        message: 'cart is empty to perform such operation.',
                                        size: 'small',
                                        callback: function(){
                                            location.reload();
                                        }

                                    });
                                }
else if(text[5]=="yes"){
                                    $('#tableResponsive').load(document.URL + ' #tableResponsive');
                                    $('.totalPrice').html("Rs." + text[0]);
                                    $('.shippingAndHandling').html("Rs." + text[1]);
                                    $('.tax').html("Rs." + text[2]);
                                    $('.totalPriceTotal').html("Rs." + text[3]);
                                    $('.hidden-sm').load(document.URL + ' .hidden-sm');
                                    $('#itemsInCart').load(document.URL + ' #itemsInCart');
                                    $('#deleteItem').hide();
                                    $('#unableToPerformAction').hide();

                                    $('#updateItem').show();
                                    if ($(".deleteCart").length < 1) {
                                        location.reload();
                                    }

                                }
                            else if(text[5]=="no"){
                                    $('#tableResponsive').load(document.URL + ' #tableResponsive');
                                    $('.totalPrice').html("Rs." + text[0]);
                                    $('.shippingAndHandling').html("Rs." + text[1]);
                                    $('.tax').html("Rs." + text[2]);
                                    $('.totalPriceTotal').html("Rs." + text[3]);
                                    $('.hidden-sm').load(document.URL + ' .hidden-sm');
                                    $('#itemsInCart').load(document.URL + ' #itemsInCart');
                                    $('#deleteItem').hide();
                                    $('#updateItem').hide();
                                    $('#unableToPerformAction').show();

                                    if ($(".deleteCart").length < 1) {
                                        location.reload();
                                    }
                                }
                            }

                        });

                    }
                }
            });

            evt.preventDefault();
        })
    });
    function deleteProduct(index,productId,productSizeId,evt){
        var idList=[index,productId,productSizeId];

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
                        data: { "idList": JSON.stringify(idList) },
                        cache: false,
                        async: false,
                        success: function (text) {
                            if(text=="cartEmpty"){
                                bootbox.alert({
                                    message: 'cart is empty to perform such operation.',
                                    size: 'small',
                                    callback: function(){
                                        location.reload();
                                    }

                                });
                            }
                            else if(text[5]=="yes"){
                                $('#tableResponsive').load(document.URL + ' #tableResponsive');
                                $('.totalPrice').html("Rs." + text[0]);
                                $('.shippingAndHandling').html("Rs." + text[1]);
                                $('.tax').html("Rs." + text[2]);
                                $('.totalPriceTotal').html("Rs." + text[3]);
                                $('.hidden-sm').load(document.URL + ' .hidden-sm');
                                $('#itemsInCart').load(document.URL + ' #itemsInCart');
                                $('#unableToPerformAction').hide();
                                $('#updateItem').hide();
                                $('#deleteItem').show();
                                if ($(".deleteCart").length < 2) {
                                    location.reload();
                                }

                            }
                            else if(text[5]=="no"){
                                $('#tableResponsive').load(document.URL + ' #tableResponsive');
                                $('.totalPrice').html("Rs." + text[0]);
                                $('.shippingAndHandling').html("Rs." + text[1]);
                                $('.tax').html("Rs." + text[2]);
                                $('.totalPriceTotal').html("Rs." + text[3]);
                                $('.hidden-sm').load(document.URL + ' .hidden-sm');
                                $('#itemsInCart').load(document.URL + ' #itemsInCart');
                                $('#deleteItem').hide();
                                $('#updateItem').hide();
                                $('#unableToPerformAction').show();

                                if ($(".deleteCart").length < 2) {
                                    location.reload();
                                }
                            }

                        }

                    });
                }
            }
        });

        evt.preventDefault();
    }

</script>
</body>
</html>