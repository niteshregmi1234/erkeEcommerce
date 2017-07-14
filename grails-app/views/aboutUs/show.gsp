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
            <label class="control-label col-sm-2">CoverImage:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.coverImage}")}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">aboutUsImg1:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">aboutUsImg2:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs2Image}")}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">aboutUsImg3:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs3Image}")}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">aboutUsImg4:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs4Image}")}" height="100" style="margin-left: -1%">


            </div>
        </div>
    </div>


    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">about Us Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.aboutUsDescription}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Left Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteLeftImage}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Right Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.quoteRightImage}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Quote:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.quote}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Video:</label>
            <div class="col-sm-6">
                <iframe width="200" height="100" src="https://www.youtube.com/embed/${aboutUsInstance.videoName}" frameborder="0" allowfullscreen>
            </iframe>
            </div>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Video-Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.videoDescrptionImage}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">video Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.videoDescription}</div>

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special Product1:</label>

            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.specialProduct1.productSpecificationName}</div>

            </div>


        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special Product2:</label>

            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.specialProduct2.productSpecificationName}</div>

            </div>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special SubCategory:</label>

            <div class="col-sm-6">
                <div style="margin-top: 7px;">${aboutUsInstance.specialProductSubCategory.subCategoryName}</div>

            </div>


        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.specialProductSubCategoryImage}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Background Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.backgroundImage}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>


</form>


<div class="col-lg-6" style="margin-left: 12%">
    <g:link action="edit" id="${aboutUsInstance?.id}" controller="aboutUs" class="btn btn-primary navbar-btn">Edit</g:link>

</div>
</body>
</html>