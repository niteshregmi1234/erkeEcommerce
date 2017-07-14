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
            <label class="control-label col-sm-4">Location1:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.location1}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Location2:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.location2}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Location3:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.location3}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Location4:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.location4}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Email Address:</label>
            <div class="col-sm-3">
                <div style="margin-top: 7px;">${companyInformationInstance.emailAddress}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Mobile No:</label>
            <div class="col-sm-3">
                <div style="margin-top: 7px;">${companyInformationInstance.mobileNUmber}</div>


            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Phone No:</label>
            <div class="col-sm-3">
                <div style="margin-top: 7px;">${companyInformationInstance.phoneNumber}</div>


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Logo:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/companyInformation",file: "${companyInformationInstance.logoImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Cover Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/companyInformation",file: "${companyInformationInstance.coverImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Shop View:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/companyInformation",file: "${companyInformationInstance.shopInsideViewImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Map View:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/companyInformation",file: "${companyInformationInstance.mapImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Where we are:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${companyInformationInstance.descriptionWhereWeAre}</div>


            </div>
        </div>
    </div>

</form>
<div class="col-lg-6">
    <div class="form-group ">
        <label class="control-label col-sm-4"></label>
<div class="col-sm-6">
    <g:link action="edit" id="${companyInformationInstance?.id}" controller="companyInformation" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
        </div></div>
</body>
</html>