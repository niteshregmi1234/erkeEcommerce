
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="brandName">Brand Name:</label>

            <div class="col-sm-4">
                <g:textField name="brandName" id="brandName" value="${productBrandInstance?.brandName}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="brandName">Company Email:</label>

            <div class="col-sm-4">
                <g:textField name="email" id="email" value="${productBrandInstance?.email}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Priority Number:</label>
            <div class="col-sm-4">
                <g:textField name="priorityNumber" id="priorityNumber" class="form-control" onkeypress="return isNumber(event)" value="${productBrandInstance?.priorityNumber}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Upload LogoImage:</label>
            <div class="col-sm-4">
                <g:field type="file" name="logoName" class="form-control-file" id="logoName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="isTop">Is Top:</label>

            <div class="col-sm-4">
                <g:select name="isTop" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" value="${productBrandInstance?.isTop?1:0}" class="form-control"/>

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" value="${productBrandInstance?.statusShow?1:0}" class="form-control"/>

                         </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Description:</label>

            <div class="col-sm-4">
                <g:textArea name="brandDescription" id="brandDescription" class="form-control" value="${productBrandInstance?.brandDescription}"/>

            </div>
        </div>
    </div>


    <script>
        function validate(sEmail) {
            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

            if (filter.test(sEmail)) {

                return true;

            }

            else {

                return false;

            }
        }

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

        var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;
        function Validate(oForm) {
            var responseValue;

            var brandName = document.getElementById("brandName").value;
            var email = document.getElementById("email").value;

            var brandDescription = document.getElementById("brandDescription").value;
            var logoName = document.getElementById("logoName").value;

            if(logoName.length>0) {
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

                            jForm.append("Image", $('#logoName').get(0).files[0]);
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
if(!validate(email)){
    $("#email").css("border", "1px solid red");
    bootbox.alert({
        message: "email is invalid eg. abc@companyname.com!",
        size: 'small'
    });
    document.getElementById("email").focus();
    return false;
}
            if(brandName==''){
                $("#brandName").css("border", "1px solid red");
                bootbox.alert({
                    message: "brandName must not be blank!",
                    size: 'small'
                });
                document.getElementById("brandName").focus();
                return false;
            }
            else if(logoName==''){
                bootbox.alert({
                    message: "logo must be choosen!",
                    size: 'small'
                });
                document.getElementById("logoName").focus();
                return false;
            }

            else if(brandDescription==''){
                $("#brandDescription").css("border", "1px solid red");
                bootbox.alert({
                    message: "description must not be blank!",
                    size: 'small'
                });
                document.getElementById("brandDescription").focus();
                return false;

            }

return responseValue;
        }

    </script>



