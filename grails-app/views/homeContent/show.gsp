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
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box1 Title:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box1Title}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box2 Title:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box2Title}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box3 Title:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box3Title}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box1 Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box1Description}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box2 Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box2Description}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Box3 Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.box3Description}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Cover DownImg Title:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.coverDownImageTitle}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Cover DownImg Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.coverDownImageDescription}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">special Brand Description Up:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.specialBrandImageDescriptionUp}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">special Brand Description Down:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${homeContentInstance.specialBrandImageDescriptionDown}</div>
            </div>
        </div>
    </div>

</form>
<div class="col-lg-6">
    <div class="form-group ">
        <label class="control-label col-sm-4"></label>
<div class="col-sm-6">
    <g:link action="edit" id="${homeContentInstance?.id}" controller="homeContent" onclick="confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
        </div></div>
</body>
</html>