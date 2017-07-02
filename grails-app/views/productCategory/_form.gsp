
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="categoryName">Category Name:</label>

            <div class="col-sm-4">
                <g:textField name="categoryName" id="categoryName" value="${productCategoryInstance?.categoryName}" class="form-control"/>
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
                          keys="${[true,false]}" value="${productCategoryInstance?.statusShow}" class="form-control"/>


                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>

    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate() {
            var categoryName = document.getElementById("categoryName").value;
            if(categoryName==''){
                $("#categoryName").css("border", "1px solid red");
                bootbox.alert({
                    message: "categoryName must not be blank!",
                    size: 'small'
                });
                document.getElementById("categoryName").focus();
                return false;
            }


        }

    </script>

