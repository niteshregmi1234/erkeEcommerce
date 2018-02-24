<%--
  Created by IntelliJ IDEA.
  User: hemanta
  Date: 2/7/18
  Time: 1:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminYamsaa">
    <title></title>
</head>

<body>
<g:form action="changeIsLatest" controller="product" class="form-horizontal">
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">IsLatest:</label>
            <div class="col-sm-3">
                <g:select name="isLatest" from="${['TRUE','FALSE']}"
                          keys="${[1,0]}" class="form-control"/>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2"></label>
            <div class="col-sm-6">
                <g:submitButton name="save" value="Save" id="submit_Id" onclick="return confirm('Are you sure want to confirm?')" class="btn btn-default"></g:submitButton>
            </div>
        </div>
    </div>
</g:form>
<script>
    function preventMultipleSubmissions() {
        $('#submit_Id').prop('disabled', true);
    }
    window.onbeforeunload = preventMultipleSubmissions;
</script>
</body>
</html>