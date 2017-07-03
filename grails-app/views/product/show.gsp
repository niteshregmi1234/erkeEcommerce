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
<g:link action="create" controller="product" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="product" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Category:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productCategory.categoryName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Sub-category:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productSubCategory.subCategoryName} </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Color:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productColor.colorName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Size:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productSize.sizeName}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Front Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Back Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/allProducts/backImage",file: "${productInstance.backImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Side Image:</label>
            <div class="col-sm-6">
                <img src="${resource(dir: "images/allProducts/sideImage",file: "${productInstance.sideImageName}")}" height="100" style="margin-left: -1%">

            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productName.productName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Price:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">Rs.${productInstance.price}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Brand:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.productBrand.brandName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsSale:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.isSale}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Discount Percentage:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.discountPercentage} %</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsLatest:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.isLatest}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsFeatured:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.isFeatured}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">IsMenuBar:</label>
            <div class="col-sm-3">
                <div style="margin-top: 7px;">${productInstance.isMenuBar}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productInstance.description}</div>
            </div>
        </div>
    </div>

</form>
%{--<img src="${resource(dir: "images/allProducts",file: "${productInstance.image_name}")}" height="100" style="margin-left: 25%">--}%

<div class="col-lg-12">
    <g:link action="edit" id="${productInstance?.id}" controller="product" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productInstance?.id}" controller="product" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>