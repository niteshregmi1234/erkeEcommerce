
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="categoryName">Category Name:</label>

            <div class="col-sm-4">
                <g:textField name="categoryName" id="categoryName" value="${productCategoryInstance?.categoryName}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
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
        <div class="form-group">
            <label class="control-label col-sm-2">Upload Shop Image:</label>
            <div class="col-sm-2">
                <g:field type="file" name="shoppingImageName" class="form-control-file" id="shoppingImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="menuImage1">Upload menu Image1:</label>

            <div class="col-sm-4">

                <g:field type="file" name="menuImage1" class="form-control-file" id="menuImage1"/>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="menuImage2">Upload menu Image2:</label>

            <div class="col-sm-4">

                <g:field type="file" name="menuImage2" class="form-control-file" id="menuImage2"/>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="menuImage3">Upload menu Image3:</label>

            <div class="col-sm-4">

                <g:field type="file" name="menuImage3" class="form-control-file" id="menuImage3"/>


            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productCategoryInstance?.statusShow}" class="form-control"/>


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

        var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

        function Validate(oForm) {
            var responseValue;
            var categoryName = document.getElementById("categoryName").value;
            var coverImageName = document.getElementById("coverImageName").value;
            var shoppingImageName = document.getElementById("shoppingImageName").value;
            var menuImage1 = document.getElementById("menuImage1").value;
            var menuImage2 = document.getElementById("menuImage2").value;
            var menuImage3 = document.getElementById("menuImage3").value;

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

            if(shoppingImageName.length>0) {
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

                            jForm.append("Image", $('#shoppingImageName').get(0).files[0]);
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
            if(menuImage1.length>0) {
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

                            jForm.append("Image", $('#menuImage1').get(0).files[0]);
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
            if(menuImage2.length>0) {
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

                            jForm.append("Image", $('#menuImage2').get(0).files[0]);
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
            if(menuImage3.length>0) {
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

                            jForm.append("Image", $('#menuImage3').get(0).files[0]);
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

            if(categoryName==''){
                $("#categoryName").css("border", "1px solid red");
                bootbox.alert({
                    message: "categoryName must not be blank!",
                    size: 'small'
                });
                document.getElementById("categoryName").focus();
                responseValue=false;
            }
                    else if(coverImageName==0){
                bootbox.alert({
                    message: "coverImage must be choosen!",
                    size: 'small'
                });
                document.getElementById("coverImageName").focus();
                responseValue=false;

            }
            else if(shoppingImageName==0){
                bootbox.alert({
                    message: "shop Image must be choosen!",
                    size: 'small'
                });
                document.getElementById("shoppingImageName").focus();
                responseValue=false;

            }

            else if(menuImage1==0){
                bootbox.alert({
                    message: "menuImage1 must be choosen!",
                    size: 'small'
                });
                document.getElementById("menuImage1").focus();
                responseValue=false;

            }
            else if(menuImage2==0){
                bootbox.alert({
                    message: "menuImage2 must be choosen!",
                    size: 'small'
                });
                document.getElementById("menuImage2").focus();
                responseValue=false;

            }
            else if(menuImage3==0){
                bootbox.alert({
                    message: "menuImage3 must be choosen!",
                    size: 'small'
                });
                document.getElementById("menuImage3").focus();
                responseValue=false;

            }


            return responseValue;

        }

    </script>

