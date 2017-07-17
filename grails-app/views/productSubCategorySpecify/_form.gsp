
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="specificationName">Sub-Category Specification Name:</label>

            <div class="col-sm-4">
                <g:textField name="specificationName" id="specificationName" value="${productSubCategorySpecifyInstance?.specificationName}" class="form-control"/>

            </div>
        </div>
    </div>

    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate() {
            var specificationName = document.getElementById("specificationName").value;

            if(specificationName==''){
    $("#specificationName").css("border", "1px solid red");
    bootbox.alert({
        message: "specificationName must not be blank!",
        size: 'small'
    });
    document.getElementById("specificationName").focus();
    return false;
}

        }

    </script>


