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

                    <form action="/endUserInformation/saved" class="form-horizontal" method="post" id="reg_form" >
                    <legend> Personal Information </legend>

                    <fieldset>
                        <div class="col-sm-12">

                                <div class="form-group">
                                    <label>First Name*</label>
                                    <input name="firstNameBilling" id="firstNameBilling" placeholder="first Name"  type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-12">

                                <div class="form-group">
                                    <label >Last Name*</label>
                                    <input name="lastNameBilling" id="lastNameBilling" placeholder="last name" type="text"  class="form-control" >
                                </div>
                            </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Company Name</label>
                                <input name="companyNameBilling" id="companyNameBilling" placeholder="company Name" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>mobile No*</label>
                                <input name="mobileOrPhoneCumpolsoryBilling" id="mobileOrPhoneCumpolsoryBilling" placeholder="mobile No" type="text"  class="form-control" >

                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>mobile No Additional</label>
                                <input name="mobileOrPhoneOptionalBilling" id="mobileOrPhoneOptionalBilling" placeholder="mobile No" type="text" class="form-control" >
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Address*</label>
                                <input name="cumpolsoryAddressBilling" id="cumpolsoryAddressBilling" placeholder="street address"  type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Address Optional</label>
                                <input name="optionalAddressBilling" id="optionalAddressBilling" placeholder="apartment,suite,unit etc."  type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>City*</label>
                                <input name="cityBilling" id="cityBilling" placeholder="kathmandu,lalitpur,bhaktapur etc." type="text"  class="form-control">
                            </div>
                        </div>
                    </fieldset>

                    <legend> Account Information </legend>

                    <fieldset>
                        <div class="col-sm-12">
                            <div class="form-group" >
                                <label>Email*</label>
                                <input name="email" placeholder="email@hostname.com" type="text" class="form-control"  id="email" onkeypress="myFunction()">
                                <small class="help-block" style="display: none; color:#a94442;" id="notUniqueEmail">The email is already in use</small>
                            </div>
                        </div><script>
                        function myFunction() {
                            if(validateEmail(document.getElementById("email").value)){
                            $.ajax({
                                type: "POST",
                                url: "${createLink(controller:'endUserInformation', action:'checkEmail')}",
                                data: { "email":document.getElementById("email").value  },
                                async:false,
                                success: function (msg) {
                                    if(msg["valid"]){
                                        $("#email").css("border", "1px solid #3c763d");
                                        $("#notUniqueEmail").hide();
                                    }
                                }
                            });}

                        }
                        function validateEmail(email) {
                            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                            return re.test(email);

                        }
                    </script>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="userPw">Account Password*</label>
                                <input class="form-control" id="userPw" type="password" placeholder="password"
                                       name="password"/>
                            </div>
                        </div>
                        <div class="col-sm-12">

                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password*</label>
                                <input class="form-control" id="confirmPassword" type="password" placeholder="Confirm password"
                                       name="confirmPassword"/>
                            </div>
                        </div>
                    </fieldset>
                    <br>
                    <div class="col-sm-12 col-md-12 col-xs-12 text-center">

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</button>


                        </div>
                    </div>

                    </form>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    $('#reg_form').bootstrapValidator({
                        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                        fields: {
                            firstNameBilling: {
                                validators: {

                                    notEmpty: {
                                        message: 'Please supply your first name'
                                    }
                                }
                            },
                            lastNameBilling: {
                                validators: {
                                    notEmpty: {
                                        message: 'Please supply your last name'
                                    }
                                }
                            },
                            mobileOrPhoneCumpolsoryBilling: {
                                validators: {
                                    notEmpty: {
                                        message: 'Please supply your phone number'
                                    },
                                    phone: {
                                        country: 'US',
                                        message: 'Please supply a vaild phone number with area code'
                                    }
                                }
                            },
                            mobileOrPhoneOptionalBilling: {
                                validators: {
                                    phone: {
                                        country: 'US',
                                        message: 'Please supply a vaild phone number with area code'
                                    }
                                }
                            },

                            cumpolsoryAddressBilling: {
                                validators: {
                                    notEmpty: {
                                        message: 'Please supply your address'
                                    }
                                }
                            },
                            cityBilling: {
                                validators: {
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
                                    notEmpty: {
                                        message: 'Please supply your confirm password'
                                    },
                                    identical: {
                                        field: 'password',
                                        message: 'The password and its confirm are not the same'
                                    }
                                }
                            }


                                                  },

                        submitHandler: function(form) {
                            $("#notUniqueEmail").hide();
                            $.ajax({
                                type: "POST",
                                url: "${createLink(controller:'endUserInformation', action:'checkSubmit')}",
                                data: $('form.form-horizontal').serialize(),
                                async:false,
                                success: function (msg) {
                                    if(msg=="already exist email"){
                                        $("#email").css("border", "1px solid #a94442");
$("#notUniqueEmail").show();
                                    }
                                    else{
                                        $("#notUniqueEmail").hide();
                                        bootbox.alert("You are successfully registered. You can easily login by submitting button of login form.");
                                        document.getElementById("login_email1").value=document.getElementById("email").value;
                                        document.getElementById("login_password1").value=document.getElementById("userPw").value;
                                        document.getElementById("reg_form").reset();
                                        document.getElementById("login_email1").focus();
                                    }
                                }
                            });
                        }
                    });
                });

            </script>
            <div class="col-md-6">

                    <div class="box">
                    <h1>Login</h1>

                    <p class="lead">Already our customer?</p>
                    <p class="text-muted">You can login from the form below if you have already created your account to shop products available here.</p>

                    <hr>
                    <form action="/endUserInformation/login" class="form-horizontal" method="post" onsubmit="return loginValid1();">
                        <small style="color: #a94442; display: none;" id="error1" >email or password does not exist</small>

                        <div class="form-group">
                            <label for="login_email1">Email</label>
                            <input type="text" name="login_email" placeholder="email@hostname.com" class="form-control" id="login_email1">
                            <small style="color: #a94442; display: none;" id="login_emailBlank1">
                            Please supply your email</small>
                            <small style="color: #a94442; display: none;" id="login_emailInvalid1">
                                Invalid email Address</small>

                        </div>
                        <div class="form-group">
                            <label for="login_password1">Password</label>
                            <input type="password" name="login_password" class="form-control" placeholder="password" id="login_password1">
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



</body>

</html>