<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 5/16/18
  Time: 11:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="adminYamsaa">
</head>

<body>
<g:form action="save" controller="yarsaaProducts" class="form-horizontal" enctype="multipart/form-data" onsubmit="return Validate(this);">

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
                <g:field type="file" name="specialImageName" class="form-control" id="specialImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <table class="table" style="margin-left: 205px;width: 800px;">
  <thead>
    <tr>
      <th>Thumbnail Image</th>
      <th>Medium Image</th>
      <th>Large Image</th>
    </tr>
  </thead>
  </table>
            <div class="col-lg-12">
                <div data-role="dynamic-fields" style="margin-left: 170px;">
                    <div class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="thumbnailImageName0">Thumbnail Image</label>
                            <input type="file" class="form-control thumbnailImageName" id="thumbnailImageName0" name="thumbnailImageName0">
                        </div>
                        <span>--</span>
                        <div class="form-group">
                            <label class="sr-only" for="mediumImageName0">Medium Image</label>
                            <input type="file" class="form-control mediumImageName" id="mediumImageName0" name="mediumImageName0">
                        </div>
                        <span>--</span>
                        <div class="form-group">
                            <label class="sr-only" for="zoomImageName0">Large Image</label>
                            <input type="file" class="form-control zoomImageName" id="zoomImageName0" name="zoomImageName0">
                        </div>
                        <span>--</span>


                        <button class="btn btn-primary add" data-role="add">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <button class="btn btn-danger remove" data-role="remove" id="remove">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                        <br><br>
                    </div>  <!-- /div.form-inline -->
                </div>  <!-- /div[data-role="dynamic-fields"] -->
            </div>  <!-- /div.col-md-12 -->
<g:hiddenField name="numberOfImageSets" id="numberOfImageSets" value="1"></g:hiddenField>
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
    var thumbnailImageName=document.getElementsByClassName("thumbnailImageName");
    var mediumImageName=document.getElementsByClassName("mediumImageName");
    var zoomImageName=document.getElementsByClassName("zoomImageName");

    $(function() {
        // Remove button click
        $(document).on(
            'click',
            '[data-role="dynamic-fields"] > .form-inline [data-role="remove"]',
            function(e) {
                e.preventDefault();
                $(this).closest('.form-inline').remove();
                var addClass=document.getElementsByClassName("add");
                var removeClass=document.getElementsByClassName("remove");
                var numItems = $('.form-inline').length;
                if(numItems<2){
                    for(var i=0;i<addClass.length;i++){
                        addClass[i].style.display="inline-block";
                    }
                    for(i=0;i<removeClass.length;i++){
                        removeClass[i].style.display="none";

                    }

                }
                thumbnailImageName=document.getElementsByClassName("thumbnailImageName");
                mediumImageName=document.getElementsByClassName("mediumImageName");
                zoomImageName=document.getElementsByClassName("zoomImageName");

                for(i=0;i<thumbnailImageName.length;i++){
                    thumbnailImageName[i].setAttribute("name","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("name","mediumImageName"+i);
                    zoomImageName[i].setAttribute("name","zoomImageName"+i);
                    thumbnailImageName[i].setAttribute("id","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("id","mediumImageName"+i);
                    zoomImageName[i].setAttribute("id","zoomImageName"+i);

                }
                document.getElementById("numberOfImageSets").value=thumbnailImageName.length;
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
                var addClass=document.getElementsByClassName("add");
                var removeClass=document.getElementsByClassName("remove");
                var numItems = $('.form-inline').length;
if(numItems>1){
for(var i=0;i<addClass.length;i++){
    addClass[i].style.display="inline-block";
}
    for(i=0;i<removeClass.length;i++){
        removeClass[i].style.display="inline-block";

    }
}
                thumbnailImageName=document.getElementsByClassName("thumbnailImageName");
                mediumImageName=document.getElementsByClassName("mediumImageName");
                zoomImageName=document.getElementsByClassName("zoomImageName");

                for(i=0;i<thumbnailImageName.length;i++){
                    thumbnailImageName[i].setAttribute("name","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("name","mediumImageName"+i);
                    zoomImageName[i].setAttribute("name","zoomImageName"+i);
                    thumbnailImageName[i].setAttribute("id","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("id","mediumImageName"+i);
                    zoomImageName[i].setAttribute("id","zoomImageName"+i);

                }
                document.getElementById("numberOfImageSets").value=thumbnailImageName.length;

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
        var specialImageName = document.getElementById("specialImageName").value;
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
        if (specialImageName.length > 0) {

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
                    if (result == "Photo bad format") {
                        bootbox.alert({
                            message: "Image bad format",
                            size: 'small'
                        });
                        responseValue = false;

                    }


                }
            });
        }
        for(i=0;i<thumbnailImageName.length;i++) {
            var thumbnailImage=document.getElementById("thumbnailImageName"+i).value;
            var mediumImage=document.getElementById("mediumImageName"+i).value;
            var zoomImage=document.getElementById("zoomImageName"+i).value;
            if (thumbnailImage.length > 0) {

                jForm = new FormData();

                jForm.append("Image", $("#thumbnailImageName"+i).get(0).files[0]);
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
                        if (result == "Photo bad format") {
                            bootbox.alert({
                                message: "Image bad format",
                                size: 'small'
                            });
                            responseValue = false;

                        }


                    }
                });

            }
            if (mediumImage.length > 0) {
                jForm = new FormData();

                jForm.append("Image", $('#mediumImageName'+i).get(0).files[0]);
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
                        if (result == "Photo bad format") {
                            bootbox.alert({
                                message: "Image bad format",
                                size: 'small'
                            });
                            responseValue = false;

                        }


                    }
                });
            }
            if (zoomImage.length > 0) {
                jForm = new FormData();

                jForm.append("Image", $('#zoomImageName'+i).get(0).files[0]);
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
                        if (result == "Photo bad format") {
                            bootbox.alert({
                                message: "Image bad format",
                                size: 'small'
                            });
                            responseValue = false;

                        }


                    }
                });
            }
        }

        if (specialImageName.length == 0) {
            bootbox.alert({
                message: "specialImage must be choosen",
                size: 'small'
            });
            return false;
        }


for(i=0;i<thumbnailImageName.length;i++) {
    thumbnailImage=document.getElementById("thumbnailImageName"+i).value;
    mediumImage=document.getElementById("mediumImageName"+i).value;
    zoomImage=document.getElementById("zoomImageName"+i).value;


    if (thumbnailImage.length==0) {
        bootbox.alert({
            message: "thumbnail Image must be choosen",
            size: 'small'
        });
        return false;

    }
    else if(mediumImage.length==0) {
        bootbox.alert({
            message: "medium Image must be choosen",
            size: 'small'
        });
        return false;
    }


    else if (zoomImage.length ==0) {
        bootbox.alert({
            message: "zoom Image must be choosen",
            size: 'small'
        });
        return false;
    }





}



        return responseValue;
    }

</script>

</body>
</html>