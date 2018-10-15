<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/10/2017
  Time: 12:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"
          media="all"/>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="${resource(dir: 'js', file: 'yamsaa/jquery.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/jquery-1.11.0.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrapvalidator.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yamsaa/bootv3.5.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-multiselect.js')}" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-multiselect.css')}" type="text/css">

    <script src="${resource(dir: 'js', file: 'yamsaa/bootbox.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/jquery.dataTables.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery.dataTables.min.css')}" type="text/css"
          media="all"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-select.min.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-select.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <link rel="shortcut icon" href="${resource(dir: 'js', file: 'yarsaa/yarsaalogosmall.png')}">
    <script type="text/javascript"> //<![CDATA[
    var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
    document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
    //]]>
    </script>
    <title>Yarsaa</title>
    <style>
    li a:focus, .active {
        background-color: rgba(15, 13, 16, 0.99);
    }
    </style>

</head>
<body>
<div class="se-pre-con"></div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>
    //paste this code under the head tag or in a separate js file.
    // Wait for window load
    $(window).load(function() {
// Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });
</script>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/loader.css')}" type="text/css"
      media="all"/>
<noscript>

    <div class="modal-dialog ">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Java-Script not found!</h4>
            </div>
            <div class="modal-body">
                <p>Our page does not function properly without java-script.So,You must enable java-script to view this web-page.</p>
            </div>

        </div>
</div>


        <style type="text/css">

    #content {
        display: none;
    }
    </style>

</noscript>
<div id="content">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">Yarsaa</a>
        </div>
        <ul class="nav navbar-nav">
            <li><g:link action="adminHome" controller="adminHome">Home</g:link></li>
            <g:if test="${session.adminUser.role=="CEO" || session.adminUser.role=="MD"}">
            <li><g:link action="list" controller="adminUserInformation">Staffs</g:link></li>
            </g:if>
<g:if test="${session.adminUser.role=="CEO" || session.adminUser.role=="MD" || session.adminUser.role=="Content Manager"}">

    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button">Set Up<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="list" controller="productCategory">Product Category</g:link></li>
                    <li><g:link action="list" controller="productSubCategorySpecify">Specify Product SubCategory</g:link></li>
                    <li><g:link action="list" controller="productSubCategory">Product SubCategory</g:link></li>
                    <li><g:link action="list" controller="productColor">Product Color</g:link></li>
                    <li><g:link action="list" controller="productSize">Product Size</g:link></li>
                    <li><g:link action="list" controller="productBrand">Product Brand</g:link></li>
                    <li><g:link action="list" controller="paymentMethod">Payment</g:link></li>
                    <li><g:link action="list" controller="deliveryMethod">Delivery</g:link></li>
                    <li><g:link action="list" controller="seoOptimization">Seo Optimization</g:link></li>

                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button">Items<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="list" controller="productDetails">Product Details</g:link></li>
                    <li><g:link action="list" controller="product">Product</g:link></li>
                    <li><g:link action="list" controller="coverImage">Cover Image</g:link></li>
                    <li><g:link action="list" controller="aids">Advertisement</g:link></li>
                    <li><g:link action="show" controller="backgroundImage" >Home Background Image</g:link></li>
                    <li><g:link action="discountShortcut" controller="product" >Discount Shortcut</g:link></li>
                    <li><g:link action="latestShortcut" controller="product" >Change Latest Product?</g:link></li>

                </ul>
            </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button">Reset<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#" onclick="resetProductPriority();" >Product Priority</a></li>
            <li><a href="#" onclick="resetCoverImagePriority();">Cover Image Priority</a></li>
            <li><a href="#" onclick="resetBrandPriority();" >Brand Priority</a></li>

        </ul>
    </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button">Manage<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="show" controller="mailSetUp">SetUp Email</g:link></li>
                    <li><g:link action="show" controller="homeContent">Home Content</g:link></li>
                    <li><g:link action="show" controller="aboutUs">About Us</g:link></li>
                    <li><g:link action="show" controller="companyInformation">Company Information</g:link></li>
                    <li><g:link action="show" controller="otherCosts">Other Costs</g:link></li>
                    <li><g:link action="show" controller="style">Style</g:link></li>

                </ul>
            </li>
    </g:if>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button">Orders<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link action="recentOrders" controller="cartHistory">Recent Orders</g:link></li>
                    <li><g:link action="successFullOrders" controller="cartHistory">Successful Orders</g:link></li>
                    <li><g:link action="pendingOrders" controller="cartHistory">Pending Orders</g:link></li>


                </ul>
            </li>


            <li><g:link action="logout" controller="logout">Logout</g:link></li>


        </ul>
    </div>
</nav>
<script>
    function resetProductPriority() {
        bootbox.confirm("Are you sure want to reset Product Priority?", function(resultConfirm){
            if(resultConfirm){
                $.ajax({
                    url: "${createLink(controller:'product', action:'resetPriority')}",
                    type: "POST",
                    cache: false,
                    async: false,
                    success: function (result) {
                        if (result == "successfull") {
                            bootbox.alert({
                                message: "product priority has been successfully reset",
                                size: 'small',
                                callback: function(){
                                    location.reload();
                                }
                            });
                        }
                        else {
                            bootbox.alert({
                                message: "unable to reset product priority",
                                size: 'small'
                            });



                            // DataTable


                        }

                    }
                });
            }

        });

    }
    function resetCoverImagePriority() {

        bootbox.confirm("Are you sure want to reset Cover Image Priority?", function(resultConfirm){
            if(resultConfirm){
                $.ajax({
                    url: "${createLink(controller:'coverImage', action:'resetPriority')}",
                    type: "POST",
                    cache: false,
                    async: false,
                    success: function (result) {
                        if (result == "successfull") {
                            bootbox.alert({
                                message: "coverImage priority has been successfully reset",
                                size: 'small',
                                callback: function(){
                                    location.reload();
                                }
                            });

                        }
                        else {
                            bootbox.alert({
                                message: "unable to reset CoverImage priority",
                                size: 'small'
                            });



                            // DataTable


                        }

                    }
                });

            }

        });
    }
    function resetBrandPriority() {
        bootbox.confirm("Are you sure want to reset Product Brand Priority?", function(resultConfirm){
            if(resultConfirm){
                $.ajax({
                    url: "${createLink(controller:'productBrand', action:'resetPriority')}",
                    type: "POST",
                    cache: false,
                    async: false,
                    success: function (result) {
                        if (result == "successfull") {
                            bootbox.alert({
                                message: "productBrand priority has been successfully reset",
                                size: 'small',
                                callback: function(){
                                    location.reload();
                                }
                            });

                        }
                        else {
                            bootbox.alert({
                                message: "unable to reset brand priority",
                                size: 'small'
                            });



                            // DataTable


                        }

                    }
                });

            }

        });
          }

    $(function () {

        var url = window.location.pathname;
        var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");// now grab every link from the navigation
        $('li a').each(function () {
            // and test its normalized href against the url pathname regexp
            if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
                $(this).addClass('active');
            }
        });

    });
</script>

<div class="container">
    <g:layoutBody/>
</div>
</div>

</body>
</html>