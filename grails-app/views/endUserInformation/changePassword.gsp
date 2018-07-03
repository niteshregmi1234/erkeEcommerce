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
    <div class="container">

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
                            <g:link action="myProfile" controller="endUserInformation"><i class="fa fa-user"></i> My account</g:link>
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
                <h1>My account</h1>
                <p class="lead">Change your password here.</p>

                <h3>Change password</h3>

                <form action="/endUserInformation/editEndUserPassword" method="post" id="accountDetail">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" value="${session.endUser.email}" disabled="true">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="oldPassword">Old password</label>
                                <g:passwordField name="oldPassword" placeholder="oldPassword" class="form-control" id="oldPassword"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="newPasswordOne">New password</label>
                                <g:passwordField name="newPassword" class="form-control" id="newPasswordOne" placeholder="new password"
                                                 />

                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="newPasswordTwo">Confirm new password</label>
                                <g:passwordField class="form-control" id="newPasswordTwo" placeholder="Confirm new password"
                                                 name="confirmNewPassword"/>


                            </div>
                        </div>
                    </div>

                    <!-- /.row -->

                    <div class="col-sm-12 text-center">
                        <button type="submit" id="updatePassword" class="btn btn-primary" ><i class="fa fa-save"></i> Save new password</button>
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
        $('#accountDetail').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

            fields: {

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
                },
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your password'
                        },

                        identical: {
                            field: 'confirmNewPassword',
                            message: 'Confirm your new password below - type same password please'
                        },
                        remote: {
                            url: "${createLink(controller:'endUserInformation', action:'checkOldPassword')}",
                            // Send { username: 'its value', email: 'its value' } to the back-end
                            data: function (validator, $field, value) {
                                return {
                                    newPassword: validator.getFieldElements('newPassword').val()
                                };

                            },
                            message: 'This password is identical to previous one. Please type new password',
                            type: 'POST'
                        }

                    }
                },

                confirmNewPassword: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your confirm new password'
                        },
                        identical: {
                            field: 'newPassword',
                            message: 'The new password and its confirm are not the same'
                        }
                    }
                }

            }
        })


            .on('success.form.bv', function(e) {
                $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#accountDetail').data('bootstrapValidator').resetForm();

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

</body>

</html>