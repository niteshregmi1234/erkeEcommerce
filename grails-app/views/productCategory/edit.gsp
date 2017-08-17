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
<g:form action="save" controller="productCategory" class="form-horizontal" enctype="multipart/form-data" onsubmit="return updateValidate(this);">
    <g:hiddenField name="id" value="${productCategoryInstance?.id}"></g:hiddenField>

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
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;

    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function updateValidate(oForm) {
        var responseValue;
        var categoryName = document.getElementById("categoryName").value;
        var coverImageName = document.getElementById("coverImageName").value;
        var shoppingImageName = document.getElementById("shoppingImageName").value;
        var menuImage1 = document.getElementById("menuImage1").value;
        var menuImage2 = document.getElementById("menuImage2").value;
        var menuImage3 = document.getElementById("menuImage3").value;

        if(coverImageName.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[2];
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

                        jForm.append("Image", $('#coverImageName').get(0).files[0]);
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

        if(shoppingImageName.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[3];
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

                        jForm.append("Image", $('#shoppingImageName').get(0).files[0]);
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
        if(menuImage1.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[4];
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

                        jForm.append("Image", $('#menuImage1').get(0).files[0]);
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
        if(menuImage2.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[5];
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

                        jForm.append("Image", $('#menuImage2').get(0).files[0]);
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
        if(menuImage3.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[6];
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

                        jForm.append("Image", $('#menuImage3').get(0).files[0]);
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

        if(categoryName==''){
            $("#categoryName").css("border", "1px solid red");
            bootbox.alert({
                message: "categoryName must not be blank!",
                size: 'small'
            });
            document.getElementById("categoryName").focus();
            responseValue=false;
        }


        return responseValue;

    }

</script>

</body>
</html>