<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/13/2017
  Time: 12:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>
<body>
<g:form action="save" controller="productColor" class="form-horizontal" onsubmit="return Validate();">
    <g:hiddenField name="id" value="${productColorInstance?.id}"></g:hiddenField>

<g:render template="form"></g:render>
<div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <g:submitButton name="update" value="Update" id="submitId" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
        </div>
    </div>
</div>
</g:form>
</body>
</html>