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
<g:link action="create" controller="adminUserInformation" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="adminUserInformation" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">First Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${adminUserInstance.firstName}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Last Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${adminUserInstance.lastName} </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Email:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${adminUserInstance.email} </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Role:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${adminUserInstance.role} </div>
            </div>
        </div>
    </div>
</form>
<div class="col-lg-12">
    <g:link action="edit" id="${adminUserInstance?.id}" controller="adminUserInformation"  onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:if test="${AdminUserInformation.list().size()>1}">
    <g:link action="delete" id="${adminUserInstance?.id}" controller="adminUserInformation" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>
    </g:if>
</div>
</body>
</html>