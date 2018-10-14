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
<g:form action="save" controller="productBrand" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
    <g:hiddenField name="id" value="${productBrandInstance?.id}"></g:hiddenField>

<g:render template="form"></g:render>
<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <g:submitButton name="update" value="Update" onclick="return confirm('Are you sure want to confirm?')" id="submit_Id" class="btn btn-default"></g:submitButton>
        </div>
    </div>
</div>
</g:form>
<script>
    function validate(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

        if (filter.test(sEmail)) {

            return true;

        }

        else {

            return false;

        }
    }

    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
    function ValidateUpdate(oForm) {
        var responseValue;
        var email = document.getElementById("email").value;

        var brandName = document.getElementById("brandName").value;
        var brandDescription = document.getElementById("brandDescription").value;
        var logoName = document.getElementById("logoName").value;

        if(logoName.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[1];
            if (oInput.type == "file") {
                var sFileName = oInput.value;
                if (sFileName.length > 0) {
                    var blnValid = false;
                    for (var j = 0; j < _validFileExtensions.length; j++) {
                        var sCurExtension = _validFileExtensions[j];
                        if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                            blnValid = true;
                            break;
                        }
                    }

                    if (!blnValid) {
                        bootbox.alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                        responseValue=false;
                    }
                    else{
                        var jForm = new FormData();

                        jForm.append("Image", $('#logoName').get(0).files[0]);
                        $.ajax({
                            url: "${createLink(controller:'product', action:'checkPhoto')}",
                            type: "POST",
                            data: jForm,
                            mimeType: "multipart/form-data",
                            contentType: false,
                            cache: false,
                            processData: false,
                            async: false,
                            success: function (result) {
                                if(result=="Photo bad format"){
                                    bootbox.alert({
                                        message: "Image bad format",
                                        size: 'small'
                                    });
                                    responseValue=false;

                                }


                            }
                        });
                    }

                }

            }
        }
        if(email) {
            if (!validate(email)) {
                $("#email").css("border", "1px solid red");
                bootbox.alert({
                    message: "email is invalid eg. abc@companyname.com!",
                    size: 'small'
                });
                document.getElementById("email").focus();
                return false;
            }
        }
        if(brandName==''){
            $("#brandName").css("border", "1px solid red");
            bootbox.alert({
                message: "brandName must not be blank!",
                size: 'small'
            });
            document.getElementById("brandName").focus();
            return false;
        }

        else if(brandDescription==''){
            $("#brandDescription").css("border", "1px solid red");
            bootbox.alert({
                message: "description must not be blank!",
                size: 'small'
            });
            document.getElementById("brandDescription").focus();
            return false;

        }

        return responseValue;
    }

</script>

</body>
</html>