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
<g:link action="create" controller="productSize" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="productSize" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Size Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productSizeInstance.sizeName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Show Status:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productSizeInstance.statusShow}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Size Details:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productSizeInstance.sizeDetails}</div>
            </div>
        </div>
    </div>

</form>
<div class="col-lg-12">
    <g:link action="edit" id="${productSizeInstance?.id}" controller="productSize" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productSizeInstance?.id}" controller="productSize" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>