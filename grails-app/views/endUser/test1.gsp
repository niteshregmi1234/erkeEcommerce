<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 5/16/18
  Time: 10:01 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title></title>
    %{--<meta name="layout" content="adminYamsaa">--}%
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery-ui.css')}" type="text/css"--}%
          %{--media="all"/>--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap.min.css')}" type="text/css"--}%
          %{--media="all"/>--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/jquery.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%
    %{--<script src="${resource(dir: 'js', file: 'yarsaa/jquery-1.11.0.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/bootstrapvalidator.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/jquery-ui.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%
    %{--<script src="${resource(dir: 'js', file: 'yamsaa/bootstrap.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-multiselect.js')}" type="text/javascript" charset="utf-8"></script>--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-multiselect.css')}" type="text/css">--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/bootbox.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%

    %{--<script src="${resource(dir: 'js', file: 'yamsaa/jquery.dataTables.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/jquery.dataTables.min.css')}" type="text/css"--}%
          %{--media="all"/>--}%

    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'yamsaa/bootstrap-select.min.css')}" type="text/css">--}%
    %{--<script src="${resource(dir: 'js', file: 'yamsaa/bootstrap-select.min.js')}" type="text/javascript"--}%
            %{--charset="utf-8"></script>--}%
    %{--<link rel="shortcut icon" href="${resource(dir: 'js', file: 'yarsaa/yarsaalogosmall.png')}">--}%

</head>

<body>

<g:form action="saveNew" controller="product" class="form-horizontal" enctype="multipart/form-data" onsubmit="return Validate(this);">

<div class="col-lg-6">
    <div class="form-group ">
        <label class="control-label col-sm-4" for="productDetails">Choose Product Name:</label>

        <div class="col-sm-6">
            <g:select class="selectpicker" id="productDetails" name="productDetails"
                      from="${ProductDetails.list()}" optionKey="id" optionValue="productNameWithBrand" data-show-subtext="true"
                      data-live-search="true" title="choose name "/>
        </div>
    </div>
</div>
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Choose Color:</label>
        <div class="col-sm-6">
            <g:select class="selectpicker" id="productColor" name="productColor"
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
                      keys="${[1,0]}"  class="form-control"/>


        </div>
    </div>
</div>
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">IsLatest:</label>
        <div class="col-sm-6">
            <g:select name="isLatest" from="${['TRUE','FALSE']}"
                      keys="${[1,0]}"  class="form-control"/>

        </div>
    </div>
</div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="specialImageName" class="form-control-file" id="specialImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
            <div data-role="dynamic-fields">
                <div class="form-inline">
                    <button class="btn btn-danger" data-role="remove">
                        <span class="glyphicon glyphicon-remove"></span>
                    </button>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-6">Thumbnail Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="thumbnailImageName" class="form-control-file" id="thumbnailImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-6">Medium Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="mediumImageName" class="form-control-file" id="mediumImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-6">Large Image:</label>
            <div class="col-sm-6">
                <g:field type="file" name="largeImageName" class="form-control-file" id="largeImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>

                    <button class="btn btn-primary" data-role="add">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
    </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2"></label>

            <div class="col-sm-6">
                <g:submitButton name="save" value="Save" id="submit_Id" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
            </div>
        </div>
    </div>

</g:form>
<style>


[data-role="dynamic-fields"] > .form-inline [data-role="add"] {
    display: none;
}

[data-role="dynamic-fields"] > .form-inline:last-child [data-role="add"] {
    display: inline-block;
}

[data-role="dynamic-fields"] > .form-inline:last-child [data-role="remove"] {
    display: none;
}
</style>
<script>
    $(function() {
        // Remove button click
        $(document).on(
            'click',
            '[data-role="dynamic-fields"] > .form-inline [data-role="remove"]',
            function(e) {
                e.preventDefault();
                $(this).closest('.form-inline').remove();
            }
        );
        // Add button click
        $(document).on(
            'click',
            '[data-role="dynamic-fields"] > .form-inline [data-role="add"]',
            function(e) {
                e.preventDefault();
                var container = $(this).closest('[data-role="dynamic-fields"]');
                new_field_group = container.children().filter('.form-inline:first-child').clone();
                new_field_group.find('input').each(function(){
                    $(this).val('');
                });
                container.append(new_field_group);
            }
        );
    });

</script>

<script>
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function Validate(oForm) {
        var responseValue;
        var productColor = document.getElementById("productColor").value;
        var productDetails = document.getElementById("productDetails").value;
        var frontImageName = document.getElementById("frontImageName").value;
        var backImageName = document.getElementById("backImageName").value;
        var sideImageName = document.getElementById("sideImageName").value;
        var specialImageName = document.getElementById("specialImageName").value;

        if(frontImageName.length>0 || backImageName.length>0 || sideImageName.length>0 ||specialImageName.length>0) {
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

                    }

                }
            }}
        if(frontImageName.length>0){

            var jForm = new FormData();

            jForm.append("Image", $('#frontImageName').get(0).files[0]);
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
        if(backImageName.length>0){
            var jForm = new FormData();

            jForm.append("Image", $('#backImageName').get(0).files[0]);
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
        if(sideImageName.length>0){
            var jForm = new FormData();

            jForm.append("Image", $('#sideImageName').get(0).files[0]);
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
        if(specialImageName.length>0){

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


                }
            });
        }

        if(productDetails==''){
            bootbox.alert({
                message: "product Name must be selected",
                size: 'small'
            });
            document.getElementById("productDetails").focus();
            return false;
        }

        if(productColor==''){
            bootbox.alert({
                message: "Color must be selected",
                size: 'small'
            });
            document.getElementById("productColor").focus();
            return false;
        }
        else if(frontImageName.length==0){
            bootbox.alert({
                message: "FrontImage must be choosen",
                size: 'small'
            });
            return false;
        }
        else if(backImageName.length==0){
            bootbox.alert({
                message: "BackImage must be choosen",
                size: 'small'
            });
            return false;
        }
        else if(sideImageName.length==0){
            bootbox.alert({
                message: "SideImage must be choosen",
                size: 'small'
            });
            return false;
        }
        else if(specialImageName.length==0){
            bootbox.alert({
                message: "specialImage must be choosen",
                size: 'small'
            });
            return false;
        }






        return responseValue;
    }

</script>


</body>
</html>