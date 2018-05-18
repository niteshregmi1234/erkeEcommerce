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
<g:link action="create" controller="yarsaaProducts" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="yarsaaProducts" class="btn btn-primary navbar-btn">List</g:link>
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
            <label class="control-label col-sm-4">Special Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.specialImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <g:if test="${productViewList}">
<div class="container">
    <table class="table" style="margin-left: 100px;width: 970px;">
        <thead>
        <tr>
            <th>SN</th>
            <th>Thumbnail Image</th>
            <th>Medium Image</th>
            <th>Large Image</th>
        </tr>
        </thead>
        </table>
    <div class="col-lg-12">
        <g:each in="${productViewList}" var="list" status="i">
        <div data-role="dynamic-fields" style="margin-left: 170px;">
            <div class="form-inline">
<div style="margin-left: -70px;">
                   ${i}
</div>
                <div>
                <div class="col-sm-4">
                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.thumbnailImageName])}" width="100">

                </div>

                <div class="col-sm-4">

                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.mediumImageName])}" width="100">

                </div>
                <div class="col-sm-4">
                    <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:list.zoomImageName])}" width="100">

                </div>
                </div>
                %{--<button class="btn btn-primary add" data-role="add">--}%
                    %{--<span class="glyphicon glyphicon-plus"></span>--}%
                %{--</button>--}%
                %{--<button class="btn btn-danger remove" data-role="remove" id="remove">--}%
                    %{--<span class="glyphicon glyphicon-remove"></span>--}%
                %{--</button>--}%
                <br><br>
            </div>  <!-- /div.form-inline -->
        </div>  <!-- /div[data-role="dynamic-fields"] -->
        </g:each>
    </div>  <!-- /div.col-md-12 -->

</div>
    </g:if>

</form>
<g:if test="${productViewList.size()==0}">
    <g:form action="saveViewOfImages" controller="yarsaaProducts" class="form-horizontal" enctype="multipart/form-data">
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
                    <label class="sr-only" for="thumbnailImageName">Thumbnail Image</label>
                    <input type="file" class="form-control thumbnailImageName" id="thumbnailImageName" name="thumbnailImageName0">
                </div>
                <span>--</span>
                <div class="form-group">
                    <label class="sr-only" for="mediumImageName">Medium Image</label>
                    <input type="file" class="form-control mediumImageName" id="mediumImageName" name="mediumImageName0">
                </div>
                <span>--</span>
                <div class="form-group">
                    <label class="sr-only" for="zoomImageName">Large Image</label>
                    <input type="file" class="form-control zoomImageName" id="zoomImageName" name="zoomImageName0">
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
</g:if>
<div class="col-lg-12">
    <g:link action="edit" id="${productInstance?.id}" controller="yarsaaProducts" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productInstance?.id}" controller="yarsaaProducts" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
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
                var thumbnailImageName=document.getElementsByClassName("thumbnailImageName");
                var mediumImageName=document.getElementsByClassName("mediumImageName");
                var zoomImageName=document.getElementsByClassName("zoomImageName");

                for(i=0;i<thumbnailImageName.length;i++){
                    thumbnailImageName[i].setAttribute("name","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("name","mediumImageName"+i);
                    zoomImageName[i].setAttribute("name","zoomImageName"+i);

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
                var thumbnailImageName=document.getElementsByClassName("thumbnailImageName");
                var mediumImageName=document.getElementsByClassName("mediumImageName");
                var zoomImageName=document.getElementsByClassName("zoomImageName");

                for(i=0;i<thumbnailImageName.length;i++){
                    thumbnailImageName[i].setAttribute("name","thumbnailImageName"+i);
                    mediumImageName[i].setAttribute("name","mediumImageName"+i);
                    zoomImageName[i].setAttribute("name","zoomImageName"+i);

                }
                document.getElementById("numberOfImageSets").value=thumbnailImageName.length;

            }
        );
    });

</script>

</body>
</html>