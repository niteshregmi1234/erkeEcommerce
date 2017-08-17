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
<g:form action="save" controller="specialBrand" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
    <g:hiddenField name="id" value="${specialBrandInstance?.id}"></g:hiddenField>



    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose ProductBrand:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="productBrand" name="productBrand" value="${specialBrandInstance?.productBrand?.id}"
                          from="${ProductBrand.findAllByStatusShow(true)}" optionKey="id" optionValue="brandName" data-show-subtext="true"
                          data-live-search="true" title="choose brand "/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload MainImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="brandMainImageName" class="form-control-file" id="brandMainImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe MainImage:</label>
            <div class="col-sm-6">
                <g:textArea name="descriptionMainImage" id="descriptionMainImage" class="form-control" value="${specialBrandInstance?.descriptionMainImage}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload Sub-1-Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="brandSub1ImageName" id="brandSub1ImageName" class="form-control-file"/>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Title sub-1-Image:</label>
            <div class="col-sm-6">
                <g:textField name="titleForSub1Image" id="titleForSub1Image" class="form-control" value="${specialBrandInstance?.titleForSub1Image}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe Sub-1-Image:</label>

            <div class="col-sm-6">
                <g:textArea name="descriptionSub1Image" id="descriptionSub1Image"  class="form-control" value="${specialBrandInstance?.descriptionSub1Image}"/>
            </div>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload Sub-2-Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="brandSub2ImageName" id="brandSub2ImageName" class="form-control-file"/>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Title sub-2-Image:</label>
            <div class="col-sm-6">
                <g:textField name="titleForSub2Image" id="titleForSub2Image" class="form-control" value="${specialBrandInstance?.titleForSub2Image}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe Sub-2-Image:</label>

            <div class="col-sm-6">
                <g:textArea name="descriptionSub2Image" id="descriptionSub1Image"  class="form-control" value="${specialBrandInstance?.descriptionSub2Image}"/>
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
        var blnValidBrandMainImageName=false;
        var blnValidBrandSub1ImageName=false;
        var blnValidBrandSub2ImageName=false;
        var responseValue;
        var productBrand = document.getElementById("productBrand").value;
        var brandMainImageName = document.getElementById("brandMainImageName").value;
        var brandSub1ImageName = document.getElementById("brandSub1ImageName").value;
        var brandSub2ImageName = document.getElementById("brandSub2ImageName").value;
        if(productBrand==''){
            bootbox.alert({
                message: "must choose productBrand",
                size: 'small'
            });
            document.getElementById("productBrand").focus();
            return false;
        }
        if(brandMainImageName.length>0){
            var arrInputs = oForm.getElementsByTagName("input");
                        var oInput = arrInputs[2];
                        if (oInput.type == "file") {
                            var sFileName = oInput.value;
                    if (sFileName.length > 0) {
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                            var sCurExtension = _validFileExtensions[j];
                            if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                blnValidBrandMainImageName = true;
                                break;
                            }
                        }

                        if (!blnValidBrandMainImageName) {
                            bootbox.alert("Sorry, " + sFileName+ " for mainImage is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                            responseValue=false;
                        }
                        else {
                            var jForm = new FormData();

                            jForm.append("Image", $('#brandMainImageName').get(0).files[0]);
                            $.ajax({
                                url: "${createLink(controller:'companyInformation', action:'checkPhoto')}",
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
                                            message: "main Image bad format",
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
        if(brandSub1ImageName.length>0){
            var arrInputs = oForm.getElementsByTagName("input");

                var oInput = arrInputs[3];
                if (oInput.type == "file") {
                    var sFileName = oInput.value;
                    if (sFileName.length > 0) {
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                            var sCurExtension = _validFileExtensions[j];
                            if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                blnValidBrandSub1ImageName = true;
                                break;
                            }
                        }

                        if (!blnValidBrandSub1ImageName) {
                            bootbox.alert("Sorry, " + sFileName + " for sub1 Image is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                            responseValue=false;

                        }
                        else {
                            var jForm = new FormData();

                            jForm.append("Image", $('#brandSub1ImageName').get(0).files[0]);
                            $.ajax({
                                url: "${createLink(controller:'companyInformation', action:'checkPhoto')}",
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
                                            message: "sub1-Image bad format",
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



        if(brandSub2ImageName.length>0){
            var arrInputs = oForm.getElementsByTagName("input");


                var oInput = arrInputs[5];
                if (oInput.type == "file") {
                    var sFileName = oInput.value;
                    if (sFileName.length > 0) {
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                            var sCurExtension = _validFileExtensions[j];
                            if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                blnValidBrandSub2ImageName = true;
                                break;
                            }
                        }

                        if (!blnValidBrandSub2ImageName) {
                            bootbox.alert("Sorry, " + sFileName + " for sub2 Image is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                            responseValue=false;

                        }
                        else {
                            var jForm = new FormData();

                            jForm.append("Image", $('#brandSub2ImageName').get(0).files[0]);
                            $.ajax({
                                url: "${createLink(controller:'companyInformation', action:'checkPhoto')}",
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
                                            message: "sub2 Image Image bad format",
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