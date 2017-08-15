
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="colorName">Color Name:</label>

            <div class="col-sm-4">
                <g:textField name="colorName" id="colorName" value="${productColorInstance?.colorName}" class="form-control"/>
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
                          keys="${[1,0]}" value="${productColorInstance?.statusShow?1:0}" class="form-control"/>

            </div>
        </div>
    </div>

    <script>
        function preventMultipleSubmissions() {
            $('#submit_Id').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;


        function Validate() {
            var colorName = document.getElementById("colorName").value;
            if(colorName==''){
                $("#colorName").css("border", "1px solid red");
                bootbox.alert({
                    message: "colorName must not be blank!",
                    size: 'small'
                });
                document.getElementById("colorName").focus();
                return false;
            }


        }

    </script>


