<%--
  Created by IntelliJ IDEA.
  User: Hemanta
  Date: 3/13/2017
  Time: 12:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>
<body>
<g:form action="save" controller="style" class="form-horizontal">
    <g:hiddenField name="id" value="${styleManagementInstance?.id}"></g:hiddenField>

    <div class="col-lg-12" style="margin-top: 15%;">
        <div class="form-group ">
            <label class="control-label col-sm-2" for="style">Choose Style:</label>

            <div class="col-sm-6">
                <g:select class="selectpicker" id="style" name="style" value="${styleManagementInstance?.style?.id}"
                          from="${Style.list()}" optionKey="id" optionValue="name" data-show-subtext="true"
                          data-live-search="true" title="choose style "/>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
    <div class="form-group">
        <label class="control-label col-sm-2"></label>

        <div class="col-sm-6">
            <g:submitButton name="update" value="Update" id="submit_Id" class="btn btn-default"></g:submitButton>
        </div>
    </div>
</div>
</g:form>
<script>
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }




</script>

</body>
</html>