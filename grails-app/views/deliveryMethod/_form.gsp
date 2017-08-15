
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="briefDescribe">DeliveryMethod:</label>

            <div class="col-sm-4">
                <g:textField name="briefDescribe" id="briefDescribe" value="${deliveryMethodInstance?.briefDescribe}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="briefDescribe">Delivery Detail:</label>

            <div class="col-sm-4">
                <g:textField name="detailDescribe" id="detailDescribe" value="${deliveryMethodInstance?.detailDescribe}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="isShowStatus">Show Status:</label>

            <div class="col-sm-4">
                <g:select name="isShowStatus" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" value="${deliveryMethodInstance?.isShowStatus?1:0}" class="form-control"/>


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
            var responseValue;
            var briefDescribe = document.getElementById("briefDescribe").value;
            var detailDescribe = document.getElementById("detailDescribe").value;



            if(briefDescribe==''){
                $("#briefDescribe").css("border", "1px solid red");
                bootbox.alert({
                    message: "deliveryMethod Name must not be blank!",
                    size: 'small'
                });
                document.getElementById("briefDescribe").focus();
                responseValue=false;
            }
                    else if(detailDescribe==''){
                bootbox.alert({
                    message: "delivery Detail must not be blank!",
                    size: 'small'
                });
                document.getElementById("detailDescribe").focus();
                responseValue=false;

            }

            return responseValue;

        }

    </script>

