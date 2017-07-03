
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="productCategory">Choose Category:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker" id="productCategory" name="productCategory" value="${productInstance?.productCategory?.id}"
                          from="${ProductCategory.findAllByStatusShow(true)}" optionKey="id" optionValue="categoryName" data-show-subtext="true"
                          data-live-search="true" title="choose Category "/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="productSubCategory">Choose Sub-Category:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker" id="productSubCategory" name="productSubCategory" value="${productInstance?.productSubCategory?.id}"
                          from="${ProductSubCategory.findAllByStatusShow(true)}" optionKey="id" optionValue="subCategoryName" data-show-subtext="true"
                          data-live-search="true" title="choose Sub-Category "/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="productSize">Choose Size:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker" id="productSize" name="productSize" value="${productInstance?.productSize?.id}"
                          from="${ProductSize.findAllByStatusShow(true)}" optionKey="id" optionValue="sizeName" data-show-subtext="true"
                          data-live-search="true" title="choose size "/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="productColor">Choose Color:</label>

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
            <label class="control-label col-sm-4">Choose Name:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="productName" name="productName" value="${productInstance?.productName?.id}"
                          from="${ProductName.list()}" optionKey="id" optionValue="productName" data-show-subtext="true"
                          data-live-search="true" title="choose name"/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose ProductBrand:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="productBrand" name="productBrand" value="${productInstance?.productBrand?.id}"
                          from="${ProductBrand.findAllByStatusShow(true)}" optionKey="id" optionValue="brandName" data-show-subtext="true"
                          data-live-search="true" title="choose brand "/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Price:</label>
            <div class="col-sm-6">
                <g:textField name="price" id="price" class="form-control" value="${productInstance?.price}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">IsSale:</label>
            <div class="col-sm-6">
                <g:select name="isSale" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productInstance?.isSale}" class="form-control"/>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Discount:</label>

            <div class="col-sm-5">
                <g:textField name="discountPercentage" id="discountPercentage" class="form-control" value="${productInstance?.discountPercentage}"/>
            </div>
            <label class="input-group-addon control-label col-sm-1">%</label>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">IsFeatured:</label>
            <div class="col-sm-6">
                <g:select name="isFeatured" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productInstance?.isFeatured}" class="form-control"/>


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">IsLatest:</label>
            <div class="col-sm-6">
                <g:select name="isLatest" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productInstance?.isLatest}" class="form-control"/>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">IsMenuBar:</label>
            <div class="col-sm-3">
                <g:select name="isMenuBar" from="${['Enabled','Disabled']}"
                          keys="${[1,0]}" value="${productInstance?.isMenuBar}" class="form-control"/>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Description:</label>
            <div class="col-sm-6">
                <g:textArea name="description" id="descriptionArea" class="form-control" value="${productInstance?.description}"/>
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
            var productCategory = document.getElementById("productCategory").value;
            var productSubCategory = document.getElementById("productSubCategory").value;
            var productColor = document.getElementById("productColor").value;
            var productSize = document.getElementById("productSize").value;
            var productBrand = document.getElementById("productBrand").value;
            var price = document.getElementById("price").value;
            var isSale = document.getElementById("isSale").value;
            var productName = document.getElementById("productName").value;


            var discountPercentage = document.getElementById("discountPercentage").value;
            var description = document.getElementById("descriptionArea").value;

            var frontImageName = document.getElementById("frontImageName").value;
            var backImageName = document.getElementById("backImageName").value;
            var sideImageName = document.getElementById("sideImageName").value;
            if(frontImageName.length>0 || backImageName.length>0 || sideImageName.length>0) {
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
            if(price.length>0){
                var price = document.getElementById("price").value;

                var valid = (price.match(/^-?\d*(\.\d+)?$/));

                if(!valid){
                    document.getElementById("price").focus();
                    bootbox.alert({
                        message: "invalid price",
                        size: 'small'
                    });
                    return false;

                }
            }
if(discountPercentage.length>0){
    var discountPercentage = document.getElementById("discountPercentage").value;

    var valid = (discountPercentage.match(/^-?\d*(\.\d+)?$/));

    if(!valid){
        document.getElementById("discountPercentage").focus();
        bootbox.alert({
            message: "invalid discount",
            size: 'small'
        });
        return false;

    }
    else if(discountPercentage<0 ||discountPercentage>100 ){
        document.getElementById("discountPercentage").focus();
        bootbox.alert({
            message: "discount % must be between 0 and 100",
            size: 'small'
        });
        return false;

    }
}
            if(productCategory==''){
                bootbox.alert({
                    message: "Category must be selected",
                    size: 'small'
                });
                document.getElementById("productCategory").focus();
                return false;
            }
            else if(productSubCategory==''){
                bootbox.alert({
                    message: "sub-Category must be selected",
                    size: 'small'
                });
                document.getElementById("productSubCategory").focus();
                return false;
            }

            else if(productSize==''){
                bootbox.alert({
                    message: "Size must be selected",
                    size: 'small'
                });
                document.getElementById("productSize").focus();
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

            else if(productName==''){
                bootbox.alert({
                    message: "name must be selected",
                    size: 'small'
                });
                document.getElementById("productName").focus();
                return false;
            }

            else if(productBrand==''){
                bootbox.alert({
                    message: "brand must be selected",
                    size: 'small'
                });
                document.getElementById("productBrand").focus();
                return false;
            }
            else if(price==''){
                bootbox.alert({
                    message: "price must not be blank",
                    size: 'small'
                });
                document.getElementById("price").focus();
                return false;
            }
            else if(description==''){
                bootbox.alert({
                    message: "description must not be blank",
                    size: 'small'
                });
                document.getElementById("descriptionArea").focus();
                return false;
            }

            else if(isSale=="true") {

                if (discountPercentage == '') {

                    bootbox.alert({
                        message: "discount must not be blank",
                        size: 'small'
                    });
                    document.getElementById("discountPercentage").focus();
                    return false;
                }


            }



            return responseValue;
        }

    </script>

