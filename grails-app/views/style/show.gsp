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
            <label class="control-label col-sm-2">Applied Style:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${styleManagementInstance.style.name}</div>

            </div>
        </div>
    </div>


</form>


<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <g:link action="edit" controller="style" id="${styleManagementInstance.id}" class="btn btn-primary navbar-btn">Edit</g:link>
        </div>
    </div>
</div>

</div>
</body>
</html>