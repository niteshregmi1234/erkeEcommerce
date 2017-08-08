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
<g:link action="create" controller="seasons" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="seasons" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Image:</label>
            <div class="col-sm-6">

                <div style="margin-top: 7px;">${seasonsInstance.seasonName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Show Status:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seasonsInstance.greetings}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Description Of Season:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seasonsInstance.descriptionOfSeason}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Greetings to Shop:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seasonsInstance.askingForShopping}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Image:</label>
            <div class="col-sm-6">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:seasonsInstance.imageName])}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

</form>
<div class="col-lg-12">
    <g:link action="edit" id="${seasonsInstance?.id}" controller="seasons" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${seasonsInstance?.id}" controller="seasons" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>