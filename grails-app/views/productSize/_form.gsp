
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="sizeName">Size Name:</label>

            <div class="col-sm-4">
                <g:textField name="sizeName" id="sizeName" value="${productSizeInstance?.sizeName}" class="form-control"/>
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
                          keys="${[true,false]}" value="${productSizeInstance?.statusShow}" class="form-control"/>

            </div>
        </div>
    </div>

    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate() {
            var sizeName = document.getElementById("sizeName").value;
            if(sizeName==''){
                $("#sizeName").css("border", "1px solid red");
                bootbox.alert({
                    message: "sizeName must not be blank!",
                    size: 'small'
                });
                document.getElementById("sizeName").focus();
                return false;
            }


        }

    </script>
