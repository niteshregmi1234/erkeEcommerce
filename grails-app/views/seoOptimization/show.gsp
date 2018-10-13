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
<g:if test!="${SeoOptimization.list()}">
<g:link action="create" controller="seoOptimization" class="btn btn-primary navbar-btn">New</g:link>
</g:if>
<g:link action="list" controller="seoOptimization" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Keywords:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seoOptimizationInstance.brandName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Author:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seoOptimizationInstance?.author}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Robots:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seoOptimizationInstance.robots}</div>
            </div>
        </div>
    </div>


    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seoOptimizationInstance.description}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Google Bots:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seoOptimizationInstance.googleBots}</div>
            </div>
        </div>
    </div>
</form>
<div class="col-lg-12">
    <g:link action="edit" id="${seoOptimizationInstance?.id}" controller="seoOptimization" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>