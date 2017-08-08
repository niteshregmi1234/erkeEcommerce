<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 6/25/17
  Time: 8:56 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa"/>

    <title>Yamsaa</title>
</head>
<body>
<g:if test="${flash.message}">
    <script>
        window.addEventListener("load",function(){
            bootbox.alert({
                message:"${flash.message+" "+session.adminUser.firstName}",
                callback: function(){
                    location.reload();
                }

            });

        });

    </script>
</g:if>

</body>
</html>