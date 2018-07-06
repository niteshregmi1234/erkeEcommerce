<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 2/4/18
  Time: 2:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>

<body>
<g:form action="save" controller="aids" class="form-horizontal" enctype="multipart/form-data" onsubmit="return Validate();" >
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="group">Choose Ad for:</label>
            <div class="col-sm-4">
                <select class="selectpicker" id="group" name="group">
                    <option value="customize">Custom</option>
                    <option value="product">Product</option>
                </select>
            </div>
        </div>

    </div>
    <div class="col-lg-12" id="discountTypeRange">
        <div class="form-group">
            <label class="control-label col-sm-2" for="discountType">Input discount as:</label>
            <div class="col-sm-4">
                <select class="selectpicker" id="discountType" name="discountType">
                    <option value="noRange">No Range</option>
                    <option value="range">Range</option>
                </select>
            </div>
        </div>
    </div>
    <div id="discountWithRange" style="display:none;">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-sm-4">Discount From:</label>
                <div class="col-sm-4">
                    <g:textField name="discountFrom" id="discountFrom" class="form-control"/>
                </div>
                <label class="input-group-addon control-label col-sm-1">%</label>


            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-sm-4">Discount To:</label>
                <div class="col-sm-4">
                    <g:textField name="discountTo" id="discountTo" class="form-control"/>
                </div>
                <label class="input-group-addon control-label col-sm-1">%</label>


            </div>
        </div>

    </div>
    <div class="col-lg-12" id="discountWithoutRange">
        <div class="form-group">
            <label class="control-label col-sm-2">Discount:</label>
            <div class="col-sm-2">
                <g:textField name="discount" id="discount" class="form-control"/>
            </div>
            <label class="input-group-addon control-label col-sm-1">%</label>


        </div>
    </div>

    <div id="customizeAd">
        <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="category">Category:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker"  multiple="multiple" id="category" name="category"
                          from="${productCategoryArrayList}" optionKey="id" optionValue="categoryName"
                          title="choose category"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Specification:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker"  multiple="multiple" id="specification" name="specification"
                          from="${productSubCategorySpecifyArrayList}" optionKey="id" optionValue="specificationName"
                          title="choose specification"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Sub-Category:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker"  multiple="multiple" id="subCategory" name="subCategory"
                          from="${productSubCategoryArrayList}" optionKey="id" optionValue="subCategoryName"
                          title="choose subCategory"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Brand:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker"  multiple="multiple" id="brand" name="brand"
                          from="${productBrandList}" optionKey="id" optionValue="brandName"
                          title="choose Brand "/>
            </div>
        </div>
    </div>
    </div>
    <div id="productAd" style="display: none">
        <div class="col-lg-12">
            <div class="form-group ">
                <label class="control-label col-sm-2" for="product">Product:</label>
                <div class="col-sm-3">
                    <g:select class="selectpicker"  multiple="multiple" id="product" name="product"
                              from="${Product.findAllByDelFlag(false)}" optionKey="id" optionValue="productSpecificationName"
                              title="choose product" data-live-search="true"/>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Ad Image:</label>
            <div class="col-sm-3">
                <g:field type="file" name="imageName" class="form-control" id="imageName"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2"></label>
            <div class="col-sm-6">
                <g:submitButton name="save" value="Save" id="submit_Id" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
            </div>
        </div>
    </div>

</g:form>
<script>
    $('#group').on('change', function() {
        if(this.value=="product"){
            $('#discountTypeRange').hide();
            $('#discountWithoutRange').hide();
            $('#discountWithRange').hide();
            $('#customizeAd').hide();
            $('#productAd').show();
        }
        else{
            var discountType=$('#discountType');
            $('#productAd').hide();
if(discountType.val()=="range"){
    $('#discountWithoutRange').hide();
    $('#discountWithRange').show();
}
else{
    $('#discountWithRange').hide();
    $('#discountWithoutRange').show();
}
            $('#discountTypeRange').show();
            $('#customizeAd').show();
        }
    });
    $('#discountType').on('change', function() {
        if(this.value=="range"){
            $('#discountWithoutRange').hide();
            $('#discountWithRange').show();
        }
        else{
            $('#discountWithRange').hide();
            $('#discountWithoutRange').show();
        }
    });
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }

    window.onbeforeunload = preventMultipleSubmissions;
    function Validate() {
        var discountPercentage = document.getElementById("discountPercentage").value;
        var brand = document.getElementById("brand").value;
        var category = document.getElementById("category").value;
        var specification = document.getElementById("specification").value;
        var subCategory = document.getElementById("subCategory").value;

    }
</script>
</body>
</html>