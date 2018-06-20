<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 8/14/17
  Time: 10:22 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
</head>

<body>
<h1>Recent Orders-</h1><br>
<div class="container"
     id="page_container">
    <div id="accordion_search_bar_container">
        <input type="search"
               id="accordion_search_bar"
               placeholder="Search" style="border: 1px solid black;"/>
    </div>
    <div class="panel-group"
         id="accordion"
         role="tablist"
         aria-multiselectable="true">
        <g:each in="${listListCartList}" var="list" status="i">

    <div class="panel panel-success"
             id="collapse${i}_container">
            <div class="panel-heading"
                 role="tab"
                 id="heading${i}" style="background-color: #0c0c0c;">
                <h4 class="panel-title">
                    <a role="button"
                       data-toggle="collapse"
                       data-parent="#accordion"
                       href="#collapse${i}"
                       aria-expanded="true"
                       aria-controls="collapse${i}" style="color: white;">
Order Id-${list[0].orderId.orderId}
                    </a>
                </h4>
            </div>
            <div id="collapse${i}"
                 class="panel-collapse collapse"
                 role="tabpanel"
                 aria-labelledby="heading${i}">
                <div class="panel-body">
                    <g:form controller="cartHistory" >
                        <div class="container">
                            <h4><u>Time-${list[0].date}</u></h4>
                            <h3><u>Billing Details</u></h3>
                            <div class="table-responsive">
                                <table class="table table-bordered" style="width: 1108px;">
                                    <tbody>
                                    <tr>
                                        <th scope="row">Full Name</th>
                                        <td>${list[0].customerPersonalDetails.firstName+" "+list[0].customerPersonalDetails.lastName}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Company Name</th>
                                        <td>${list[0].customerPersonalDetails.companyName}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email Id</th>
                                        <td>${list[0].orderId.email}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Mobile Number Cumpolsory</th>
                                        <td>${list[0].customerPersonalDetails.mobileOrPhoneCumpolsory}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Optional Mobile Number</th>
                                        <td>${list[0].customerPersonalDetails.mobileOrPhoneOptional}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Cumpolsory Address</th>
                                        <td>${list[0].customerPersonalDetails.cumpolsoryAddress}</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Optional Address</th>
                                        <td>${list[0].customerPersonalDetails.optionalAddress}</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">City</th>
                                        <td>${list[0].customerPersonalDetails.townOrCity}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Customer Type</th>
                                        <td>${list[0].customerType}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <h3><u>Delivery And Payment Methods</u></h3>
                            <div class="table-responsive">

                                <table class="table table-bordered" style="width: 1108px;">
                                    <tbody>

                                    <tr>
                                        <th scope="row">Payment Method</th>
                                        <td>${list[0].paymentMethod.briefDescribe}</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Delivery Method</th>
                                        <td>${list[0].deliveryMethod.briefDescribe}</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Order Notes</th>
                                        <td>${list[0].orderNotes}</td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>
                            <%
                                def shippingDetails=ShippingDetails.findByOrderId(list[0].orderId)
                            %>
                            <g:if test="${shippingDetails}">
                                <h3><u>Shipping To Different Address</u></h3>
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="width: 1108px;">
                                        <tbody>
                                        <tr>
                                            <th scope="row">Full Name</th>
                                            <td>${shippingDetails.firstNameShipping+" "+shippingDetails.lastNameShipping}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Company Name</th>
                                            <td>${shippingDetails.companyNameShipping}</td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Mobile Number</th>
                                            <td>${shippingDetails.mobileOrPhoneShipping}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Cumpolsory Address</th>
                                            <td>${shippingDetails.cumpolsoryAddressShipping}</td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Optional Address</th>
                                            <td>${shippingDetails.optionalAddressShipping}</td>

                                        </tr>
                                        <tr>
                                            <th scope="row">City</th>
                                            <td>${shippingDetails.cityShipping}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </g:if>
                            <h3><u>Orders List</u></h3>
                            <div class="table-responsive">

                                <table class="table table-bordered" style="width: 1108px;">
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
                                    <%
                                        def totalPrice=0
                                    %>
                                    <g:each in="${list}" var="list1">

                                        <g:hiddenField name="cartHistoryId" value="${list1.id}"></g:hiddenField>
                                        <tr>
                                            <td class="abc">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list1.product.specialImageName])}">


                                            </td>
                                            <td>${list1.product.productColor.colorName+" "+list1.product.productDetails.productName+" "+list1.product.productDetails.productBrand.brandName}
                                            </td>
                                            <td>${list1.productSize.sizeName}</td>

                                            <td>
                                                ${list1.quantity}
                                            </td>
                                            <td>Rs.<g:formatNumber number="${list1.product.productDetails.price}" type="number"
                                                                   maxFractionDigits="2" roundingMode="HALF_DOWN" />

                                            </td>
                                            <td>${list1.product.productDetails.discountPercentage}%</td>
                                            <td>Rs.<g:formatNumber number="${(list1.product.productDetails.price*list1.quantity)-(list1.product.productDetails.discountPercentage*(list1.product.productDetails.price*list1.quantity)/100)}" type="number"
                                                                   maxFractionDigits="2" roundingMode="HALF_DOWN" /></td>

                                        </tr>
                                        <%
                                            totalPrice=totalPrice+(list1.product.productDetails.price*list1.quantity)-(list1.product.productDetails.discountPercentage*(list1.product.productDetails.price*list1.quantity)/100)
                                        %>
                                    </g:each>

                                    <tr>

                                        <th>Sub-Total</th>
                                        <th>${""}</th>
                                        <th>${""}</th>
                                        <th>${""}</th>
                                        <th>${""}</th>
                                        <th>${""}</th>
                                        <th>Rs.<g:formatNumber number="${totalPrice}" type="number"
                                                               maxFractionDigits="2" roundingMode="HALF_DOWN" />

                                        </th>


                                    </tr>
                                    <thead>
                                    <tr>
                                        <th colspan="2"></th>
                                        <th colspan="2">Shipping and Handling</th>
                                        <th colspan="2">Tax</th>
                                        <th colspan="2">Total</th>

                                    </tr>

                                    </thead>
                                    <tr>
                                        <td colspan="2">Rs.<g:formatNumber number="${totalPrice}" type="number"
                                                                           maxFractionDigits="2" roundingMode="HALF_DOWN" />
                                        </td>

                                        <td colspan="2">Rs.<g:formatNumber number="${OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100}" type="number"
                                                                           maxFractionDigits="2" roundingMode="HALF_DOWN" />
                                        </td>
                                        <td colspan="2">Rs.<g:formatNumber number="${(((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100}" type="number"
                                                                           maxFractionDigits="2" roundingMode="HALF_DOWN" />
                                        </td>
                                        <th colspan="2">Rs.<g:formatNumber number="${(OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100)+((((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100)+totalPrice}" type="number"
                                                                           maxFractionDigits="2" roundingMode="HALF_DOWN" />
                                        </th>

                                    </tr>

                                </tbody>
                                </table>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label col-sm-2"></label>

                                    <div class="col-sm-6">
                                        <g:actionSubmit action="deliveredToCustomer" name="delivered" value="Delivered" class="btn btn-success a" onclick="return confirm('Are you sure the order is delivered?')"></g:actionSubmit><br><br>
                                        <g:actionSubmit action="addToPending" name="pending" value="Add to Pending" class="btn btn-danger a" onclick="return confirm('Are you sure add the order to pending list?')"></g:actionSubmit>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </g:form>

                </div>
            </div>
        </div>

</g:each>
    </div>
</div>
<style>

#page_container {
    margin-top: 15px;
    margin-bottom: 15px;
}

#accordion_search_bar_container {
    position: relative;}

#accordion_search_bar {
    display: block;
    margin: 10px auto;
    width: 100%;
    padding: 7px 10px;
    border: 1px solid;
    border-radius: 25px;
    outline: 0;
}


.panel-title a {
    display: block;
}

</style>
<script>
    (function(){

        var searchTerm, panelContainerId;
        // Create a new contains that is case insensitive
        $.expr[':'].containsCaseInsensitive = function (n, i, m) {
            return jQuery(n).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };

        $('#accordion_search_bar').on('change keyup paste click', function () {
            searchTerm = $(this).val();
            $('#accordion > .panel').each(function () {
                panelContainerId = '#' + $(this).attr('id');
                $(panelContainerId + ':not(:containsCaseInsensitive(' + searchTerm + '))').hide();
                $(panelContainerId + ':containsCaseInsensitive(' + searchTerm + ')').show();
            });
        });
    }());
</script>



<script>
    function preventMultipleSubmissions() {
        $('.a').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
</script>
<style>
.abc img{
    height: 40px;
    width: 30px;
}
</style>
</body>
</html>