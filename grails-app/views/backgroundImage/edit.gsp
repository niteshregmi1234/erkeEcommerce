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
<g:form action="save" controller="backgroundImage" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
    <g:hiddenField name="id" value="${backgroundImageInstance?.id}"></g:hiddenField>




    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="imageName" class="form-control-file" id="imageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>


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
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function ValidateUpdate(oForm) {

        var blnValid=false;
        var responseValue;
        var imageName = document.getElementById("imageName").value;

        if(imageName.length>0){
            var arrInputs = oForm.getElementsByTagName("input");
            for (var i = 0; i < arrInputs.length; i++) {

                var oInput = arrInputs[i];
                if (oInput.type == "file") {
                    var sFileName = oInput.value;
                    if (sFileName.length > 0) {
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                            var sCurExtension = _validFileExtensions[j];
                            if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                blnValid= true;
                                break;
                            }
                        }

                        if (!blnValid) {
                            bootbox.alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                            return false;
                        }


                    }
                }

            }       }



        if(blnValid==true){
            var jForm = new FormData();

            jForm.append("Image", $('#brandSub2ImageName').get(0).files[0]);
            $.ajax({
                url: "${createLink(controller:'backgroundImage', action:'checkPhoto')}",
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


        return responseValue;
    }

</script>

</body>
</html>