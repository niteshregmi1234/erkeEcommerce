
<div class="col-lg-12">
    <div class="form-group ">
        <label class="control-label col-sm-2" for="productSubCategorySpecify">Choose Specification:</label>

        <div class="col-sm-6">
            <g:select class="selectpicker" id="productSubCategorySpecify" name="productSubCategorySpecify" value="${productSubCategoryInstance?.productSubCategorySpecify?.id}"
                      from="${ProductSubCategorySpecify.list()}" optionKey="id" optionValue="specificationName" data-show-subtext="true"
                      data-live-search="true" title="choose specification "/>
        </div>
    </div>
</div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="subCategoryName">Sub-Category Name:</label>

            <div class="col-sm-4">
                <g:textField name="subCategoryName" id="subCategoryName" value="${productSubCategoryInstance?.subCategoryName}" class="form-control"/>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Upload CoverImage:</label>
            <div class="col-sm-4">
                <g:field type="file" name="coverImageName" class="form-control-file" id="coverImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productSubCategoryInstance?.statusShow}" class="form-control"/>


            </div>
        </div>
    </div>
    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;

        var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

        function Validate(oForm) {
            var responseValue;
            var productSubCategorySpecify = document.getElementById("productSubCategorySpecify").value;
            var subCategoryName = document.getElementById("subCategoryName").value;

            var coverImageName = document.getElementById("coverImageName").value;
            if(productSubCategorySpecify==''){
                $("#subCategoryName").css("border", "1px solid red");
                bootbox.alert({
                    message: "specification must be choosen!",
                    size: 'small'
                });
                document.getElementById("productSubCategorySpecify").focus();
                return false;}
            else if(subCategoryName==''){
    $("#subCategoryName").css("border", "1px solid red");
    bootbox.alert({
        message: "Sub-Category Name must not be blank!",
        size: 'small'
    });
    document.getElementById("subCategoryName").focus();
    return false;
}
            else if(coverImageName.length==0){
                bootbox.alert({
                    message: "coverImageName must be choosen!",
                    size: 'small'
                });
                document.getElementById("coverImageName").focus();
                return false;
            }
            if(coverImageName.length>0) {
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

return responseValue;
        }

    </script>


