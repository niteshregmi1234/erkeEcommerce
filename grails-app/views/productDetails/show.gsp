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
<g:link action="create" controller="productDetails" class="btn btn-primary navbar-btn">New</g:link>
<g:link action="list" controller="productDetails" class="btn btn-primary navbar-btn">List</g:link>
<form class="form-horizontal">
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Category:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.productCategory.categoryName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Sizes:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;"><g:each in="${productSizeList}" var="list">
                    ${list.sizeName}<br>
                </g:each> </div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Sub-category:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.productSubCategory.subCategoryName} </div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Name:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.productName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Price:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">Rs.${productDetailsInstance.price}</div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Brand:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.productBrand.brandName}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">IsSale:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.isSale}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4">Discount Percentage:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.discountPercentage} %</div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Brief Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.briefDescription}</div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2">Detail Description:</label>
            <div class="col-sm-6">
                <div style="margin-top: 7px;">${productDetailsInstance.detailDescription}</div>
            </div>
        </div>
    </div>

</form>

<div class="col-lg-12">
    <g:link action="edit" id="${productDetailsInstance?.id}" controller="productDetails" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Edit</g:link>
    <g:link action="delete" id="${productDetailsInstance?.id}" controller="productDetails" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-primary navbar-btn">Delete</g:link>

</div>
</body>
</html>