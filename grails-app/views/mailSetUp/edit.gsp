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
<form action="/mailSetUp/save" method="post" class="form-horizontal" id="reg_form">
    <g:hiddenField name="id" value="${mailSetUpInstance?.id}"></g:hiddenField>


    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="toEmail">Customer Shop Notification Email:</label>

            <div class="col-sm-4">
                <input type="text" name="toEmail" id="toEmail" value="${mailSetUpInstance?.toEmail}" class="form-control"/>





            </div>
        </div>
    </div>


    <script type="text/javascript">

        $(document).ready(function() {
            $('#reg_form').bootstrapValidator({
                        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                        fields: {


                            toEmail: {
                                validators: {
                                    notEmpty: {
                                        message: 'Please supply your to Email address'
                                    },
                                    emailAddress: {
                                        message: 'Please supply a valid email address'

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