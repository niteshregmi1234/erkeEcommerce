<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="keywords" content="">
    <meta name="google-site-verification" content="ukYH3gaQ4LcRA-6yCKNwKZGIv2FKj6l8WubNurI13mc"/>
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta name="description" content="Yarsaa online shopping for young generations and youths.You can have amazing shopping through our shop.">
    <meta name="author" content="Anoj And Bikash">

    <g:if test="${productInstance}">
        <meta property="og:image" content="https://www.yarsaa.com/imageRender/renderImage?imageName=${productInstance.specialImageName}"/>

    </g:if>
<g:if test="${title}">
    <title>${title}</title>
</g:if>
    <g:else>
        <title>yarsaa</title>
    </g:else>
    <link href='//fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>
    %{--<link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>--}%

    <!-- styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/font-awesome.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/bootstrap.min.css')}" type="text/css"
          media="all"/>

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" id="bootstrap-css">


    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/iframex.css')}" type="text/css"
          media="all"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/animate.min.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/owl.carousel.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/owl.theme.css')}" type="text/css"
          media="all"/>
    <g:if test="${StyleManagement.list()[0]}">
        <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"${"style."+StyleManagement.list()[0].style.name+".css"}")}" type="text/css"
              media="all"/>
    </g:if>
    <g:if test="${StyleManagement.list()[0]==null}">
        <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"style.default.css")}" type="text/css"
              media="all"/>
    </g:if>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/custom.css?v=1.5')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/loader.css')}" type="text/css"
          media="all"/>

    <script src="${resource(dir: 'js', file: 'yarsaa/respond.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yarsaa/jquery-1.11.0.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/loadash.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/list.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yarsaa/list.pagination.min.js')}" type="text/javascript"
            charset="utf-8"></script>


    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrapvalidator.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/bootv3.5.min.js')}" type="text/javascript"
            charset="utf-8"></script>


    <script src="${resource(dir: 'js', file: 'yamsaa/bootbox.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yarsaa/jquery.cookie.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/waypoints.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/modernizr.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/bootstrap-hover-dropdown.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/owl.carousel.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/front.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/lazyLoad.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/jquery.elevateZoom-3.0.8.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/fancybox.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/fancybox.min.css')}" type="text/css"
          media="all"/>

    <link rel="shortcut icon" href="${resource(dir: 'js', file: 'yarsaa/yarsaalogosmall.png')}">
</head>

<body>


<noscript>

    <div id="content" style="margin:20px;">
        <div class="container">

            <div class="col-md-12">
                <div class="row" id="error-page">
                    <div class="col-sm-6 col-sm-offset-3">
                        <div class="box">
                            <p class="text-center">

                            </p>

                            <h3>JavaScript not found</h3>


                        </div>
                    </div>
                </div>


            </div>
            <!-- /.col-md-9 -->
        </div>
        <!-- /.container -->
    </div>


    <style type="text/css">
    #total {
        display: none;
    }
    </style>

</noscript>

<div id="total">

    <div id="top">
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content" id="loginReset">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="closeLoginModal();" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">Customer login</h4>
                    </div>


                    <div class="modal-body">
                        <form method="post" onsubmit="return loginValid();">
                            <small style="color: #a94442; display: none;" id="error" >email or password does not exist</small>
                            <g:hiddenField name="sizeIdLogin" id="sizeIdLogin" value=""></g:hiddenField>

                            <g:hiddenField name="productIdLogin" id="productIdLogin" value=""></g:hiddenField>

                            <div class="form-group">
                                <input type="text" class="form-control" id="login_email" placeholder="email">
                                <small style="color: #a94442; display: none;" id="login_emailBlank">
                                    Please supply your email</small>
                                <small style="color: #a94442; display: none;" id="login_emailInvalid">
                                    Invalid email Address</small>

                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="login_password" placeholder="password">
                                <small style="color: #a94442; display: none;" id="login_passwordBlank">
                                    Please supply your password</small>
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                            </p>

                        </form>

                        <p class="text-center text-muted">Not registered yet?</p>
                        <p class="text-center text-muted"><g:link action="register" controller="endUserInformation"><strong>Register now</strong></g:link>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var modal = document.getElementById('login-modal');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                $('#loginReset').load(document.URL +  ' #loginReset');
            }
        }
        function closeLoginModal(){
            $('#loginReset').load(document.URL +  ' #loginReset');
        }
        function loginValid(){
            var responseValue;
            var emailAddress= $("#login_email").val();
            var array = [];
            array[0] = $("#login_email").val();
            array[1] = $("#login_password").val();
            if(array[0]==''){
                $('#login_emailInvalid').hide();
                $("#login_email").css("border", "1px solid #a94442");
                $('#login_emailBlank').show();
                document.getElementById("login_email").focus();
                responseValue=false;
            }
            if(emailAddress!=''){
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if(!emailAddress.match(re)){
                    $("#login_email").css("border", "1px solid #a94442");
                    $('#login_emailBlank').hide();
                    $('#login_emailInvalid').show();
                    document.getElementById("login_email").focus();
                    return false;
                }}
            if(array[1]==''){
                $("#login_password").css("border", "1px solid #a94442");
                $('#login_passwordBlank').show();
                document.getElementById("login_password").focus();
                responseValue=false;
            }
            else {
                $.ajax({
                    url: "${createLink(controller:'endUserInformation', action:'checkLogin')}",
                    type : 'POST',
                    dataType: 'json',
                    data: { "array": JSON.stringify(array) },
                    async : false,
                    success: function(result) {
                        if(result==false){
                            $('#login_passwordBlank').hide();
                            $('#login_emailBlank').hide();
                            $('#login_emailInvalid').hide();
                            $('#error').show();
                            responseValue=false;
                        }
                        else if(result==true){
                            var  sizeId=document.getElementById("sizeIdLogin").value;
                            var productId=document.getElementById("productIdLogin").value ;
                            if(sizeId=='' && productId==''){
                                bootbox.alert({
                                    message: "successfully logged in.",
                                    size: 'small',
                                    callback: function(){
                                        location.reload();
                                    }
                                });
                                $('#login-modal').modal('toggle');
                                responseValue=false;
                            }
                            else{
                                $('#login-modal').modal('toggle');
                                document.getElementById("sizeIdLogin").value ="";
                                document.getElementById("productIdLogin").value ="";
                                var array = [];
                                array[0]=sizeId;
                                array[1]=productId;
                                $.ajax({
                                    url: "${createLink(controller:'cart', action:'checkAddToCart')}",
                                    type: "POST",
                                    data: { "array": JSON.stringify(array) },
                                    async : false,
                                    cache:false,
                                    success: function(result) {
                                        if(result=="ok"){
                                            bootbox.alert({
                                                message: "successfully added to cart.",
                                                size: 'small',
                                                callback: function(){
                                                    $('#cartShow').load(document.URL +  ' #cartShow');
                                                    $('#logoutClass').load(document.URL +  ' #logoutClass');
                                                }
                                            });
                                            responseValue=false;
                                        }
                                        else if(result=="notOk"){
                                            $('#login-modal').modal('toggle');
                                            document.getElementById("sizeIdLogin").value = sizeId;
                                            document.getElementById("productIdLogin").value = productId;
                                        }
                                    }
                                });
                            }
                        }
                    }
                });
            }
            return responseValue;
        }
        function logoutUser(){
            var responseValue;
            $.ajax({
                url: "${createLink(controller:'endUserInformation', action:'logout')}",
//                type : 'POST',
                async : false,
                success: function(result) {
                    if(result=="logoutUnSuccess"){
                        bootbox.alert({
                            message: "not logged in to log out.",
                            size: 'small',
                            callback: function(){
                                location.reload();
                            }
                        });
                        responseValue=false;
                    }
                    else if(result=="logoutSuccess"){
                        bootbox.alert({
                            message: "successfully logged out.",
                            size: 'small',
                            callback: function(){
                                location.reload();
                            }
                        });
                        responseValue=false;
                    }
                }
            });
        }
    </script>




    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <g:link class="navbar-brand home "  action="userHome" controller="endUser" data-animate-hover="bounce">
                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:CompanyInformation.list()[0].logoImageName])}" class="hidden-xs">

                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:CompanyInformation.list()[0].logoImageName])}" alt="yarsaa logo" class="visible-xs"><span class="sr-only">Home</span>
                </g:link>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <g:link class="btn btn-default navbar-toggle" action="cart" controller="cart">
                        <g:if test="${session.cart}">
                            <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">${session.cart.size()} items in cart</span>
                        </g:if>
                        <g:else>
                            <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">0 items in cart</span>

                        </g:else>
                    </g:link>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active menuBar"><g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="categoryList">
                        <g:if test="${Product.findByProductDetails(ProductDetails.findByProductCategory(categoryList))}">

                            <li class="dropdown yamm-fw">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${categoryList.categoryName}<b class="caret"></b></a href="#">
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="yamm-content" style="height:400px;overflow-y: scroll;">
                                            <div class="row">
                                                <g:each in="${ProductSubCategorySpecify.list()}" var="specifyList">
                                                    <%
                                                        def subCategoryList1=ProductSubCategory.findAllByProductSubCategorySpecify(specifyList)
                                                        def productList=new ArrayList<>()
                                                        for(ProductSubCategory productSubCategory: subCategoryList1){
                                                            def product=Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductSubCategoryAndProductCategory(productSubCategory,categoryList),false)
                                                            if(product){
                                                                productList.add(product)
                                                            }
                                                        }
                                                    %>
                                                    <g:if test="${productList}">
                                                        <div class="col-sm-3">
                                                            <g:link action="specifiedProducts" params="[category:categoryList.urlName,subCategorySpecify:specifyList.urlName]" controller="endUser"> <h5>${specifyList.specificationName}</h5></g:link>
                                                            <ul>
                                                                <g:each in="${ProductSubCategory.findAllByProductSubCategorySpecifyAndStatusShow(specifyList,true)}" var="subCategoryList">
                                                                    <g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(categoryList,subCategoryList),false)}">
                                                                        <li><g:link controller="endUser" action="subCategoryList"  params="[category:categoryList.urlName,subCategorySpecify: subCategoryList.productSubCategorySpecify.urlName, subCategory:subCategoryList.urlName]">${subCategoryList.subCategoryName}</g:link>
                                                                        </li>
                                                                    </g:if>
                                                                </g:each>
                                                            </ul>
                                                        </div>
                                                    </g:if>
                                                </g:each>
                                            %{--<div class="col-sm-3">--}%
                                            %{--<div class="banner">--}%
                                            %{--<g:link action="allCategoryProducts" controller="endUser" id="${categoryList.categoryId}">--}%
                                            %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:categoryList.menuImage1])}" class="img-responsive">--}%


                                            %{--</g:link>--}%
                                            %{--</div>--}%

                                            %{--<div class="banner">--}%
                                            %{--<g:link action="allCategoryProducts" controller="endUser" id="${categoryList.categoryId}">--}%
                                            %{--<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:categoryList.menuImage2])}" class="img-responsive">--}%

                                            %{--</g:link>--}%
                                            %{--</div>--}%


                                            %{--</div>--}%

                                            %{--<div class="col-sm-3">--}%
                                            %{--<h5>Featured</h5>--}%
                                            %{--<ul>--}%
                                            %{--<li><a href="category.html">Trainers</a>--}%
                                            %{--</li>--}%
                                            %{--<li><a href="category.html">Sandals</a>--}%
                                            %{--</li>--}%
                                            %{--<li><a href="category.html">Hiking shoes</a>--}%
                                            %{--</li>--}%
                                            %{--</ul>--}%
                                            %{--<h5>Looks and trends</h5>--}%
                                            %{--<ul>--}%
                                            %{--<li><a href="category.html">Trainers</a>--}%
                                            %{--</li>--}%
                                            %{--<li><a href="category.html">Sandals</a>--}%
                                            %{--</li>--}%
                                            %{--<li><a href="category.html">Hiking shoes</a>--}%
                                            %{--</li>--}%
                                            %{--</ul>--}%
                                            %{--</div>--}%
                                            </div>
                                        </div>
                                        <!-- /.yamm-content -->
                                    </li>
                                </ul>
                            </li>
                        </g:if>
                    </g:each>

                    <li class="menuBar"><g:link action="about" controller="endUser">About</g:link></li>

                </ul>

            </div>
            <script>
                $(document).ready(function() {
                    $('li.menuBar').removeClass('active');
                    $('a[href="' + location.pathname + '"]').closest('li').addClass('active');
                });
            </script>
            <style>
            .dropbtn {
                cursor: pointer;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 100px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 3;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {background-color: #f1f1f1;
                color:#4fbfa8;
                text-decoration: none;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }
            .dropdown:hover .dropbtn {
            }
            </style>
            <!--/.nav-collapse -->
            <div class="navbar-buttons">



                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right dropdown">
                    <button type="button" class="btn navbar-btn btn-primary dropbtn">
                        My Account
                    </button>
                    <div class="dropdown-content" id="logoutClass">
                        <g:if test="${session.endUser==null}">
                            <a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                        </g:if>
                        <g:if test="${session.endUser}"><a href="#" onclick="logoutUser();">Logout</a>

                            <g:link action="myProfile" controller="endUserInformation">My Profile</g:link>

                        </g:if>
                        <g:link action="register" controller="endUserInformation">Register</g:link>




                    </div>
                </div>

            </div>

            <div class="navbar-buttons" id="cartShow">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    <g:if test="${session.cart}">
                        <g:link action="cart" controller="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">${session.cart.size()} items in cart</span></g:link>
                    </g:if>
                    <g:else>
                        <g:link action="cart" controller="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">0 items in cart</span></g:link>
                    </g:else>
                </div>
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse" id="search-not-mobile">
                    <g:form controller="endUser" action="search" class="" role="search" onsubmit="return validSearch();">
                        <div class="input-group">
                            <input type="text" class="form-control" id="searchProduct" name="search" placeholder="Search by product,category,brand wise..." value="${params?.q}">

                            <span class="input-group-btn">

                                <button type="submit" class="btn btn-primary" id="submit_Id"><i class="fa fa-search"></i></button>

                            </span>

                        </div>
                    </g:form>
                </div>

            </div>

            <div class="collapse clearfix" id="search">

                <g:form controller="endUser" action="search" class="navbar-form" role="search" onsubmit="return validSearch();">
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchProduct" name="search" placeholder="Search by product,category,brand wise..." value="${params?.q}">

                        <span class="input-group-btn">

                            <button type="submit" class="btn btn-primary" id="submit_Id"><i class="fa fa-search"></i></button>

                        </span>

                    </div>
                </g:form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->

    <script type="text/javascript">
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }
        window.onbeforeunload = preventMultipleSubmissions;
        function validSearch(){
            var searchKey=document.getElementById("searchProduct").value;
            if(searchKey==''){
                bootbox.alert({
                    message: "Please enter search keyword",
                    size: 'small'
                });
                $('#searchProduct').focus();
                return false;
            }
        }
    </script>

    <div id="all">

        <g:layoutBody>

        </g:layoutBody>
        <script>
            $(function() {
                $('.lazy').lazy();
            });
            $("body").click(function() {
                var allimages= document.getElementsByTagName('img');
                for (var i=0; i<allimages.length; i++) {
                    if (allimages[i].getAttribute('data-src')) {
                        allimages[i].setAttribute('src', allimages[i].getAttribute('data-src'));
                    }
                }
            });
            document.addEventListener('touchstart', handleTouchStart, false);
            document.addEventListener('touchmove', handleTouchMove, false);
            function handleTouchStart() {
                var allimages= document.getElementsByTagName('img');
                for (var i=0; i<allimages.length; i++) {
                    if (allimages[i].getAttribute('data-src')) {
                        allimages[i].setAttribute('src', allimages[i].getAttribute('data-src'));
                    }
                }
            }
            function handleTouchMove() {
                var allimages= document.getElementsByTagName('img');
                for (var i=0; i<allimages.length; i++) {
                    if (allimages[i].getAttribute('data-src')) {
                        allimages[i].setAttribute('src', allimages[i].getAttribute('data-src'));
                    }
                }
            }
        </script>

        <!-- /#content -->

        <!-- *** FOOTER ***
 _________________________________________________________ -->
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <h4>Pages</h4>

                        <ul>
                            <li><g:link action="about" controller="endUser">About us</g:link>
                            </li>
                            %{--<li><a href="text.html">Terms and conditions</a>--}%
                            %{--<li><a href="faq.html">FAQ</a>--}%
                            %{--</li>--}%
                            <li><g:link action="contact" controller="endUser">Contact us</g:link>
                            </li>
                        </ul>

                        <hr>

                        <h4>User section</h4>

                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                            </li>
                            <li><g:link action="register" controller="endUserInformation">Register</g:link>
                            </li>
                        </ul>

                        <hr class="hidden-md hidden-lg hidden-sm">

                    </div>
                    <!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">

                        <h4>Top categories</h4>
                        <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="categoryList">
                            <g:if test="${Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductCategory(categoryList),false)}">

                                <h5>${categoryList.categoryName}</h5>

                                <ul>
                                    <g:each in="${ProductSubCategory.findAllByIsFooterAndStatusShow(true,true)}" var="subCategoryList">
                                        <g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(categoryList,subCategoryList),false)}">

                                            <li><g:link action="subCategoryList" controller="endUser" params="[category:categoryList.urlName,subCategorySpecify: subCategoryList.productSubCategorySpecify.urlName,subCategory: subCategoryList.urlName]">${subCategoryList.subCategoryName}</g:link>
                                            </li>
                                        </g:if>
                                    </g:each>

                                </ul>
                            </g:if>
                        </g:each>


                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">

                        <h4>Related Products</h4>
                        <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="categoryList">
                            <g:if test="${Product.findByProductDetailsAndDelFlag(ProductDetails.findByProductCategory(categoryList),false)}">

                                <h5>${categoryList.categoryName}</h5>

                                <ul>
                                    <g:each in="${ProductSubCategory.findAllByIsFooterAndStatusShow(true,true)}" var="subCategoryList">
                                        <g:if test="${Product.findAllByProductDetailsAndDelFlag(ProductDetails.findByProductCategoryAndProductSubCategory(categoryList,subCategoryList),false)}">

                                            <li><g:link action="subCategoryList" controller="endUser" params="[category:categoryList.urlName,subCategorySpecify: subCategoryList.productSubCategorySpecify.urlName,subCategory: subCategoryList.urlName]">${subCategoryList.subCategoryName}</g:link>
                                            </li>
                                        </g:if>
                                    </g:each>

                                </ul>
                            </g:if>
                        </g:each>


                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">

                        <h4>Where to find us</h4>

                        <p style="color: #eee;"><strong>${CompanyInformation.list()[0].companyName}.</strong>

                            <br>${CompanyInformation.list()[0].location1}
                            <br>${CompanyInformation.list()[0].location2}
                            <br>${CompanyInformation.list()[0].location3}

                            <br>
                            <strong >${CompanyInformation.list()[0].location4}</strong>
                        </p>

                        <g:link action="contact" controller="endUser">Go to contact page</g:link>

                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->



                    %{--<div class="col-md-3 col-sm-6">--}%

                    %{--<h4>Get the news</h4>--}%

                    %{--<p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>--}%

                    %{--<form>--}%
                    %{--<div class="input-group">--}%

                    %{--<input type="text" class="form-control">--}%

                    %{--<span class="input-group-btn">--}%

                    %{--<button class="btn btn-default" type="button">Subscribe!</button>--}%

                    %{--</span>--}%

                    %{--</div>--}%
                    %{--<!-- /input-group -->--}%
                    %{--</form>--}%

                    %{--<hr>--}%

                    %{--<h4>Stay in touch</h4>--}%

                    %{--<p class="social">--}%
                    %{--<a href="#" class="facebook external" data-animate-hover="shake"><i class="fa fa-facebook"></i></a>--}%
                    %{--<a href="#" class="twitter external" data-animate-hover="shake"><i class="fa fa-twitter"></i></a>--}%
                    %{--<a href="#" class="instagram external" data-animate-hover="shake"><i class="fa fa-instagram"></i></a>--}%
                    %{--<a href="#" class="gplus external" data-animate-hover="shake"><i class="fa fa-google-plus"></i></a>--}%
                    %{--<a href="#" class="email external" data-animate-hover="shake"><i class="fa fa-envelope"></i></a>--}%
                    %{--</p>--}%


                    %{--</div>--}%
                    <!-- /.col-md-3 -->

                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#footer -->

        <!-- *** FOOTER END *** -->




        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->

        <div id="copyright">
            <div class="container">
                <div class="col-md-6">
                    <p class="pull-left">© <g:formatDate format="yyyy" date="${new Date()}"/>.</p>

                </div>
                <div class="col-md-6">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="https://www.facebook.com/OnlineYarsa/" type="button" class="btn btn-primary"><i class="fa fa-facebook"></i></a>
                        <a href="https://www.pinterest.com/yarsaa/" type="button" class="btn btn-primary"><i class="fa fa-pinterest"></i></a>
                        <a href="https://www.instagram.com/yarsaa/" type="button" class="btn btn-primary"><i class="fa fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/in/yarsaa-online-1017b6171/" type="button" class="btn btn-primary"><i class="fa fa-linkedin"></i></a>
                        <a href="https://www.youtube.com/channel/UCJv3WpkW_BnYha1aKmSEdUQ" type="button" class="btn btn-primary"><i class="fa fa-youtube"></i></a>
                    </div>
                    <p class="pull-right">ALL RIGHTS RESERVED BY ONLINE YARSAA
                    <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                    </p>
                </div>
            </div>
        </div>


        <div class="bootbox modal fade bootbox-confirm in" id="messageModelCart" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="cartSuccessful" id="cartSuccessful">Product Successfully Added To Shopping Cart</div>
                        <div class="cartSuccessful" id="cartDelete" style="display: none;">Product Successfully removed from cart</div>
                        <div class="cartSuccessful" id="cartUnableToDelete" style="display: none;color:rgb(169, 68, 66);">Sorry,unable to perform delete operation</div>

                        <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>

                        <table id="cart" class="table table-fixed">

                            <tbody>
                            <g:each in="${session.cart}" var="list" status="i">
                                <tr><td data-th="Product">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-5">
                                            <img src="/imageRender/renderImage?imageName=${list.product.specialImageName}" alt="..." class="img-responsive" />
                                        </div>
                                        <div class="col-sm-4 col-xs-5">
                                            <div class="popUpText" style="margin-top: 90px;">
                                                <div class="productDescription">${list.productDetails.briefDescription}<br>
                                                    Size-${list.productSize.sizeName}<br>
                                                    Qty-${list.quantity}

                                                </div>
                                                <br>
                                                <p class="price priceWithDiscount" style="text-align:left;color:#202020;font-weight: 400;font-size: 14px;margin-top:-15px;width: 135px;word-wrap: break-word;">Price-Rs.<g:formatNumber number="${list.productDetails.price-(list.productDetails.discountPercentage*list.productDetails.price/100)}" type="number" maxFractionDigits="2" />
                                                    <br>
                                                    <g:if test="${list.productDetails.isSale}">
                                                        <del class="del-price" style="font-size: 13px;font-weight: 400;color: #606060;">Rs.<g:formatNumber number="${list.productDetails.price}" type="number" maxFractionDigits="2" />
                                                        </del>
                                                    </g:if>
                                                </p>
                                                <br>
                                                <g:if test="${list.productDetails.isSale}">

                                                    <div class="discountBox1">-${list.productDetails.discountPercentage}%</div>
                                                </g:if>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-2 ">
                                            <button class="btn btn-danger btn-sm deleteCartFromPopUp" style="margin-top: 208px;" onclick="deleteProductFromPopUp(${i},${list.product.id},${list.productSize.id},this);"><i class="fa fa-trash-o"></i></button>
                                        </div>
                                    </div>
                                </td>
                                </tr>

                            </g:each>


                            </tbody>

                        </table>
                        <div class="row">
                            <div class="col-sm-9 col-xs-7">
                                <a data-dismiss="modal" class="btn btn-default"><i class="fa fa-angle-left"></i> Continue Shopping</a>
                            </div>
                            <div class="col-sm-3 col-xs-5" id="checkOutFromPopUp">
                                <g:link action="cart" controller="cart" class="btn btn-success" >Checkout<i class="fa fa-angle-right"></i></g:link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bootbox modal fade bootbox-confirm in" id="messageModelCartEmpty" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
                        <table class="table">
                            <tbody>
                            <tr><td class="noItem" style="font-size: 30px;">Your cart is empty. Continue shopping!!!!</td></tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-sm-9 col-xs-7">
                                <a data-dismiss="modal" class="btn btn-default"><i class="fa fa-angle-left"></i> Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/customCssTable.css')}" type="text/css"
      media="all"/>
<script>
    function deleteProductFromPopUp(index,productId,productSizeId,evt){
        var idList=[index,productId,productSizeId];
        $.ajax({
            url: "${createLink(controller:'cart', action:'delete')}",
            global: false,
            type: "POST",
            data: { "idList": JSON.stringify(idList) },
            cache: false,
            async: false,
            success: function (text) {
                if(text=="cartEmpty"){
                    $('.hidden-sm').load(document.URL + ' .hidden-sm');
                    $('#cart').load(document.URL +  ' #cart');
                    $('#cartShow').load(document.URL +  ' #cartShow');
                    $('#cartSuccessful').hide();
                    $('#cartDelete').hide();
                    $('#checkOutFromPopUp').hide();
                    $('#cartUnableToDelete').show();
                    $('#messageModelCart').modal('toggle');
                    $('#messageModelCartEmpty').modal('toggle');
                }
                else if(text[5]=="yes"){
                    $('.hidden-sm').load(document.URL + ' .hidden-sm');
                    $('#cart').load(document.URL +  ' #cart');
                    $('#cartShow').load(document.URL +  ' #cartShow');
                    $('#cartSuccessful').hide();
                    $('#cartUnableToDelete').hide();
                    $('#cartDelete').show();
                    $('#checkOutFromPopUp').show();
                    if(text[6]==0){
                        $('#checkOutFromPopUp').hide();
                        $('#messageModelCart').modal('toggle');
                        $('#messageModelCartEmpty').modal('toggle');
                    }
                    else if(text[6]>0){
                        $('#checkOutFromPopUp').show();
                    }
                }
                else if(text[5]=="no"){
                    $('.hidden-sm').load(document.URL + ' .hidden-sm');
                    $('#cart').load(document.URL +  ' #cart');
                    $('#cartShow').load(document.URL +  ' #cartShow');
                    $('#cartSuccessful').hide();
                    $('#cartDelete').hide();
                    $('#cartUnableToDelete').show();
                    $('#checkOutFromPopUp').show();
                    if(text[6]==0){
                        $('#checkOutFromPopUp').hide();
                        $('#messageModelCart').modal('toggle');
                        $('#messageModelCartEmpty').modal('toggle');
                    }
                    else{
                        $('#checkOutFromPopUp').show();
                    }
                }
            }
        });
        evt.preventDefault();
    }
</script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>

</html>