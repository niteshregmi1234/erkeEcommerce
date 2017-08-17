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
<g:form action="save" controller="aboutUs" class="form-horizontal" enctype="multipart/form-data" onsubmit="return Validate(this)">
    <g:hiddenField name="id" value="${aboutUsInstance?.id}"></g:hiddenField>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Upload coveImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="coverImage" class="form-control-file" id="coverImage"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload aboutUsImg1:</label>
            <div class="col-sm-6">
                <g:field type="file" name="aboutUs1Image" class="form-control-file" id="aboutUs1Image"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload aboutUsImg2:</label>
            <div class="col-sm-6">
                <g:field type="file" name="aboutUs2Image" class="form-control-file" id="aboutUs2Image"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload aboutUsImg3:</label>
            <div class="col-sm-6">
                <g:field type="file" name="aboutUs3Image" class="form-control-file" id="aboutUs3Image"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload aboutUsImg4:</label>
            <div class="col-sm-6">
                <g:field type="file" name="aboutUs4Image" class="form-control-file" id="aboutUs4Image"/>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe about:</label>
            <div class="col-sm-6">
                <g:textArea name="aboutUsDescription" id="aboutUsDescription" class="form-control" value="${aboutUsInstance?.aboutUsDescription}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload left Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="quoteLeftImage" class="form-control-file" id="quoteLeftImage"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload right Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="quoteRightImage" class="form-control-file" id="quoteRightImage"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Write Quote:</label>
            <div class="col-sm-6">
                <g:textArea name="quote" id="quote" class="form-control" value="${aboutUsInstance?.quote}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Video Id:</label>
            <div class="col-sm-6">
                <g:textField name="videoName" id="videoName" class="form-control" value="${aboutUsInstance?.videoName}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload video-Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="videoDescrptionImage" class="form-control-file" id="videoDescrptionImage"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe video:</label>
            <div class="col-sm-6">
                <g:textArea name="videoDescription" id="videoDescription" class="form-control" value="${aboutUsInstance?.quote}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose specialProduct1:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="specialProduct1" name="specialProduct1" value="${aboutUsInstance?.specialProduct1?.id}"
                          from="${Product.list()}" optionKey="id" optionValue="productSpecificationName" data-show-subtext="true"
                          data-live-search="true" title="choose product"/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose specialProduct2:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="specialProduct2" name="specialProduct2" value="${aboutUsInstance?.specialProduct2?.id}"
                          from="${Product.list()}" optionKey="id" optionValue="productSpecificationName" data-show-subtext="true"
                          data-live-search="true" title="choose product"/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose specialSubCategory:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="specialProductSubCategory" name="specialProductSubCategory" value="${aboutUsInstance?.specialProductSubCategory?.id}"
                          from="${ProductSubCategory.findAllByStatusShow(true)}" optionKey="id" optionValue="subCategoryName" data-show-subtext="true"
                          data-live-search="true" title="choose subCategory"/>

            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload subCategory Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="specialProductSubCategoryImage" class="form-control-file" id="specialProductSubCategoryImage"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload backgroundImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="backgroundImage" id="backgroundImage" class="form-control-file"/>
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

    function Validate(oForm) {
        var responseValue;
        var coverImage = document.getElementById("coverImage").value;
        var aboutUs1Image = document.getElementById("aboutUs1Image").value;
        var aboutUs2Image = document.getElementById("aboutUs2Image").value;
        var aboutUs3Image = document.getElementById("aboutUs3Image").value;
        var aboutUs4Image = document.getElementById("aboutUs4Image").value;
        var quoteLeftImage = document.getElementById("quoteLeftImage").value;
        var quoteRightImage = document.getElementById("quoteRightImage").value;
        var videoName = document.getElementById("videoName").value;
        var videoDescrptionImage = document.getElementById("videoDescrptionImage").value;
        var specialProductSubCategoryImage = document.getElementById("specialProductSubCategoryImage").value;
        var backgroundImage = document.getElementById("backgroundImage").value;

        if(coverImage.length>0) {
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

                        jForm.append("Image", $('#coverImage').get(0).files[0]);
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
        if(aboutUs1Image.length>0) {
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

                        jForm.append("Image", $('#aboutUs1Image').get(0).files[0]);
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
        if(aboutUs2Image.length>0) {
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

                        jForm.append("Image", $('#coverImage').get(0).files[0]);
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
        if(aboutUs3Image.length>0) {
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

                        jForm.append("Image", $('#aboutUs3Image').get(0).files[0]);
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
        if(aboutUs4Image.length>0) {
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

                        jForm.append("Image", $('#aboutUs4Image').get(0).files[0]);
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
        if(quoteLeftImage.length>0) {
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

                        jForm.append("Image", $('#quoteLeftImage').get(0).files[0]);
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
        if(quoteRightImage.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[7];
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

                        jForm.append("Image", $('#quoteRightImage').get(0).files[0]);
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
        if(videoDescrptionImage.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[9];
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

                        jForm.append("Image", $('#videoDescrptionImage').get(0).files[0]);
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
        if(specialProductSubCategoryImage.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[13];
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

                        jForm.append("Image", $('#specialProductSubCategoryImage').get(0).files[0]);
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
        if(backgroundImage.length>0) {
            var arrInputs = oForm.getElementsByTagName("input");
            var oInput = arrInputs[14];
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

                        jForm.append("Image", $('#backgroundImage').get(0).files[0]);
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



        return responseValue;

    }

</script>


</body>
</html>