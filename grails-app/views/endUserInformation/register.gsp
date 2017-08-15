<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="userYarsaa">

</head>

<body>
<!-- *** TOPBAR ***
 _________________________________________________________ -->
<!-- *** NAVBAR END *** -->


    <div id="content">
        <div class="container">

            <div class="col-md-12">

                <ul class="breadcrumb">
                    <li><g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li>New account / Sign in</li>
                </ul>

            </div>

            <div class="col-md-6">
                <div class="box">
                    <h1>New account</h1>

                    <p class="lead">Not our registered customer yet?</p>
                    <p>With registration with us new world of fashion, fantastic discounts and much more opens to you! The whole process will not take you more than a minute!</p>
                    <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                    <hr>

                        <!-- Form Name -->

                    <form action="/endUserInformation/save" class="form-horizontal" method="post" id="reg_form" >
                        <fieldset>
                            <legend> Personal Information </legend>

                            <div class="form-group">
                            <label>First Name</label>
                            <input name="first_name" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Last Name</label>
                            <input name="last_name" type="text" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label>Phone/mobile</label>
                            <input name="phone" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input name="address" type="text" class="form-control">
                        </div>
                        <div class="form-group" id="c">
                            <label>City</label>
                            <input name="city" type="text" class="form-control">
                        </div>
</fieldset><fieldset>
                        <legend> Account Information </legend>
                        <div class="form-group" >
                            <label>Email</label>
                            <input name="email" type="text" class="form-control" id="a" >


                            <small style="color: #a94442;"><g:if test="${flash.message}">${flash.message}
                            <script>
                                $("#a").css("border", "1px solid #a94442");
                                $('html, body').animate({
                                    scrollTop: $("#c").offset().top
                                }, 2000);
                            </script>
                            </g:if>
                            </small>


                        </div>


                        <div class="form-group">
                            <label for="userPw">Password</label>
                            <input class="form-control" id="userPw" type="password" placeholder="password"
                                   name="password" data-minLength="5"
                                   data-error="some error"
                                   required/>
                        </div>
                            <div class="form-group">
                                <label for="userPw2">Confirm Password</label>
                                <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirm password"
                                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                                       data-match-error="some error 2"
                                       required/>
                            </div>

                    </fieldset>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</button>
                        </div>
                    </form>
                </div>
            </div>
            <script type="text/javascript">

                $(document).ready(function() {
                    $('#reg_form').bootstrapValidator({
                                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                                fields: {
                                    first_name: {
                                        validators: {
                                            stringLength: {
                                                min: 2,
                                            },
                                            notEmpty: {
                                                message: 'Please supply your first name'
                                            }
                                        }
                                    },
                                    last_name: {
                                        validators: {
                                            stringLength: {
                                                min: 2,
                                            },
                                            notEmpty: {
                                                message: 'Please supply your last name'
                                            }
                                        }
                                    },

                                    phone: {
                                        validators: {
                                            notEmpty: {
                                                message: 'Please supply your phone number'
                                            },
                                            phone: {
                                                country: 'NEPAL',
                                                message: 'Please supply a vaild mobile/phone number'
                                            }
                                        }
                                    },
                                    address: {
                                        validators: {
                                            stringLength: {
                                                min: 8,
                                            },
                                            notEmpty: {
                                                message: 'Please supply your street address'
                                            }
                                        }
                                    },
                                    city: {
                                        validators: {
                                            stringLength: {
                                                min: 4,
                                            },
                                            notEmpty: {
                                                message: 'Please supply your city'
                                            }
                                        }
                                    },

                                    email: {
                                        validators: {
                                            notEmpty: {
                                                message: 'Please supply your email address'
                                            },
                                            emailAddress: {
                                                message: 'Please supply a valid email address'

                                            },
                                            remote: {
                                                url: "${createLink(controller:'endUserInformation', action:'checkEmail')}",
                                                // Send { username: 'its value', email: 'its value' } to the back-end
                                                data: function(validator, $field, value) {
                                                    return {
                                                        email: validator.getFieldElements('email').val()
                                                    };

                                                },
                                                message: 'The email is already in use',
                                                type: 'POST'
                                            }

                                        }
                                    },

                                    password: {
                                        validators: {
                                            notEmpty: {
                                                message: 'Please supply your password'
                                            },

                                            identical: {
                                                field: 'confirmPassword',
                                                message: 'Confirm your password below - type same password please'
                                            }
                                        }
                                    },
                                    confirmPassword: {
                                        validators: {
                                            identical: {
                                                field: 'password',
                                                message: 'The password and its confirm are not the same'
                                            }
                                        }
                                    },


                                }
                            })


                            .on('success.form.bv', function(e) {
                                $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                                $('#reg_form').data('bootstrapValidator').resetForm();

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
            <div class="col-md-6">

                    <div class="box">
                    <h1>Login</h1>

                    <p class="lead">Already our customer?</p>
                    <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies
                    mi vitae est. Mauris placerat eleifend leo.</p>

                    <hr>
                    <form action="/endUserInformation/login" class="form-horizontal" method="post" onsubmit="return loginValid1();">
                        <small style="color: #a94442; display: none;" id="error1" >email or password does not exist</small>

                        <div class="form-group">
                            <label for="login_email1">Email</label>
                            <input type="text" name="login_email" class="form-control" id="login_email1">
                            <small style="color: #a94442; display: none;" id="login_emailBlank1">
                            Please supply your email</small>
                            <small style="color: #a94442; display: none;" id="login_emailInvalid1">
                                Invalid email Address</small>

                        </div>
                        <div class="form-group">
                            <label for="login_password1">Password</label>
                            <input type="password" name="login_password" class="form-control" id="login_password1">
                            <small style="color: #a94442; display: none;" id="login_passwordBlank1">
                                Please supply your password</small>

                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" ><i class="fa fa-sign-in"></i> Log in</button>
                        </div>
                    </form>
                </div>
            </div>
            <script type="text/javascript">
                function loginValid1(){
                    var responseValue;
                    var emailAddress= $("#login_email1").val();
                    var array = [];
                    array[0] = $("#login_email1").val();
                    array[1] = $("#login_password1").val();
                    if(array[0]==''){
                        $('#login_emailInvalid1').hide();
                        $("#login_email1").css("border", "1px solid #a94442");
                        $('#login_emailBlank1').show();
                        document.getElementById("login_email1").focus();
                        responseValue=false;
                    }
                    if(emailAddress!=''){
                        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                        if(!emailAddress.match(re)){
                            $("#login_email1").css("border", "1px solid #a94442");
                            $('#login_emailBlank1').hide();
                            $('#login_emailInvalid1').show();

                            document.getElementById("login_email1").focus();
                            return false;


                        }}
                    if(array[1]==''){
                        $("#login_password1").css("border", "1px solid #a94442");
                        $('#login_passwordBlank1').show();
                        document.getElementById("login_password1").focus();
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
                                    $('#login_passwordBlank1').hide();
                                    $('#login_emailBlank1').hide();
                                    $('#login_emailInvalid1').hide();
                                    $('#error1').show();
                                    responseValue=false;

                                }
                            }
                        });

                    }
                    return responseValue;

                }


            </script>



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


<g:if test="${flash.message1}">
    <script>
        window.addEventListener("load",function(){
            bootbox.alert({
                message:"${flash.message1}",
                size: 'small',
                callback: function(){
                    location.reload();
                }

            });

        });

    </script>
</g:if>

</body>

</html>