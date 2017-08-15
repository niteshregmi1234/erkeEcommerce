

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="productDetails">Choose Product Name:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker" id="productDetails" name="productDetails" value="${productInstance?.productDetails?.id}"
                          from="${ProductDetails.list()}" optionKey="id" optionValue="productName" data-show-subtext="true"
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
            <label class="control-label col-sm-4">Upload FrontImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="frontImageName" class="form-control-file" id="frontImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload BackImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="backImageName" class="form-control-file" id="backImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload SideImage:</label>
            <div class="col-sm-6">
                <g:field type="file" name="sideImageName" class="form-control-file" id="sideImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
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

            else if(productDetails==''){
                bootbox.alert({
                    message: "product Name must be selected",
                    size: 'small'
                });
                document.getElementById("productDetails").focus();
                return false;
            }

            else if(productColor==''){
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

            else if(productDetails==''){
                bootbox.alert({
                    message: "product name must be selected",
                    size: 'small'
                });
                document.getElementById("productDetails").focus();
                return false;
            }





            return responseValue;
        }

    </script>

