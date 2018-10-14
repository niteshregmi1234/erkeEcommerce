
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="keywords">Keywords:</label>

            <div class="col-sm-4">
                <g:textField name="keywords" id="keywords" value="${seoOptimizationInstance?.keywords}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="author">Author:</label>

            <div class="col-sm-4">
                <g:textField name="author" id="author" value="${seoOptimizationInstance?.author}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="description">Description:</label>

            <div class="col-sm-4">
                <g:textField name="description" id="description" value="${seoOptimizationInstance?.description}" class="form-control"/>
                %{--<g:formatDate format="yyyy-MM-dd" class="form-control"/>--}%
                %{--<input type="email" class="form-control" id="email" placeholder="Enter email">--}%
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="robots">Robots:</label>

            <div class="col-sm-4">
                <g:textField name="robots" id="robots" value="${seoOptimizationInstance?.robots}" class="form-control"/>
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


    </script>



