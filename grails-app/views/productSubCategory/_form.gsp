
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="subCategoryName">Sub-Category Name:</label>

            <div class="col-sm-4">
                <g:textField name="subCategoryName" id="subCategoryName" value="${productSubCategoryInstance?.subCategoryName}" class="form-control"/>

            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productSubCategoryInstance?.statusShow}" class="form-control"/>


            </div>
        </div>
    </div>
    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate() {
            var subCategoryName = document.getElementById("subCategoryName").value;
if(subCategoryName==''){
    $("#subCategoryName").css("border", "1px solid red");
    bootbox.alert({
        message: "Sub-Category Name must not be blank!",
        size: 'small'
    });
    document.getElementById("subCategoryName").focus();
    return false;
}


        }

    </script>


