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



    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Image Type:</label>
            <div class="col-sm-3">
                <div style="margin-top: 7px;">${backgroundImageInstance.imageType} </div>

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">BackGround Image:</label>
            <div class="col-sm-3">
                <img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:backgroundImageInstance.imageName])}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>



</form>


<div class="col-lg-12" style="margin-left: 12%">
    <g:link action="edit" id="${backgroundImageInstance?.id}" controller="backgroundImage" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>