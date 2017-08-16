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
<form action="/otherCosts/save" method="post" class="form-horizontal" id="otherCostForm">
    <g:hiddenField name="otherCostId" value="${otherCostsInstance?.id}"></g:hiddenField>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="shippingAndHandlingPercentage">Shipping and Handling Percentage:</label>

            <div class="col-sm-4">
                <g:textField name="shippingAndHandlingPercentage" id="shippingAndHandlingPercentage" value="${otherCostsInstance?.shippingAndHandlingPercentage}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="taxPercentage">Tax Percentage:</label>

            <div class="col-sm-4">
                <g:textField name="taxPercentage" id="taxPercentage" value="${otherCostsInstance?.taxPercentage}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>


<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <button type="submit"  id="submit_Id" onclick="confirm('Are you sure want to confirm?')" class="btn btn-default">Update</button>
        </div>
    </div>
</div>
</form>
<script>
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;

</script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#otherCostForm').bootstrapValidator({
                    fields: {
                        shippingAndHandlingPercentage: {
                            validators: {
                                notEmpty: {
                                    message: 'this field is required'
                                },
                                between: {
                                    min: 0,
                                    max: 100,
                                    message: 'The percentage must be between 0 and 100'
                                }

                            }
                        },
                        taxPercentage: {
                            validators: {
                                notEmpty: {
                                    message: 'this field is required'
                                },
                                between: {
                                    min: 0,
                                    max: 100,
                                    message: 'The percentage must be between 0 and 100'
                                }

                            }
                        }

                    }
                })


                .on('success.form.bv', function(e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#otherCostForm').data('bootstrapValidator').resetForm();

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