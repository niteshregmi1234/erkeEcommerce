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
<g:link action="create" controller="product" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="product" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Product Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productDetails.productName}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Color:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productColor.colorName}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Front Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.frontImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Back Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.backImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Side Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productInstance.sideImageName])}" height="100" style="margin-left: -1%">



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


</form>

<div class="col-lg-12">
    <g:link action="edit" id="${productInstance?.id}" controller="product" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productInstance?.id}" controller="product" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>