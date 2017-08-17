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
<g:link action="create" controller="productSubCategorySpecify" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="productSubCategorySpecify" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-4">Sub-Category Specification Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productSubCategorySpecifyInstance.specificationName}</div>
            </div>
        </div>
    </div>


</form>
<div class="col-lg-12">
    <g:link action="edit" id="${productSubCategorySpecifyInstance?.id}" controller="productSubCategorySpecify" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productSubCategorySpecifyInstance?.id}" controller="productSubCategorySpecify" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>