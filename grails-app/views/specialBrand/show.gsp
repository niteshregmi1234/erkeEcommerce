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
        <div class="form-group">
            <label class="control-label col-sm-4">ProductBrand:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${specialBrandInstance.productBrand.brandName}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">MainImage:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance.brandMainImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe MainImage:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${specialBrandInstance.descriptionMainImage}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Sub-1-Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance.brandSub1ImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Title sub-1-Image:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${specialBrandInstance.titleForSub1Image}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe Sub-1-Image:</label>
            <div style="margin-top: 7px;">${specialBrandInstance.descriptionSub1Image}</div>

            <div class="col-sm-6">
            </div>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Sub-2-Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${specialBrandInstance.brandSub2ImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Title sub-2-Image:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${specialBrandInstance.titleForSub1Image}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Describe Sub-2-Image:</label>

            <div class="col-sm-6">
                <div style="margin-top: 7px;">${specialBrandInstance.descriptionSub2Image}</div>

            </div>


        </div>
    </div>


</form>


<div class="col-lg-6" style="margin-left: 12%">
    <g:link action="edit" id="${specialBrandInstance?.id}" controller="specialBrand" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>