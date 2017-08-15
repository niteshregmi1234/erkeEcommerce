
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="briefDescribe">PaymentMethod:</label>

            <div class="col-sm-4">
                <g:textField name="briefDescribe" id="briefDescribe" value="${paymentMethodInstance?.briefDescribe}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="detailDescribe">Payment Detail:</label>

            <div class="col-sm-4">
                <g:textField name="detailDescribe" id="detailDescribe" value="${paymentMethodInstance?.detailDescribe}" class="form-control"/>
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
                          keys="${[1,0]}" value="${paymentMethodInstance?.isShowStatus? 1 : 0}" class="form-control"/>


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
                    message: "paymentMethod Name must not be blank!",
                    size: 'small'
                });
                document.getElementById("briefDescribe").focus();
                responseValue=false;
            }
                    else if(detailDescribe==''){
                bootbox.alert({
                    message: "payment Detail must not be blank!",
                    size: 'small'
                });
                document.getElementById("detailDescribe").focus();

                responseValue=false;

            }

            return responseValue;

        }

    </script>

