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
<g:form action="save" controller="homeContent" class="form-horizontal" enctype="multipart/form-data" onsubmit="return ValidateUpdate();">
    <g:hiddenField name="id" value="${homeContentInstance?.id}"></g:hiddenField>




    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box1 Title:</label>
            <div class="col-sm-6">
                <g:textField name="box1Title" id="box1Title" class="form-control" value="${homeContentInstance?.box1Title}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box1 Description:</label>
            <div class="col-sm-6">
                <g:textField name="box1Description" id="box1Description" class="form-control" value="${homeContentInstance?.box1Description}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box2 Title:</label>
            <div class="col-sm-6">
                <g:textField name="box2Title" id="box2Title" class="form-control" value="${homeContentInstance?.box2Title}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box2 Description:</label>
            <div class="col-sm-6">
                <g:textField name="box2Description" id="box2Description" class="form-control" value="${homeContentInstance?.box2Description}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box3 Title:</label>
            <div class="col-sm-6">
                <g:textField name="box3Title" id="box3Title" class="form-control" value="${homeContentInstance?.box3Title}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Box3 Description:</label>
            <div class="col-sm-6">
                <g:textField name="box3Description" id="box3Description" class="form-control" value="${homeContentInstance?.box3Description}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Cover DownImg Title:</label>
            <div class="col-sm-6">
                <g:textField name="coverDownImageTitle" id="coverDownImageTitle" class="form-control" value="${homeContentInstance?.coverDownImageTitle}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Description Cover Image:</label>
            <div class="col-sm-6">
                <g:textField name="coverDownImageDescription" id="coverDownImageDescription" class="form-control" value="${homeContentInstance?.coverDownImageDescription}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special Brand Describe Up:</label>
            <div class="col-sm-6">
                <g:textField name="specialBrandImageDescriptionUp" id="specialBrandImageDescriptionUp" class="form-control" value="${homeContentInstance?.specialBrandImageDescriptionUp}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label class="control-label col-sm-4">Special Brand Describe Down:</label>
            <div class="col-sm-6">
                <g:textField name="specialBrandImageDescriptionDown" id="specialBrandImageDescriptionDown" class="form-control" value="${homeContentInstance?.specialBrandImageDescriptionDown}"/>
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

    function ValidateUpdate() {

                var box1Title = document.getElementById("box1Title").value;
        var box2Title = document.getElementById("box2Title").value;
        var box3Title = document.getElementById("box3Title").value;
        var box1Description = document.getElementById("box1Description").value;
        var box2Description = document.getElementById("box2Description").value;
        var box3Description = document.getElementById("box3Description").value;
        var coverDownImageTitle = document.getElementById("coverDownImageTitle").value;
        var coverDownImageDescription = document.getElementById("coverDownImageDescription").value;
        var specialBrandImageDescriptionUp = document.getElementById("specialBrandImageDescriptionUp").value;
        var specialBrandImageDescriptionDown = document.getElementById("specialBrandImageDescriptionDown").value;

        if(box1Title==''){
            bootbox.alert({
                message: "box1Title must not be blank",
                size: 'small'
            });
            document.getElementById("box1Title").focus();
            return false;
        }
        else if(box1Description==''){
            bootbox.alert({
                message: "box1Description must not be blank",
                size: 'small'
            });
            document.getElementById("box1Description").focus();
            return false;
        }
        else if(box2Title==''){
            bootbox.alert({
                message: "box2Title must not be blank",
                size: 'small'
            });
            document.getElementById("box2Title").focus();
            return false;
        }
        else if(box2Description==''){
            bootbox.alert({
                message: "box2Description must not be blank",
                size: 'small'
            });
            document.getElementById("box2Description").focus();
            return false;
        }
        else if(box3Title==''){
            bootbox.alert({
                message: "box3Title must not be blank",
                size: 'small'
            });
            document.getElementById("box3Title").focus();
            return false;
        }
        else if(box3Description==''){
            bootbox.alert({
                message: "box3Description must not be blank",
                size: 'small'
            });
            document.getElementById("box3Description").focus();
            return false;
        }
        else if(coverDownImageTitle==''){
            bootbox.alert({
                message: "coverDownImageTitle must not be blank",
                size: 'small'
            });
            document.getElementById("coverDownImageTitle").focus();
            return false;
        }
        else if(coverDownImageDescription==''){
            bootbox.alert({
                message: "coverDownImageDescription must not be blank",
                size: 'small'
            });
            document.getElementById("coverDownImageDescription").focus();
            return false;
        }
        else if(specialBrandImageDescriptionUp==''){
            bootbox.alert({
                message: "specialBrandImageDescriptionUp must not be blank",
                size: 'small'
            });
            document.getElementById("specialBrandImageDescriptionUp").focus();
            return false;
        }
        else if(specialBrandImageDescriptionDown==''){
            bootbox.alert({
                message: "specialBrandImageDescriptionDown must not be blank",
                size: 'small'
            });
            document.getElementById("specialBrandImageDescriptionDown").focus();
            return false;
        }

    }

</script>

</body>
</html>