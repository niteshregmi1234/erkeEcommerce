<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/13/2017
  Time: 12:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">

    <title></title>
</head>

<body>
<g:link action="create" controller="Product" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="Product" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Product Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;"><g:link action="show" id="${productInstance.productDetails.id}" controller="productDetails"> ${productInstance.productDetails.productNameWithBrand}</g:link></div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Color:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;"><g:link action="show" controller="productColor" id="${productInstance.productColor.id}"> ${productInstance.productColor.colorName}</g:link></div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsLatest:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.isLatest}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsFeatured:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.isFeatured}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Priority Number:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.priorityNumber}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Special Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.specialImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
</form>
&nbsp;
<div class="col-lg-12" style="margin-left: 180px;">
    <button id="addView" class="btn" style="display: none;">Add more View</button>
    <button id="cancelView" class="btn" style="display:none;">Cancel</button>

</div>
&nbsp;
<div style="display: none;" id="moreView">
    <g:form action="saveViewOfImages"  controller="Product" class="form-horizontal" enctype="multipart/form-data" onsubmit="return Validate(this);">
        <g:hiddenField name="id" value="${productInstance.id}"></g:hiddenField>
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
        </div>
        <!-- /div.col-md-12 -->
        <g:hiddenField name="numberOfImageSets" id="numberOfImageSets" value="1"></g:hiddenField>
        <div class="col-lg-12">
            <div class="form-group">
                <label class="control-label col-sm-2"></label>

                <div class="col-sm-6">
                    <g:submitButton name="save" value="Save Views" id="submit_Id" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
                </div>
            </div>
        </div>

    </g:form>

</div>
&nbsp;
<div class="container" id="viewList" style="display: none;">
    <div class="col-lg-12">
        <p class="text-muted" id="deleteView" style=" margin-left: 155px;"></p>
    </div>
    <table class="table" style="margin-left: 170px;width: 845px;">
        <thead>
        <tr>
            <th>Thumbnail Image</th>
            <th>Medium Image</th>
            <th>Large Image</th>
            <th>Action</th>
        </tr>
        </thead>
    </table>
    <div class="col-lg-12" id="listView">
        <g:each in="${ProductView.findAllByDelFlagAndProduct(false,productInstance)}" var="list" status="i">
            <div class="viewsProduct" style="margin-left: 170px;">
                <div id="rowOfViews${i}">
                    <div class="col-sm-3">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.thumbnailImageName])}" width="100">

                    </div>
                    <div class="col-sm-3">

                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.mediumImageName])}" width="100">

                    </div>
                    <div class="col-sm-3">
                        <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.zoomImageName])}" width="100">

                    </div>
                </div>
                <div id="editOfViews${i}" style="display: none;">
                    <div class="col-sm-3">
                        <input type="file" class="form-control editThumbnailImageName" id="editThumbnailImageName${i}" name="editThumbImageName${i}">

                    </div>
                    <div class="col-sm-3">
                        <input type="file" class="form-control editMediumImageName" id="editMediumImageName${i}" name="editMediumImageName${i}">
                    </div>
                    <div class="col-sm-3">
                        <input type="file" class="form-control editZoomImageName" id="editZoomImageName${i}" name="editZoomImageName${i}">
                    </div>
                </div>

                <div class="col-sm-3">
                    <a  class="btn btn-primary navbar-btn" style="width: 67px;" id="edit${list.id}" onclick="edit(${list.id},${i});">Edit</a><br>
                    <a class="deleteView btn btn-danger navbar-btn" onclick="deleteView(${list.id},this);" id="delete${list.id}">Delete</a>

                    <a class="btn btn-primary navbar-btn" style="width: 67px;margin-top:-20px;display:none;" id="update${list.id}" onclick="updateView(${list.id},${i},this);">Update</a><br>
                    <a class="btn btn-danger navbar-btn" style="width: 67px;display: none;" id="undo${list.id}" onclick="undo(${list.id},${i});">Undo</a>

                </div>

            </div>

        </g:each>
        <script>
            function edit(id,i){
                $("#update"+id).show();
                $("#undo"+id).show();
                $("#editOfViews"+i).show();
                $("#rowOfViews"+i).hide();
                $("#delete"+id).hide();
                $("#edit"+id).hide();
            }
            function updateView(id,i,evt){
                bootbox.confirm({
                    message: "Are you sure want to update this view?",
                    buttons: {
                        cancel: {
                            label: '<i class="fa fa-times"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="fa fa-check"></i> Confirm'
                        }
                    },
                    callback: function (result) {
                        if(result==true){
                            var d=document.getElementsByClassName("modal");
                            for(j=0;j<d.length;j++){
                                $(d[j]).modal('toggle');}
                            var response;
                            var editThumbnailImage=document.getElementById("editThumbnailImageName"+i);
                            var editMediumImage=document.getElementById("editMediumImageName"+i);
                            var editZoomImage=document.getElementById("editZoomImageName"+i);
                            var arrInput=[editThumbnailImage,editMediumImage,editZoomImage];
                            for (var k = 0; k < arrInput.length; k++) {
                                var oInputs = arrInput[k];
                                if (oInputs.type == "file") {
                                    var sFileName = oInputs.value;
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
                                    else{
                                        bootbox.alert({
                                            message: "Image must be choosen",
                                            size: 'small'
                                        });
                                        return false;
                                    }


                                }
                            }
                            if(editThumbnailImage.value.length>0){
                                jForm = new FormData();
                                jForm.append("Image", $("#editThumbnailImageName"+i).get(0).files[0]);
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
                                            response= false;

                                        }
                                        else{
                                            response=true;
                                        }
                                    }
                                });

                            }
                            if(editMediumImage.value.length>0){
                                jForm = new FormData();
                                jForm.append("Image", $("#editMediumImageName"+i).get(0).files[0]);
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
                                            response= false;

                                        }
                                        else{
                                            response=true;
                                        }


                                    }
                                });

                            }
                            if(editZoomImage.value.length>0){
                                jForm = new FormData();
                                jForm.append("Image", $("#editZoomImageName"+i).get(0).files[0]);
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
                                            response= false;

                                        }
                                        else{
                                            response=true;

                                        }


                                    }
                                });

                            }
                            if(response){
                                jForm = new FormData();
                                jForm.append("editThumbnailImage", $("#editThumbnailImageName"+i).get(0).files[0]);
                                jForm.append("editMediumImage", $("#editMediumImageName"+i).get(0).files[0]);
                                jForm.append("editZoomImage", $("#editZoomImageName"+i).get(0).files[0]);
                                jForm.append("viewId",id);
                                $.ajax({
                                    url: "${createLink(controller:'product', action:'saveViewOfImages')}",
                                    type: "POST",
                                    data: jForm,
                                    mimeType: "multipart/form-data",
                                    contentType: false,
                                    cache: false,
                                    processData: false,
                                    async: false,
                                    success: function (result) {
                                        if(result=="successfully edited the view") {
                                            $('#listView').load(document.URL +  ' #listView');
                                        $('#deleteView').html(result);
                                        }
                                    }
                                });

                            }

                        }


                    }
                });
            }
            function undo(id,i){
                $("#rowOfViews"+i).show();
                $("#delete"+id).show();
                $("#edit"+id).show();
                $("#update"+id).hide();
                $("#undo"+id).hide();
                $("#editOfViews"+i).hide();
            }

        </script>
        %{--<button class="btn btn-primary add" data-role="add">--}%
        %{--<span class="glyphicon glyphicon-plus"></span>--}%
        %{--</button>--}%
        %{--<button class="btn btn-danger remove" data-role="remove" id="remove">--}%
        %{--<span class="glyphicon glyphicon-remove"></span>--}%
        %{--</button>--}%
    </div>  <!-- /div.form-inline -->
</div>  <!-- /div[data-role="dynamic-fields"] -->


<div class="col-lg-12">
    <g:link action="edit" id="${productInstance?.id}" controller="Product" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productInstance?.id}" controller="Product" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
<g:if test="${ProductView.findAllByDelFlagAndProduct(false,productInstance)}">
    <script>
        $('#addView').show();

        $('#viewList').show();
    </script>

</g:if>
<g:if test="${ProductView.findAllByDelFlagAndProduct(false,productInstance).size()==0}">
    <script>
        $('#moreView').show();
        $('#viewList').hide();

    </script>
</g:if>
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
    $( "#addView" ).click(function() {
        $('#moreView').show();
        $('#cancelView').show();
        $('#addView').hide();


    });
    $( "#cancelView" ).click(function() {
        $('#addView').show();

        $('#cancelView').hide();
        $('#moreView').hide();
    });
</script>
<script>
    var jForm = new FormData();

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
        for(i=0;i<thumbnailImageName.length;i++) {
            var thumbnailImage=document.getElementById("thumbnailImageName"+i).value;
            var mediumImage=document.getElementById("mediumImageName"+i).value;
            var zoomImage=document.getElementById("zoomImageName"+i).value;
            if (thumbnailImage.length > 0) {


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
    function deleteView(id,evt){
        bootbox.confirm({
//                    title: "Destroy planet?",
            message: "Are you sure want to delete this view?",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancel'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> Confirm'
                }
            },
            callback: function (result) {
                if(result==true){
                    $.ajax({
                        url: "${createLink(controller:'product', action:'deleteView')}",
                        global: false,
                        type: "POST",
                        data: { "id":id },
                        cache: false,
                        async: false,
                        success: function (text) {
                            if(text=="successfully deleted the view"){
                                $('#listView').load(document.URL +  ' #listView');
                            }
                            $('#deleteView').html(text);
                            if ($(".viewsProduct").length < 2)
                            {
                                location.reload();
                            }
                        }

                    });
                }
            }
        });

        evt.preventDefault();
    }

</script>

</body>
</html>