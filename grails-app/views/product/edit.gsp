<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 5/17/18
  Time: 11:26 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title></title>
<meta name="layout" content="adminYamsaa">
</head>

<body>

<g:form action="save" controller="Product" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
<g:hiddenField name="id" value="${productInstance?.id}"></g:hiddenField>
<div class="col-lg-6">
    <div class="form-group ">
        <label class="control-label col-sm-4" for="productDetails">Choose Product Name:</label>

        <div class="col-sm-6">
            <g:select class="selectpicker" id="productDetails" name="productDetails" value="${productInstance?.productDetails?.id}"
                      from="${ProductDetails.list()}" optionKey="id" optionValue="productNameWithBrand" data-show-subtext="true"
                      data-live-search="true" title="choose name "/>
        </div>
    </div>
</div>
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Choose Color:</label>
        <div class="col-sm-6">
            <g:select class="selectpicker" id="productColor" name="productColor" value="${productInstance?.productColor?.id}"
                      from="${ProductColor.findAllByStatusShow(true)}" optionKey="id" optionValue="colorName" data-show-subtext="true"
                      data-live-search="true" title="choose color "/>

        </div>
    </div>
</div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">IsFeatured:</label>
            <div class="col-sm-6">
                <g:select name="isFeatured" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" value="${productInstance?.isFeatured?1:0}" class="form-control"/>


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">IsLatest:</label>
            <div class="col-sm-6">
                <g:select name="isLatest" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" value="${productInstance?.isLatest?1:0}" class="form-control"/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Priority Number:</label>
            <div class="col-sm-6">
                <g:textField name="priorityNumber" id="priorityNumber" class="form-control" value="${productInstance?.priorityNumber}" onkeypress="return isNumber(event)"/>
            </div>
        </div>
    </div>

<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Upload specialImage:</label>
        <div class="col-sm-6">
            <g:field type="file" name="specialImageName" class="form-control-file" id="specialImageName"/>
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
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            bootbox.alert({
                message: "not allowed must be number",
                size: 'small'
            });
            return false;
        }
        return true;
    }
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function ValidateUpdate(oForm) {
        var responseValue;
        var productDetails = document.getElementById("productDetails").value;
        var productColor = document.getElementById("productColor").value;
        var specialImageName = document.getElementById("specialImageName").value;

        if(specialImageName.length>0) {
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
                            return false;
                        }
                        else{
                            var jForm = new FormData();

                            jForm.append("Image", $('#specialImageName').get(0).files[0]);
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

                                    else{
                                        responseValue=true;
                                    }
                                }
                            });
                        return responseValue
                        }

                    }

                }
            }}


        if(productColor==''){
            bootbox.alert({
                message: "Color must be selected",
                size: 'small'
            });
            document.getElementById("productColor").focus();
            return false;
        }

        else if(productDetails==''){
            bootbox.alert({
                message: "product name must be choosen",
                size: 'small'
            });
            document.getElementById("productDetails").focus();
            return false;
        }



        return responseValue;
    }

</script>


</body>
</html>