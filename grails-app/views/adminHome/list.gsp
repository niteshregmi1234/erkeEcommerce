<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 7/20/17
  Time: 10:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:each in="${testList}" var="list">
    ${list.name}<br>
    ${list.role}<br>
    ${list.testId}<br>
    <g:link action="showNow" params="[id3:list.testId,id4:list.id]">ShowAll</g:link>
    <g:link action="show" params="[testId:list.testId]">Show</g:link>
</g:each>
</body>
</html>