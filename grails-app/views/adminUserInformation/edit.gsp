<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/13/2017
  Time: 12:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>
<body>
<form action="/adminUserInformation/save" method="post" class="form-horizontal" id="reg_form">
    <g:hiddenField name="id" value="${adminUserInstance?.id}"></g:hiddenField>


    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">First Name:</label>

            <div class="col-sm-4">
                <div style="margin-top: 7px;">${adminUserInstance.firstName}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Last Name:</label>

            <div class="col-sm-4">
                <div style="margin-top: 7px;">${adminUserInstance.lastName}</div>

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Email:</label>

            <div class="col-sm-4">

                <div style="margin-top: 7px;">${adminUserInstance.email}</div>



            </div>e
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userPw">New Password</label>
            <div class="col-sm-4">

                <input class="form-control" id="userPw" type="password"  placeholder="password"
                       name="password" data-minLength="5"
                       data-error="some error"
                       />
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userPw2">Confirm Password</label>
            <div class="col-sm-4">

                <input class="form-control {$borderColor}" id="userPw2"  type="password" placeholder="Confirm password"
                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                       data-match-error="some error 2"
                       />
            </div>
        </div>

    </div>

    <script type="text/javascript">

        $(document).ready(function() {
            $('#reg_form').bootstrapValidator({
                        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                        fields: {

                            password: {
                                validators: {
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
                            }


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



    <div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <button type="submit" name="update" id="submit_Id" class="btn btn-default">Update</button>
        </div>
    </div>
</div>
</form>

</body>
</html>