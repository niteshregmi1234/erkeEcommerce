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
<form action="/aids/save" method="post" class="form-horizontal" enctype="multipart/form-data" id="adCreate">
    <h6 style="color: #761c19;">${flash.message}</h6>

    <g:hiddenField name="id" id="aidId" value="${aidsInstance?.id}"></g:hiddenField>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2" for="group">Choose Ad for:</label>
            <div class="col-sm-4">
                <g:select id="group" name="group" from="${[customize: 'Custom', product: 'Product']}"
                          optionKey="key" optionValue="value"  value="${aidsInstance?.aidType}" class="selectpicker"/>
            </div>
        </div>

    </div>
    <div id="productSetUpDiscount">
        <div class="col-lg-12">
            <div class="form-group ">
                <label class="control-label col-sm-2" for="isDiscountForProduct">Set up with:</label>
                <div class="col-sm-3">
                    <g:select id="isDiscountForProduct" name="isDiscountForProduct" from="${[noDiscount: 'No discount', discount: 'discount']}"
                              optionKey="key" optionValue="value"  value="${aidsInstance?.isDiscountForProduct}" class="selectpicker"/>
                                   </div>
            </div>
        </div>

    </div>

    <div class="col-lg-12" id="discountTypeRange" style="display: none;">
        <div class="form-group">
            <label class="control-label col-sm-2" for="discountType">Input discount as:</label>
            <div class="col-sm-4">
                <g:select id="discountType" name="discountType" from="${[noRange: 'No Range', range: 'Range']}"
                          optionKey="key" optionValue="value"  value="${aidsInstance?.discountType}" class="selectpicker"/>
            </div>
        </div>
    </div>
    <div id="discountWithRange" style="display:none;">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-sm-4">Discount From:</label>
                <div class="col-sm-4">
                    <g:textField name="discountFrom" id="discountFrom" class="form-control" value="${aidsInstance?.discountFrom}"/>
                </div>
                <label class="input-group-addon control-label col-sm-1">%</label>


            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-sm-4">Discount To:</label>
                <div class="col-sm-4">
                    <g:textField name="discountTo" id="discountTo" class="form-control" value="${aidsInstance?.discountTo}"/>
                </div>
                <label class="input-group-addon control-label col-sm-1">%</label>


            </div>
        </div>

    </div>
    <div class="col-lg-12" id="discountWithoutRange" style="display: none;">
        <div class="form-group">
            <label class="control-label col-sm-2">Discount:</label>
            <div class="col-sm-2">
                <g:textField name="discount" id="discount" class="form-control" value="${aidsInstance?.discount}"/>
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
                          from="${productCategoryArrayList}" optionKey="id" data-live-search="true" optionValue="categoryName"
                          title="choose category"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Specification:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker"  multiple="multiple" id="specification" name="specification"
                          from="${productSubCategorySpecifyArrayList}" data-live-search="true" optionKey="id" optionValue="specificationName"
                          title="choose specification"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Sub-Category:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" data-live-search="true" multiple="multiple" id="subCategory" name="subCategory"
                          from="${productSubCategoryArrayList}" optionKey="id" optionValue="subCategoryName"
                          title="choose subCategory"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group ">
            <label class="control-label col-sm-4" for="brand">Brand:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker"  data-live-search="true" multiple="multiple" id="brand" name="brand"
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
                    <g:select class="selectpicker form-control"  multiple="multiple" id="product" name="product"
                              from="${Product.findAllByDelFlag(false)}" optionKey="id" optionValue="productSpecificationName"
                              title="choose product" data-live-search="true"/>
                </div>
            </div>
        </div>

    </div>
    <style>
        #productAd .dropdown-menu {
            width: 700px !important;
        }
    </style>
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
                <label class="control-label col-sm-2">Something about ad*:</label>
                <div class="col-sm-4">
                    <g:textField name="adDescribe" id="adDescribe" class="form-control" value="${aidsInstance?.adDescribeRaw}"/>
                </div>
                <small class="help-block" style="display: none; color:#a94442;" id="notUniqueEmail">This field must be unique</small>

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

</form>
<script>
    $(document).ready(function() {
        $('#adCreate').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            excluded: [':disabled', ':hidden', ':not(:visible)'],
            fields: {
                discountFrom: {
                    validators: {

                        notEmpty: {
                            message: 'Please supply discount from '
                        },
                        remote: {
                            url: "${createLink(controller:'aids', action:'checkFloat')}",
                            // Send { username: 'its value', email: 'its value' } to the back-end
                            data: function(validator, $field, value) {
                                return {
                                    discount: validator.getFieldElements('discountFrom').val()

                                };

                            },
                            message: 'invalid discount from',
                            type: 'POST'
                        }

                    }
                },
                discountTo: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply discount to'

                        },
                        remote: {
                            url: "${createLink(controller:'aids', action:'checkFloat')}",
                            // Send { username: 'its value', email: 'its value' } to the back-end
                            data: function(validator, $field, value) {
                                return {
                                    discount: validator.getFieldElements('discountTo').val()

                                };

                            },
                            message: 'invalid discount to',
                            type: 'POST'
                        }

                    }
                },
                discount: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply discount'

                        },
                        remote: {
                            url: "${createLink(controller:'aids', action:'checkFloat')}",
                            // Send { username: 'its value', email: 'its value' } to the back-end
                            data: function(validator, $field, value) {
                                return {
                                    discount: validator.getFieldElements('discount').val()

                                };

                            },
                            message: 'invalid discount',
                            type: 'POST'
                        }

                    }
                },

                adDescribe: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply something for ad description'
                        }
                    }
                },
                product: {
                    validators: {
                        notEmpty: {
                            message: 'Please select product'
                        }
                    }
                },

                imageName: {
            validators: {
                file: {
                    extension: 'jpeg,png,jpg,gif',
                    type: 'image/jpeg,image/png,image/jpg,image/gif',
                    message: 'The selected file is not valid'
                }

            }
        }

    },
            submitHandler: function(form) {
                var responseValue=true;
                var selectGroup=true;
                var group=document.getElementById("group").value;
var category=document.getElementById("category").value;
                var subCategory=document.getElementById("subCategory").value;
                var brand=document.getElementById("brand").value;
                var specification=document.getElementById("specification").value;
                var aidId=document.getElementById("aidId").value;
if(group=="customize"){
 if(!category && !subCategory && !brand && !specification){
     bootbox.alert("either brand or category or subcategory or specification must be selected");
     selectGroup=false;
     responseValue=false;
     $('#submit_Id').prop('disabled', false);
 }
}
if(!aidId){
    if(document.getElementById("imageName").files.length==0){
        bootbox.alert("image must be choosen");
        selectGroup=false;
        responseValue=false;
        $('#submit_Id').prop('disabled', false);
    }

}
                if(selectGroup==true){
                $.ajax({
                    type: "POST",
                    url: "${createLink(controller:'aids', action:'checkForAdSubmit')}",
                    data: $('form.form-horizontal').serialize(),
                    async:false,
                    success: function (msg) {
                        if(msg=="no"){
                            $("#notUniqueEmail").show();
                            document.getElementById("adDescribe").focus();
                            $("#adDescribe").css("border", "1px solid #a94442");
                            responseValue=false;
                        }
                        else{
                            document.getElementById("adCreate").submit();
                        }

                    }
                });
            }
                return responseValue;

            }


        });
    });
</script>

<script>
    $( document ).ready(function() {

        if($('#group').val()=="product"){
            $('#customizeAd').hide();
            var isDiscountForProduct=$('#isDiscountForProduct').val();
            if(isDiscountForProduct=="discount"){
                $('#productAd').hide();
                $('#discountTypeRange').show();
                if($('#discountType').val()=="range"){
                    $('#discountWithoutRange').hide();
                    $('#discountWithRange').show();
                }
                else{
                    $('#discountWithoutRange').show();
                    $('#discountWithRange').hide();

                }
            }
            else {
                $('#productAd').show();
                $('#discountTypeRange').hide();
                        $('#discountWithoutRange').hide();
                        $('#discountWithRange').hide();
            }

            }

        else{
            $('#customizeAd').show();
            $('#productAd').hide();
            var isDiscountForProduct=$('#isDiscountForProduct').val();
            if(isDiscountForProduct=="discount"){
                $('#discountTypeRange').show();
                if($('#discountType').val()=="range"){
                    $('#discountWithoutRange').hide();
                    $('#discountWithRange').show();
                }
                else{
                    $('#discountWithoutRange').show();
                    $('#discountWithRange').hide();

                }
            }
            else {
                $('#discountTypeRange').hide();
                $('#discountWithoutRange').hide();
                $('#discountWithRange').hide();
            }

        }
    $('#group').on('change', function() {
        $('#submit_Id').prop('disabled', false);

        $('#productSetUpDiscount').show();
        if(this.value=="product"){
            $('#customizeAd').hide();
            var isDiscountForProduct=$('#isDiscountForProduct').val();
if(isDiscountForProduct=="discount"){
    $('#productAd').hide();

    $('#discountTypeRange').show();
    if($('#discountType').val()=="range"){
        $('#discountWithoutRange').hide();
        $('#discountWithRange').show();
    }
    else{
        $('#discountWithoutRange').show();
        $('#discountWithRange').hide();

    }
}
else{
    $('#productAd').show();
    $('#discountTypeRange').hide();
    $('#discountWithoutRange').hide();
    $('#discountWithRange').hide();
}
        }
        else{
            var discountType=$('#discountType');
            isDiscountForProduct= $('#productSetUpDiscount');
            isDiscountForProduct.show();
            if(isDiscountForProduct=="discount"){

                if(discountType.val()=="range"){
    $('#discountWithoutRange').hide();
    $('#discountWithRange').show();
}
else{
    $('#discountWithRange').hide();
    $('#discountWithoutRange').show();
}}
else{
                $('#discountTypeRange').hide();
                $('#discountWithoutRange').hide();
                $('#discountWithRange').hide();
            }
            $('#productAd').hide();
            $('#customizeAd').show();
        }
    });
    $('#discountType').on('change', function() {
        $('#submit_Id').prop('disabled', false);

        if(this.value=="range"){
            $('#discountWithoutRange').hide();
            $('#discountWithRange').show();
        }
        else{
            $('#discountWithRange').hide();
            $('#discountWithoutRange').show();
        }
    });
    $('#isDiscountForProduct').on('change', function() {
        $('#submit_Id').prop('disabled', false);
        if(this.value=="discount"){

            var discountType=$('#discountTypeRange');
            discountType.show();
            if($('#group').val()=="product"){
                $('#customizeAd').hide();
                $('#productAd').hide();
            }
            else{
                $('#customizeAd').show();
                $('#productAd').hide();
            }
if($('#discountType').val()=="range"){
    $('#discountWithoutRange').hide();
    $('#discountWithRange').show();
}
else{
    $('#discountWithRange').hide();
    $('#discountWithoutRange').show();
}
        }
        else{
            if($('#group').val()=="product"){
                $('#customizeAd').hide();
                $('#productAd').show();
            }
            else{
                $('#customizeAd').show();
                $('#productAd').hide();
            }
            $('#discountTypeRange').hide();
            $('#discountWithRange').hide();
            $('#discountWithoutRange').hide();
        }

    });
    });


</script>
<script type="text/javascript">
    $(document).ready(function() {
        <%
def categoryIdsArray1="${categoryIdsArray}"
def subCategoryIdsArray1="${subCategoryIdsArray}"
def specificationIdsArray1="${specificationIdsArray}"
def brandIdsArray1="${brandIdsArray}"
def productIdsArray1="${productIdsArray}"

%>
        $('#category').selectpicker('val', ${categoryIdsArray1});
        $('#subCategory').selectpicker('val', ${subCategoryIdsArray1});
        $('#specification').selectpicker('val', ${specificationIdsArray1});
        $('#brand').selectpicker('val', ${brandIdsArray1});
        $('#product').selectpicker('val', ${productIdsArray1});

    });

</script>
</body>
</html>