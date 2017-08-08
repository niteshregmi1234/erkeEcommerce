<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/20/17
  Time: 10:00 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
${test.name}
${test.role}
<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:test.imageName])}" height="100" style="margin-left: -1%">

<g:link action="edit" controller="imageRender" id="${test.id}">Edit</g:link>
</body>
</html>