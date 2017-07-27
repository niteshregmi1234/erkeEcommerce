<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/20/17
  Time: 9:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<<g:form action="save" controller="adminHome">
    Name:<g:textField name="name" ></g:textField>
    role:<g:textField name="role"></g:textField>
    <g:submitButton name="button" value="Save"></g:submitButton>
</g:form>
</body>
</html>