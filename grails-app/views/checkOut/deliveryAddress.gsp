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
                    <li>Checkout - Address</li>
                </ul>
            </div>

            <div class="col-md-9" id="checkout">

                <div class="box">
                    <g:form method="post" action="deliveryMethod" controller="checkOut">
                        <h1>Checkout</h1>
                        <ul class="nav nav-pills nav-justified">
                            <li class="active"><a href="#"><i class="fa fa-map-marker"></i><br>Address</a>
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
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">

                                            <label for="firstName">First Name</label>

                                            <input type="text" name="firstName" class="form-control" id="firstName">
                                    </div>
                                        </div>
                                </div>
                            </div>
                            <div class="col-sm-12">&nbsp;
</div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">

                                            <label for="lastName">Last Name</label>

                                            <input type="text" name="lastName" class="form-control" id="lastName">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">&nbsp;
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">

                                            <label for="deliverAddress">Delivery Address</label>

                                            <input type="text" name="deliveryAddress" class="form-control" id="deliverAddress">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">&nbsp;
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">

                                            <label for="mobile">Mobile/phone</label>

                                            <input type="text" name="mobile" class="form-control" id="mobile">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">&nbsp;
                            </div>


                            <!-- /.row -->

                            <!-- /.row -->
                        </div>

                        <div class="box-footer">
                            <div class="pull-left">
                                <g:link action="cart" controller="cart" class="btn btn-default"><i class="fa fa-chevron-left"></i>Back to basket</g:link>
                            </div>
                            <div class="pull-right">
                                <button type="submit" class="btn btn-primary">Continue to Delivery Method<i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>
                <!-- /.box -->


            </div>
            <!-- /.col-md-9 -->

            <div class="col-md-3">

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
                                <th>$446.00</th>
                            </tr>
                            <tr>
                                <td>Shipping and handling</td>
                                <th>$10.00</th>
                            </tr>
                            <tr>
                                <td>Tax</td>
                                <th>$0.00</th>
                            </tr>
                            <tr class="total">
                                <td>Total</td>
                                <th>$456.00</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
            <!-- /.col-md-3 -->

        </div>
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