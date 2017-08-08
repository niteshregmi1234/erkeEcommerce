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
<<g:form action="save" controller="imageRender" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${test.id}"></g:hiddenField>
    Name:<g:textField name="name" value="${test.name}"></g:textField>
    role:<g:textField name="role" value="${test.role}"></g:textField>
    Image:<g:field type="file" name="image"></g:field>
    <g:submitButton name="button" value="Save"></g:submitButton>
</g:form>
</body>
</html>