<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/admin.css')}" type="text/css" media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/bootstrap.css')}" type="text/css" media="all"/>
    <g:if test="${StyleManagement.list()[0]}">
    <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"${"style."+StyleManagement.list()[0].style.name+".css"}")}" type="text/css"
          media="all"/>
    </g:if>
    <g:if test="${!StyleManagement.list()[0]}">
        <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"style.default.css")}" type="text/css"
              media="all"/>
    </g:if>

    <script src="${resource(dir: 'js', file: 'yamsaa/jquery.min.js')}" type="text/javascript"
            charset="utf-8"></script>
    <script src="${resource(dir: 'js', file: 'yarsaa/jquery-1.11.0.min.js')}" type="text/javascript"
            charset="utf-8"></script>

    <script src="${resource(dir: 'js', file: 'yamsaa/bootstrapvalidator.js')}" type="text/javascript"
            charset="utf-8"></script>
    <link rel="shortcut icon" href="${resource(dir: 'js', file: 'yarsaa/yarsaalogosmall.png')}">
    %{--<script type="text/javascript"> //<![CDATA[--}%
    %{--var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");--}%
    %{--document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));--}%
    %{--//]]>--}%
    %{--</script>--}%
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
<div class="height-body">
    <div class="login-body">
        <div class="login-color">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-default">
                            <div class="panel-body">
                                <div class="logo-segment">
                                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:CompanyInformation.list()[0].logoImageName])}" class="img-responsive logo-login">

                                    <h2 class="logo-title"> Login</h2>
                                </div>
                                <form method="POST" action="/login/login" role="form" class="form-fix" id="login">
<g:if test="${flash.messageSuccess}">
                                        <div class="alert alert-success fade in">

                                            <strong>!</strong>${flash.messageSuccess}

                                        </div>
</g:if>
<g:if test="${flash.messageError}">

                                        <div class="alert alert-danger fade in">


                                            <strong>Warning!</strong>${flash.messageError}

                                        </div>
    </g:if>

                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" placeholder="email@hostname.com" name="email" type="email" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                    </div>
                                    <button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function() {
        $('#login').bootstrapValidator({
                    // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                    fields: {


                        email: {
                            validators: {
                                notEmpty: {
                                    message: 'Please supply your email address'
                                },
                                emailAddress: {
                                    message: 'Please supply a valid email address'

                                }

                            }
                        },

                        password: {
                            validators: {
                                notEmpty: {
                                    message: 'Please supply your password'
                                }

                            }

                        }


                    }
                })


                .on('success.form.bv', function(e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#login').data('bootstrapValidator').resetForm();

                    // Prevent form submission
                    e.preventDefault();

                    // Get the form instance
                    var $form = $(e.target);

                    // Get the BootstrapValidator instance
                    var bv = $form.data('bootstrapValidator');

                    // Use Ajax to submit form data
                });
    });

</script>

</body>
</html>