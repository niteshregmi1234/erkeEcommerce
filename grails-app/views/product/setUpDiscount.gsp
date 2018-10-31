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
<g:form action="changeDiscount" controller="product" class="form-horizontal" onsubmit="return Validate();">
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Discount:</label>

            <div class="col-sm-2">
                <g:textField name="discountPercentage" id="discountPercentage" class="form-control"/>
            </div>
            <label class="input-group-addon control-label col-sm-1">%</label>


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
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Category:</label>

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
        if(brand=='' && category =='' && specification=='' && subCategory==''){
            bootbox.alert({
                message: "must be selected any one",
                size: 'small'
            });
            return false;
        }
        else if (discountPercentage == '') {
            bootbox.alert({
                message: "operation cannot be formed without discount value",
                size: 'small'
            });
            document.getElementById("discountPercentage").focus();
            return false;
        }
        else if (discountPercentage.length > 0) {

            var valid1 = (discountPercentage.match(/^-?\d*(\.\d+)?$/));

            if (!valid1) {
                document.getElementById("discountPercentage").focus();
                bootbox.alert({
                    message: "invalid discount",
                    size: 'small'
                });
                return false;

            }
            else if (discountPercentage < 0 || discountPercentage >= 100 ||) {
                document.getElementById("discountPercentage").focus();
                bootbox.alert({
                    message: "discount % must be between 0 and 100",
                    size: 'small'
                });
                return false;

            }
        }

    }
</script>
</body>
</html>