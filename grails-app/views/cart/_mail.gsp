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


    <g:each in="${Cart.findAllByEndUserInformation(session.endUser)}" var="list">
        <tr>

            <td>${list.product.productColor.colorName+" "+list.product.productDetails.productName+" "+list.product.productDetails.productBrand.brandName}
            </td>
            <td>${list.productSize.sizeName}</td>
            <td>
${list.quantity}

            </td>
            <td>Rs.${list.product.productDetails.price}</td>
            <td>${list.product.productDetails.discountPercentage}%</td>
            <td>Rs.${(list.product.productDetails.price*list.quantity)-(list.product.productDetails.discountPercentage*(list.product.productDetails.price*list.quantity)/100)}</td>
        </tr>
    </g:each>


<tr>

    <th>Total</th>
    <th>${""}</th>
    <th>${""}</th>
    <th>${""}</th>
    <th>${""}</th>

    <th>Rs.${totalPrice}</th>


</tr>
</table >
<h3>Delivery Information:</h3>
<table border="3px" width="50px"><tr><td>FirstName:${params.firstName}</td></tr><tr><td>LastName:${params.lastName}</td></tr><tr><td>Address:${params.address}</td></tr><tr><td>Contact_no:${params.phone}</td></tr><tr><td>Delivery Method:${DeliveryMethod.get(params.delivery).briefDescribe}</td></tr><tr><td>Payment Method:${PaymentMethod.get(params.payment).briefDescribe}</td></tr></table>

</body>
</html>
