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
<g:form action="save" controller="companyInformation" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate(this);">
    <g:hiddenField name="id" value="${companyInformationInstance?.id}"></g:hiddenField>




    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Company Name:</label>
            <div class="col-sm-6">
                <g:textField name="companyName" id="companyName" class="form-control" value="${companyInformationInstance?.companyName}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Proprietor:</label>
            <div class="col-sm-6">
                <g:textField name="proprietorName" id="proprietorName" class="form-control" value="${companyInformationInstance?.proprietorName}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Location:</label>
            <div class="col-sm-6">
                <g:textField name="location" id="location" class="form-control" value="${companyInformationInstance?.location}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Email Address:</label>

            <div class="col-sm-5">
                <g:textField name="emailAddress" id="emailAddress" placeholder="example@email.com" class="form-control" value="${companyInformationInstance?.emailAddress}"/>
            </div>


        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Mobile No:</label>
            <div class="col-sm-6">
                <g:textField name="mobileNumber" id="mobileNumber" class="form-control" value="${companyInformationInstance?.mobileNUmber}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="form-group">
            <label class="control-label col-sm-2">Phone No::</label>
            <div class="col-sm-6">
                <g:textField name="phoneNumber" id="phoneNumber" class="form-control" value="${companyInformationInstance?.phoneNumber}"/>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Upload logo:</label>
            <div class="col-sm-6">
                <g:field type="file" name="logoImageName" class="form-control-file" id="logoImageName"/>
                %{--<small id="fileHelp" class="form-text text-muted"></small>--}%
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

    window.onbeforeunload = preventMultipleSubmissions;
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

    function ValidateUpdate(oForm) {
        var blnValid=false;
        var responseValue;
        var companyName = document.getElementById("companyName").value;
        var logoImageName = document.getElementById("logoImageName").value;
        var location = document.getElementById("location").value;
        var emailAddress = document.getElementById("emailAddress").value;
        var mobileNumber = document.getElementById("mobileNumber").value;
        var phoneNumber = document.getElementById("phoneNumber").value;
        var proprietorName = document.getElementById("proprietorName").value;

        if(companyName==''){
            bootbox.alert({
                message: "companyName must not be blank",
                size: 'small'
            });
            document.getElementById("companyName").focus();
            return false;
        }
        else if(proprietorName==''){
            bootbox.alert({
                message: "proprietorName must not be blank",
                size: 'small'
            });
            document.getElementById("proprietorName").focus();
            return false;
        }

        else if(location==''){
            bootbox.alert({
                message: "location must not be blank",
                size: 'small'
            });
            document.getElementById("location").focus();
            return false;
        }
        if(emailAddress==''){
            bootbox.alert({
                message: "emailAddress must not be blank",
                size: 'small'
            });
            document.getElementById("emailAddress").focus();
            return false;
        }
                else{
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if(!emailAddress.match(re)){
                bootbox.alert({
                    message: "emailAddress is invalid",
                    size: 'small'
                });
                document.getElementById("emailAddress").focus();
                return false;

            }
        }

        if(mobileNumber==''){
            bootbox.alert({
                message: "mobileNumber must not be blank",
                size: 'small'
            });
            document.getElementById("mobileNumber").focus();
            return false;
        }

        else if(phoneNumber==''){
            bootbox.alert({
                message: "phoneNumber must not be blank",
                size: 'small'
            });
            document.getElementById("phoneNumber").focus();
            return false;
        }
        else if(logoImageName.length>0){
            var arrInputs = oForm.getElementsByTagName("input");
            for (var i = 0; i < arrInputs.length; i++) {
                var oInput = arrInputs[i];
                if (oInput.type == "file") {
                    var sFileName = oInput.value;
                    if (sFileName.length > 0) {
                        for (var j = 0; j < _validFileExtensions.length; j++) {
                            var sCurExtension = _validFileExtensions[j];
                            if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                blnValid = true;
                                break;
                            }
                        }

                        if (!blnValid) {
                            bootbox.alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                            return false;
                        }


                    }

                }
            }

        }
if(blnValid==true){
            var jForm = new FormData();

            jForm.append("Image", $('#logoImageName').get(0).files[0]);
            $.ajax({
                url: "${createLink(controller:'companyInformation', action:'checkPhoto')}",
                type: "POST",
                data: jForm,
                mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData: false,
                async: false,
                success: function (result) {
                    if(result=="Photo bad format"){
                        bootbox.alert({
                            message: "Image bad format",
                            size: 'small'
                        });
                        responseValue=false;

                    }


                }
            });
        }



        return responseValue;
    }

</script>

</body>
</html>