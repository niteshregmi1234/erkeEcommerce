
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="productName">Name:</label>

            <div class="col-sm-4">
                <g:textField name="productName" id="productName" value="${productNameInstance?.productName}" class="form-control"/>
                          </div>
        </div>
    </div>
    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;
        function Validate() {
            var productName = document.getElementById("productName").value;
            if(productName==''){
                $("#brandName").css("border", "1px solid red");
                bootbox.alert({
                    message: "productName must not be blank!",
                    size: 'small'
                });
                document.getElementById("productName").focus();
                return false;
            }


        }

    </script>



