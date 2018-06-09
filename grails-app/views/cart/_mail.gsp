<html>
<head>
    <style>

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even){background-color: #f2f2f2}

    th {
        background-color: #4CAF50;
        color: white;
    }

    </style>
</head>
<body>
<h3>CartList</h3>
<table border="3px" width="50px">
<tr>
    <th>Product</th>
    <th>Size</th>
    <th>Quantity</th>
    <th>Unit price</th>
    <th>Discount</th>
    <th colspan="2">Total</th>
</tr>


    <g:each in="${session.cart}" var="list">
        <tr>

            <td>${list.productColor.colorName+" "+list.productDetails.productName+" "+list.productBrand.brandName}
            </td>
            <td>${list.productSize.sizeName}</td>
            <td>
${list.quantity}

            </td>
            <td>Rs.<g:formatNumber number="${list.productDetails.price}" type="number"
                                   maxFractionDigits="2" roundingMode="HALF_DOWN" />

                </td>
            <td>${list.productDetails.discountPercentage}%</td>
            <td>Rs.<g:formatNumber number="${(list.productDetails.price*list.quantity)-(list.productDetails.discountPercentage*(list.productDetails.price*list.quantity)/100)}" type="number"
                                   maxFractionDigits="2" roundingMode="HALF_DOWN" />

        </tr>
    </g:each>


<tr>

    <th>Total</th>
    <th>${""}</th>
    <th>${""}</th>
    <th>${""}</th>
    <th>${""}</th>

    <th>Rs.<g:formatNumber number="${totalPrice}" type="number"
                           maxFractionDigits="2" roundingMode="HALF_DOWN" />

        </th>


</tr>
</table >
<table border="3px" width="50px">
    <tr>
        <th>Pre-Total</th>
        <th>Shipping And Handling</th>
        <th>Tax</th>
        <th>Total</th>
            </tr>


        <tr>
            <th>Rs.<g:formatNumber number="${totalPrice}" type="number"
                                   maxFractionDigits="2" roundingMode="HALF_DOWN" />
            </th>

<th>Rs.<g:formatNumber number="${OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100}" type="number"
                    maxFractionDigits="2" roundingMode="HALF_DOWN" />
    </th>
            <th>Rs.<g:formatNumber number="${(((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100}" type="number"
                                maxFractionDigits="2" roundingMode="HALF_DOWN" />
                </th>
            <th>Rs.<g:formatNumber number="${(OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100)+((((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100)+totalPrice}" type="number"
                                maxFractionDigits="2" roundingMode="HALF_DOWN" />
                </th>

        </tr>


    <tr>



    </tr>
</table >
<h3>Billing Information:</h3>
<table border="3px" width="50px"><tr><td>FirstName:${params.firstNameBilling}</td></tr><tr><td>LastName:${params.lastNameBilling}</td></tr><tr><td>Company Name:${params.companyNameBilling}</td></tr><tr><td>Contact_no1:${params.mobileOrPhoneCumpolsoryBilling}</td></tr><tr><td>Contact_no2:${params.mobileOrPhoneOptionalBilling}</td></tr><tr><td>E-mail:${params.email}</td></tr><tr><td>Address1:${params.cumpolsoryAddressBilling}</td></tr><tr><td>Address2:${params.optionalAddressBilling}</td></tr><tr><td>City:${params.cityBilling}</td></tr><tr><td>Customer Type:<g:if test="${session.endUser}">Returning or logged in Customer</g:if> <g:else>new customer or not logged in Customer</g:else></td></tr></table>

<h3>Delivery Information:</h3>
<table border="3px" width="50px"><tr><td>Delivery Method:${DeliveryMethod.get(params.delivery).briefDescribe}</td></tr><tr><td>Payment Method:${PaymentMethod.get(params.payment).briefDescribe}</td></tr><tr><td>Order notes:${params.orderNotesShipping}</td></tr></table>
<g:if test="${params.isShipping}">
<h3>Shipping To Address</h3>
    <table border="3px" width="50px"><tr><td>FirstName:${params.firstNameShipping}</td></tr><tr><td>LastName:${params.lastNameShipping}</td></tr><tr><td>Company Name:${params.companyNameShipping}</td></tr><tr><td>Address1:${params.cumpolsoryAddressShipping}</td></tr><tr><td>Address2:${params.optionalAddressShipping}</td></tr><tr><td>City:${params.cityShipping}</td></tr></table>

</g:if>
</body>
</html>
