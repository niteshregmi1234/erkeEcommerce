<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="userYarsaa">
</head>

<body>


<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
 _________________________________________________________ -->

<!-- /#navbar -->

<!-- *** NAVBAR END *** -->

%{--<div id="all">--}%

    <div id="content">
        <div class="container-fluid">

            <div class="col-md-12">

                <ul class="breadcrumb">
                    <li><g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li>My account</li>
                </ul>

            </div>

            <div class="col-md-3">
                <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Customer section</h3>
                    </div>

                    <div class="panel-body">

                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <g:link action="cart" controller="cart"><i class="fa fa-list"></i> My orders</g:link>
                            </li>
                            %{--<li>--}%
                                %{--<a href="customer-wishlist.html"><i class="fa fa-heart"></i> My wishlist</a>--}%
                            %{--</li>--}%
                            <li>
                                <g:link action="myProfile" controller="endUserInformation"><i class="fa fa-user"></i> My Profile</g:link>
                            </li>
                            <li>

                            <g:link action="editPassword" controller="endUserInformation"><i class="fa fa-user"></i>Change Password</g:link>
                            </li>
                            <li>
<a href="#" onclick="logoutUser();"><i class="fa fa-sign-out"></i>Logout</a>

    %{--<a href="index.html"><i class="fa fa-sign-out"></i> Logout</a>--}%
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.col-md-3 -->

                <!-- *** CUSTOMER MENU END *** -->
            </div>

            <div class="col-md-9">
                <div class="box">
                    <h1>My Profile</h1>
                    <p class="lead">Change your personal details.</p>
                    <div class="col-sm-12" style="color: #26B99A">${flash.message}</div>
                    <form action="/endUserInformation/editEndUserPersonalDetails" class="form-horizontal" method="post" id="myProfile" >
                        <legend> Personal Information </legend>

                        <fieldset>
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label>First Name*</label>
                                    <input name="firstNameBilling" id="firstNameBilling" placeholder="first Name"  type="text" class="form-control" value="${endUserInstance?.firstName}">
                                </div>
                            </div>
                            <div class="col-sm-12">

                                <div class="form-group">
                                    <label >Last Name*</label>
                                    <input name="lastNameBilling" id="lastNameBilling" placeholder="last name" type="text"  class="form-control" value="${endUserInstance?.lastName}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Company Name</label>
                                    <input name="companyNameBilling" id="companyNameBilling" placeholder="company Name" type="text" class="form-control" value="${endUserInstance?.companyName}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>mobile No*</label>
                                    <input name="mobileOrPhoneCumpolsoryBilling" id="mobileOrPhoneCumpolsoryBilling" placeholder="mobile No" type="text"  class="form-control" value="${endUserInstance?.mobileOrPhoneCumpolsory}">

                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>mobile No Additional</label>
                                    <input name="mobileOrPhoneOptionalBilling" id="mobileOrPhoneOptionalBilling" placeholder="mobile No" type="text" class="form-control" value="${endUserInstance?.mobileOrPhoneOptional}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Address*</label>
                                    <input name="cumpolsoryAddressBilling" id="cumpolsoryAddressBilling" placeholder="street address"  type="text" class="form-control" value="${endUserInstance?.cumpolsoryAddress}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Address Optional</label>
                                    <input name="optionalAddressBilling" id="optionalAddressBilling" placeholder="apartment,suite,unit etc."  type="text" class="form-control" value="${endUserInstance?.optionalAddress}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>City*</label>
                                    <input name="cityBilling" id="cityBilling" placeholder="kathmandu,lalitpur,bhaktapur etc." type="text"  class="form-control" value="${endUserInstance?.townOrCity}">
                                </div>
                            </div>
                        </fieldset>

                        <legend> Enter your Password to update your details</legend>

                        <fieldset>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="userPw">Account Password*</label>
                                    <input class="form-control" id="userPw" type="password" placeholder="password"
                                           name="oldPassword"/>
                                </div>
                            </div>

                        </fieldset>
                        <br>
                        <div class="col-sm-12 col-md-12 col-xs-12 text-center">

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Update</button>


                            </div>
                        </div>

                    </form>

                    <hr>

                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#myProfile').bootstrapValidator({
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

                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your password'
                        },
                        remote: {
                            url: "${createLink(controller:'endUserInformation', action:'checkPassword')}",
                            // Send { username: 'its value', email: 'its value' } to the back-end
                            data: function (validator, $field, value) {
                                return {
                                    oldPassword: validator.getFieldElements('oldPassword').val()
                                };

                            },
                            message: 'Please enter correct password',
                            type: 'POST'
                        }


                    }
                }


            }

        })
    .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
            $('#myProfile').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
            // Use Ajax to submit form data
        });

    });

</script>


    <!-- /#content -->


    <!-- *** FOOTER ***
 _________________________________________________________ -->
    <!-- /#footer -->

    <!-- *** FOOTER END *** -->




    <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
    <!-- *** COPYRIGHT END *** -->



%{--</div>--}%
<!-- /#all -->




<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->



</body>

</html>