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
<g:link action="create" controller="productName" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="productName" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productNameInstance.productName}</div>
            </div>
        </div>
    </div>

</form>
<div class="col-lg-12">
    <g:link action="edit" id="${productNameInstance?.id}" controller="productName" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productNameInstance?.id}" controller="productName" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>