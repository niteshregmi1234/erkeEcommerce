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

<script>
    $(function () {
        $("#accordion").accordion();
    });
</script>
<h1>Click to View Delivered Orders</h1>
<div id="accordion">
    <g:each in="${listListCartList}" var="list">
        <h3>Customer Name-${list[0].endUserInformation.firstName+" "+list[0].endUserInformation.lastName}&nbsp;&nbsp;Email-${list[0].endUserInformation.email}&nbsp;&nbsp;DateTime-${list[0].date}</h3>

        <div>
            <g:form action="deliveredToCustomer" controller="cartHistory">

                <div class="container">
                    <h3><u>Delivery Information</u></h3>
                    <table class="table">
                        <tbody>
                        <tr>
                            <th scope="row">Delivery Address</th>
                            <td>${list[0].deliveryAddress}</td>

                        </tr>
                        <tr>
                            <th scope="row">Payment Method</th>
                            <td>${list[0].paymentMethod.briefDescribe}</td>

                        </tr>
                        <tr>
                            <th scope="row">Delivery Method</th>
                            <td>${list[0].deliveryMethod.briefDescribe}</td>

                        </tr>
                        <tr>
                            <th scope="row">Mobile Number</th>
                            <td>${list[0].mobileNumber}</td>

                        </tr>

                        </tbody>
                    </table>
                    <h3><u>Orders List</u></h3>
                    <div class="table-responsive">

                        <table class="table table-bordered">
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
                                    <td>Rs.${list1.product.productDetails.price}</td>
                                    <td>${list1.product.productDetails.discountPercentage}%</td>
                                    <td>Rs.${(list1.product.productDetails.price*list1.quantity)-(list1.product.productDetails.discountPercentage*(list1.product.productDetails.price*list1.quantity)/100)}</td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>

                </div>
            </g:form>
            <script>
                function preventMultipleSubmissions() {
                    $('#submit_Id').prop('disabled', true);
                }

                window.onbeforeunload = preventMultipleSubmissions;
            </script>
            <style>
            .abc img{
                height: 40px;
                width: 30px;
            }
            .height {
                min-height: 200px;
            }

            .icon {
                font-size: 47px;
                color: #5CB85C;
            }

            .iconbig {
                font-size: 77px;
                color: #5CB85C;
            }

            .table > tbody > tr > .emptyrow {
                border-top: none;
            }

            .table > thead > tr > .emptyrow {
                border-bottom: none;
            }

            .table > tbody > tr > .highrow {
                border-top: 3px solid;
            }
            </style>

        </div>
    </g:each>

</div>

</body>
</html>