<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">
    <meta name="google-site-verification" content="yFlo6Uspjm1tOF27VK5uKuiAs9_i9sCkqM1A049MKu4" />
    <title>
        Yarsaa
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/font-awesome.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/bootstrap.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/iframex.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/animate.min.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/owl.carousel.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/owl.theme.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"${"style."+StyleManagement.list()[0].style.name+".css"}")}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/custom.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'yarsaa/typeahead.css')}" type="text/css"
      media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'yarsaa/typeahead.scss')}" type="text/css"
      media="all"/>

    <script src="${resource(dir: 'js', file: 'yarsaa/respond.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yarsaa/jquery-1.11.0.min.js')}" type="text/javascript"
            charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yarsaa/jquery.elevateZoom-3.0.8.min.js')}" type="text/javascript"
        charset="utf-8"></script>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/bootstrap.min.js')}" type="text/javascript"
            charset="utf-8"></script>
<script src="${resource(dir: 'js', file: 'yarsaa/typeahead.js')}" type="text/javascript"
        charset="utf-8"></script>

%{--<script src="${resource(dir: 'js', file: 'yarsaa/jquery.typeahead.js')}" type="text/javascript"--}%
        %{--charset="utf-8"></script>--}%

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

    <link rel="shortcut icon" href="${resource(dir: 'js', file: 'yarsaa/favicon.png')}">

<script>
    $(window).bind('scroll', function () {
        if ($(window).scrollTop() > 50) {
            $('.menu2').addClass('fixed');
        } else {
            $('.menu2').removeClass('fixed');
        }
    });

</script>

</head>

<body>
<!-- *** TOPBAR ***
 _________________________________________________________ -->
<div id="top">
    <div class="container">
        <div class="col-md-6 offer" data-animate="fadeInDown">
            <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer of the day</a>  <a href="#">Get flat 10% off on orders over Rs.10000!</a>
        </div>
        <div class="col-md-6" data-animate="fadeInDown">
            <ul class="menu">
                <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                </li>
                <g:if test="${session.endUser}">
                <li><a href="#" onclick="logoutUser();">Logout</a>
                </li>
                </g:if>
                <li><g:link action="register" controller="endUserInformation">Register</g:link>
                </li>
                <li><g:link action="contact" controller="endUser">Contact</g:link>
                </li>

            </ul>
        </div>
    </div>
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


</div>

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
 _________________________________________________________ -->

<div class="navbar navbar-default yamm menu2" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand home" href="index.html" data-animate-hover="bounce">
                <img src="img/logo.png" alt="yarsaa logo" class="hidden-xs">
                <img src="img/logo-small.png" alt="yarsaa logo" class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
            </a>
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
                    <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">${Cart.findAllByEndUserInformation(session.endUser).size()} items in cart</span>
                </g:link>
            </div>
        </div>
        <!--/.navbar-header -->

        <div class="navbar-collapse collapse" id="navigation">

            <ul class="nav navbar-nav navbar-left">
                <li class="active menuBar"><g:link action="userHome" controller="endUser">Home</g:link>
                </li>
                <g:each in="${ProductCategory.findAllByStatusShow(true)}" var="categoryList">
                <li class="dropdown yamm-fw">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${categoryList.categoryName}<b class="caret"></b></a href="#">
                    <ul class="dropdown-menu">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <g:each in="${ProductSubCategorySpecify.list()}" var="specifyList">
                                    <div class="col-sm-3">
                                        <h5>${specifyList.specificationName}</h5>
                                        <ul>
                                        <g:each in="${ProductSubCategory.findAllByProductSubCategorySpecifyAndStatusShow(specifyList,true)}" var="subCategoryList">

                                            <li><g:link action="subCategoryList" controller="endUser" params="[category:categoryList.categoryId,subCategory:subCategoryList.subCategoryId]">${subCategoryList.subCategoryName}</g:link>
                                            </li>

                                            </g:each>
                                        </ul>
                                    </div>

                                    </g:each>
                                    <div class="col-sm-3">
                                        <div class="banner">
                                            <g:link action="allCategoryProducts" controller="endUser" id="${categoryList.categoryId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:categoryList.menuImage1])}" class="img-responsive">


                                            </g:link>
                                        </div>

                                        <div class="banner">
                                            <g:link action="allCategoryProducts" controller="endUser" id="${categoryList.categoryId}">
                                                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:categoryList.menuImage2])}" class="img-responsive">

                                            </g:link>
                                        </div>


                                    </div>

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
        <!--/.nav-collapse -->

        <div class="navbar-buttons">

            <div class="navbar-collapse collapse right" id="basket-overview">
                <g:link action="cart" controller="cart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">${Cart.findAllByEndUserInformation(session.endUser).size()} items in cart</span></g:link>
            </div>
            <!--/.nav-collapse -->

            <div class="navbar-collapse collapse right" id="search-not-mobile">
                <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
            </div>

        </div>

        <div class="collapse clearfix" id="search">

            <form class="navbar-form" role="search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-btn">

                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

                    </span>
                </div>
            </form>

        </div>
        <!--/.nav-collapse -->

    </div>
    <!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->


<div id="all">

    <g:layoutBody></g:layoutBody>
    <!-- /#content -->

    <!-- *** FOOTER ***
 _________________________________________________________ -->
    <div id="footer" data-animate="fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <h4>Pages</h4>

                    <ul>
                        <li><g:link action="about" controller="endUser">About us</g:link>
                        </li>
                        <li><a href="text.html">Terms and conditions</a>
                        </li>
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
                    <h5>${categoryList.categoryName}</h5>

                    <ul>
                        <g:each in="${ProductSubCategory.findAllByStatusShow(true)}" var="subCategoryList">
                            <li><g:link action="subCategoryList" controller="endUser" params="[category:categoryList.categoryId,subCategory: subCategoryList.subCategoryId]">${subCategoryList.subCategoryName}</g:link>
                            </li>
                        </g:each>

                    </ul>
                </g:each>


                    <hr class="hidden-md hidden-lg">

                </div>
                <!-- /.col-md-3 -->

                <div class="col-md-3 col-sm-6">

                    <h4>Where to find us</h4>

                    <p><strong>${CompanyInformation.list()[0].companyName}.</strong>
                        <br>${CompanyInformation.list()[0].location1}
                        <br>${CompanyInformation.list()[0].location2}
                        <br>${CompanyInformation.list()[0].location3}
                        <br>
                        <strong>${CompanyInformation.list()[0].location4}</strong>
                    </p>

                    <g:link action="contact" controller="endUser">Go to contact page</g:link>

                    <hr class="hidden-md hidden-lg">

                </div>
                <!-- /.col-md-3 -->



                <div class="col-md-3 col-sm-6">

                    <h4>Get the news</h4>

                    <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>

                    <form>
                        <div class="input-group">

                            <input type="text" class="form-control">

                            <span class="input-group-btn">

                                <button class="btn btn-default" type="button">Subscribe!</button>

                            </span>

                        </div>
                        <!-- /input-group -->
                    </form>

                    <hr>

                    <h4>Stay in touch</h4>

                    <p class="social">
                        <a href="#" class="facebook external" data-animate-hover="shake"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="twitter external" data-animate-hover="shake"><i class="fa fa-twitter"></i></a>
                        <a href="#" class="instagram external" data-animate-hover="shake"><i class="fa fa-instagram"></i></a>
                        <a href="#" class="gplus external" data-animate-hover="shake"><i class="fa fa-google-plus"></i></a>
                        <a href="#" class="email external" data-animate-hover="shake"><i class="fa fa-envelope"></i></a>
                    </p>


                </div>
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
                <p class="pull-left">© 2015 Your name goes here.</p>

            </div>
            <div class="col-md-6">
                <p class="pull-right">Template by Bonish Thapa</a>
                    <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                </p>
            </div>
        </div>
    </div>
    <!-- *** COPYRIGHT END *** -->



</div>
<!-- /#all -->




<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->

</body>

</html>