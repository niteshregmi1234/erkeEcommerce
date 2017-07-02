
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="imageName">Upload Image:</label>

            <div class="col-sm-4">

                <g:field type="file" name="imageName" class="form-control-file" id="imageName"/>

                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${coverImageInstance?.statusShow}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="slidePlace">where to Slide?:</label>

            <div class="col-sm-4">
                <g:select name="slidePlace" from="${[DOWN: 'DOWN', UP: 'UP']}"
                          optionKey="key" optionValue="value"  value="${coverImageInstance?.slidePlace}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
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

            var imageName = document.getElementById("imageName").value;
            if(imageName.length==0){
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
