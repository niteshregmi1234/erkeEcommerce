<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/10/2017
  Time: 12:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>

<body>
<form action="/adminUserInformation/save" method="post" class="form-horizontal" id="reg_form">

    <g:render template="form"></g:render>
<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <button type="submit" name="save" value="Save" class="btn btn-default">Save</button>
        </div>
    </div>
</div>
</form>
</body>
</html>