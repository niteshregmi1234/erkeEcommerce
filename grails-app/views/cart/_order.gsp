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
<h3>Message sent by: yarsaa online pvt. Ltd.,Mitrapark,Chabhil,Kathmandu</h3>
<h3>Contact No:014488486/9849408344</h3>
<h3>email:yarsaa2017@gmail.com</h3>
<h3>Product</h3>
<table border="3px" width="50px">
    <tr>
        <th>Product</th>
        <th>Color</th>
        <th>Size</th>
        <th>Quantity</th>

    </tr>


        <tr>

            <td>${cartWithoutEndUser.productDetails.productName+" "+cartWithoutEndUser.productBrand.brandName}
            </td>
            <td>${cartWithoutEndUser.productColor.colorName}</td>
            <td>${cartWithoutEndUser.productSize.sizeName}</td>
            <td>
                ${cartWithoutEndUser.quantity}

            </td>


        </tr>


    %{--<tr>--}%

        %{--<th>Total</th>--}%
        %{--<th>${""}</th>--}%
        %{--<th>${""}</th>--}%
        %{--<th>${""}</th>--}%
        %{--<th>${""}</th>--}%

        %{--<th>Rs.<g:formatNumber number="${totalPrice}" type="number"--}%
                               %{--maxFractionDigits="2" roundingMode="HALF_DOWN" />--}%
        %{--</th>--}%
    %{--</tr>--}%
</table >
%{--<table border="3px" width="50px">--}%
    %{--<tr>--}%
        %{--<th>Pre-Total</th>--}%
        %{--<th>Shipping And Handling</th>--}%
        %{--<th>Tax</th>--}%
        %{--<th>Total</th>--}%
    %{--</tr>--}%


    %{--<tr>--}%
        %{--<th>Rs.<g:formatNumber number="${totalPrice}" type="number"--}%
                               %{--maxFractionDigits="2" roundingMode="HALF_DOWN" />--}%
        %{--</th>--}%

        %{--<th>Rs.<g:formatNumber number="${OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100}" type="number"--}%
                               %{--maxFractionDigits="2" roundingMode="HALF_DOWN" />--}%
        %{--</th>--}%
        %{--<th>Rs.<g:formatNumber number="${(((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100}" type="number"--}%
                               %{--maxFractionDigits="2" roundingMode="HALF_DOWN" />--}%
        %{--</th>--}%
        %{--<th>Rs.<g:formatNumber number="${(OtherCosts.list()[0].shippingAndHandlingPercentage*totalPrice/100)+((((OtherCosts.list()[0].shippingAndHandlingPercentage)*totalPrice/100)+totalPrice)*OtherCosts.list()[0].taxPercentage/100)+totalPrice}" type="number"--}%
                               %{--maxFractionDigits="2" roundingMode="HALF_DOWN" />--}%
        %{--</th>--}%

    %{--</tr>--}%


    %{--<tr>--}%



    %{--</tr>--}%
%{--</table >--}%

%{--<h3>Billing Information:</h3>--}%
%{--<table border="3px" width="50px"><tr><td>FirstName:${billingInfo[0]}</td></tr><tr><td>LastName:${billingInfo[1]}</td></tr><tr><td>Company Name:${billingInfo[2]}</td></tr><tr><td>Contact_no1:${billingInfo[3]}</td></tr><tr><td>Contact_no2:${billingInfo[4]}</td></tr><tr><td>E-mail:${billingInfo[5]}</td></tr><tr><td>Address1:${billingInfo[6]}</td></tr><tr><td>Address2:${billingInfo[7]}</td></tr><tr><td>City:${billingInfo[8]}</td></tr><tr><td>Customer Type:<g:if test="${session.endUser}">Returning or logged in Customer</g:if> <g:else>new customer or not logged in Customer</g:else></td></tr></table>--}%

%{--<h3>Delivery And Payment Information:</h3>--}%
%{--<table border="3px" width="50px"><tr><td>Delivery Method:${DeliveryMethod.findByIsShowStatusAndId(true,params.delivery as long).briefDescribe}</td></tr><tr><td>Payment Method:${PaymentMethod.findByIsShowStatusAndId(true,params.payment as long).briefDescribe}</td></tr><tr><td>Order notes:${params.orderNotes}</td></tr></table>--}%
%{--<g:if test="${shippingInfo}">--}%
    %{--<h3>Shipping To Address</h3>--}%
    %{--<table border="3px" width="50px"><tr><td>FirstName:${shippingInfo[0]}</td></tr><tr><td>LastName:${shippingInfo[1]}</td></tr><tr><td>Company Name:${shippingInfo[2]}</td></tr><tr><td>Mobile No:${shippingInfo[3]}</td></tr><tr><td>Address1:${shippingInfo[4]}</td></tr><tr><td>Address2:${shippingInfo[5]}</td></tr><tr><td>City:${shippingInfo[6]}</td></tr></table>--}%

%{--</g:if>--}%
</body>
</html>
