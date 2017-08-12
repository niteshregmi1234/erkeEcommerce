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

</head>
<body>
<g:form action="save" controller="seasonManagement" class="form-horizontal" onsubmit="return ValidateUpdate();">
    <g:hiddenField name="id" value="${seasonsManagementInstance?.id}"></g:hiddenField>

    <div class="col-lg-12" style="margin-top: 15%;">
        <div class="form-group">
            <label class="control-label col-sm-4">Choose ${seasonsManagementInstance.seasonStatusName} Season:</label>
            <div class="col-sm-6">
                <g:select class="selectpicker" id="season" name="season" value="${seasonsManagementInstance?.seasons?.id}"
                          from="${Seasons.list()}" optionKey="id" optionValue="seasonName" data-show-subtext="true"
                          data-live-search="true" title="choose season "/>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Advertise About Season:</label>
            <div class="col-sm-6">
                <g:textArea name="preAdvertiseDescription" id="preAdvertiseDescription" class="form-control" value="${seasonsManagementInstance?.preAdvertiseDescription}"/>

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



    function ValidateUpdate(){
        var preAdvertiseDescription = document.getElementById("preAdvertiseDescription").value;
        if(preAdvertiseDescription==''){
            bootbox.alert({
                message: "advertise description must not be blank",
                size: 'small'
            });
            document.getElementById("preAdvertiseDescription").focus();
            return false;
        }

    }

</script>

</body>
</html>