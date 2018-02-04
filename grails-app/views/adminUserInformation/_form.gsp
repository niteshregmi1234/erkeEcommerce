
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="firstName">First Name:</label>

            <div class="col-sm-4">
                <input type="text" name="firstName" id="firstName"  class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="lastName">Last Name:</label>

            <div class="col-sm-4">
                <input type="text" name="lastName" id="lastName" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="email">Email:</label>

            <div class="col-sm-4">
                <input type="text" name="email" id="email"  class="form-control"/>

                <small style="color: #a94442;"><g:if test="${flash.message}">${flash.message}
                    <script>
                        $("#a").css("border", "1px solid #a94442");
                        $('html, body').animate({
                            scrollTop: $("#lastName").offset().top
                        }, 2000);
                    </script>
                </g:if>
                </small>




            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userPw">Password</label>
            <div class="col-sm-4">

                <input class="form-control" id="userPw" type="password" placeholder="password"
                       name="password" data-minLength="5"
                       data-error="some error"
                       required/>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userPw2">Confirm Password</label>
            <div class="col-sm-4">

                <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirm password"
                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                       data-match-error="some error 2"
                       required/>
            </div>
        </div>

    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="role">Select Role</label>
            <div class="col-sm-4">
                <select class="selectpicker" id="role" name="role">
                    <option value="CEO">CEO</option>
                    <option value="MD">MD</option>
                    <option value="Content Manager">Content Manager</option>
                    <option value="Delivery Person">Delivery Person</option>
                </select>

            </div>
        </div>

    </div>

    <script type="text/javascript">

        $(document).ready(function() {
            $('#reg_form').bootstrapValidator({
                        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                        fields: {
                            firstName: {
                                validators: {
                                    stringLength: {
                                        min: 2,
                                    },
                                    notEmpty: {
                                        message: 'Please supply your first name'
                                    }
                                }
                            },
                            lastName: {
                                validators: {
                                    stringLength: {
                                        min: 2,
                                    },
                                    notEmpty: {
                                        message: 'Please supply your last name'
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
                                        url: "${createLink(controller:'adminUserInformation', action:'checkEmail')}",
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


