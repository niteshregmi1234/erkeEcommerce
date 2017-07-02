
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="brandName">Brand Name:</label>

            <div class="col-sm-4">
                <g:textField name="brandName" id="brandName" value="${productBrandInstance?.brandName}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="statusShow">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="statusShow" from="${['TRUE','FALSE']}"
                          keys="${[true,false]}" value="${productBrandInstance?.statusShow}" class="form-control"/>

                         </div>
        </div>
    </div>
    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;
        function Validate() {
            var brandName = document.getElementById("brandName").value;
            if(brandName==''){
                $("#brandName").css("border", "1px solid red");
                bootbox.alert({
                    message: "brandName must not be blank!",
                    size: 'small'
                });
                document.getElementById("brandName").focus();
                return false;
            }


        }

    </script>



