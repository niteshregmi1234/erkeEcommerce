
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Season Name:</label>
        <div class="col-sm-6">
            <g:textField name="seasonName" id="seasonName" class="form-control" value="${seasonsInstance?.seasonName}"/>
        </div>
    </div>
</div>
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Greetings:</label>
        <div class="col-sm-6">
            <g:textField name="greetings" id="greetings" class="form-control" value="${seasonsInstance?.greetings}"/>
        </div>
    </div>
</div>

<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2">Describe Season:</label>
        <div class="col-sm-6">
            <g:textArea name="descriptionOfSeason" id="descriptionOfSeason" class="form-control" value="${seasonsInstance?.descriptionOfSeason}"/>
        </div>
    </div>
</div>
<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Greetings to Shop:</label>

        <div class="col-sm-6">
            <g:textField name="askingForShopping" id="askingForShopping" class="form-control" value="${seasonsInstance?.askingForShopping}"/>
        </div>


    </div>
</div>


<div class="col-lg-6">
    <div class="form-group">
        <label class="control-label col-sm-4">Upload Image:</label>
        <div class="col-sm-6">
            <g:field type="file" name="imageName" class="form-control-file" id="imageName"/>
            %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
        </div>
    </div>
</div>
    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate(oForm) {
            var responseValue;
            var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

            var seasonName = document.getElementById("seasonName").value;

            var askingForShopping = document.getElementById("askingForShopping").value;
            var imageName = document.getElementById("imageName").value;

            if(seasonName.length==0){
                document.getElementById("seasonName").focus();
                bootbox.alert({
                    message: "seasonName must not be blank",
                    size: 'small'
                });
                return false;

            }

            else if(askingForShopping.length==0){
                document.getElementById("seasonName").focus();
                bootbox.alert({
                    message: "greetings to Shop must not be blank",
                    size: 'small'
                });
                return false;

            }
            else if(imageName.length==0){
                document.getElementById("imageName").focus();
                bootbox.alert({
                    message: "image must be choosen",
                    size: 'small'
                });
                return false;

            }
            else {
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
                                    url: "${createLink(controller:'seasons', action:'checkPhoto')}",
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
