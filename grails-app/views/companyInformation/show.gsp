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
            <label class="control-label col-sm-4">Company Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.companyName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Proprietor:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.proprietorName} </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Location:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.location}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Email Address:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.emailAddress}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Mobile No:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.mobileNUmber}</div>


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Phone No:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.phoneNumber}</div>


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Logo:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/logo",file: "${companyInformationInstance.logoImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

</form>

<div class="col-lg-12">
    <g:link action="edit" id="${companyInformationInstance?.id}" controller="companyInformation" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>