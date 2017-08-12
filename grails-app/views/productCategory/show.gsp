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
<g:link action="create" controller="productCategory" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="productCategory" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Category Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productCategoryInstance.categoryName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Cover Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategoryInstance.coverImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Shop Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategoryInstance.shoppingImageName])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Menu Image1:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategoryInstance.menuImage1])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Menu Image2:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategoryInstance.menuImage2])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Menu Image3:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:productCategoryInstance.menuImage3])}" height="100" style="margin-left: -1%">



            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Show Status:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productCategoryInstance.statusShow} </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productCategoryInstance.categoryDescription} </div>
            </div>
        </div>
    </div>

</form>
<div class="col-lg-12">
    <g:link action="edit" id="${productCategoryInstance?.id}" controller="productCategory" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productCategoryInstance?.id}" controller="productCategory" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>