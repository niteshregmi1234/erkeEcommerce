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
<g:form action="save" controller="seasons" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
    <g:hiddenField name="id" value="${seasonsInstance?.id}"></g:hiddenField>
<g:render template="form"></g:render>
<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <g:submitButton name="update" value="Update" id="submit_Id" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
        </div>
    </div>
</div>
</g:form>
<script>
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;


    function ValidateUpdate(oForm) {
        var responseValue;
        var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

        var imageName = document.getElementById("imageName").value;

        if(imageName.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            for (var i = 0; i < arrInputs.length; i++) {
                var oInput = arrInputs[i];
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

                            jForm.append("Image", $('#imageName').get(0).files[0]);


                            $.ajax({
                                url: "${createLink(controller:'coverImage', action:'checkPhoto')}",
                                type: "POST",
                                data: jForm,
                                mimeType: "multipart/form-data",
                                contentType: false,
                                cache: false,
                                processData: false,
                                async: false,
                                success: function (result) {
                                    if(result=="Photo bad format"){
                                        document.getElementById("imageName").focus();
                                        bootbox.alert({
                                            message: "image is bad format",
                                            size: 'small'
                                        });
                                        responseValue=false;

                                    }
                                    else{

                                        responseValue=true;

                                    }
                                }
                            });
                        }
                    }
                }

            }

        }


        return responseValue;
    }

</script>

</body>
</html>