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
<form class="form-horizontal">



    <div class="col-lg-12" style="margin-top: 15%;">
        <div class="form-group">
            <label class="control-label col-sm-2">Season:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${seasonsManagementInstance.seasons.seasonName}</div>

            </div>
        </div>
    </div>


</form>


<div class="col-lg-12" style="margin-left: 16%;">
    <g:link action="edit" id="${seasonsManagementInstance?.id}" controller="seasonsManagement" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>