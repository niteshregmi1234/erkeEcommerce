<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="userYarsaa">
</head>

<body>


<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
 _________________________________________________________ -->

<!-- /#navbar -->

<!-- *** NAVBAR END *** -->

%{--<div id="all">--}%

    <div id="content">
        <div class="container">

            <div class="col-md-12">

                <ul class="breadcrumb">
                    <li><g:link action="userHome" controller="endUser">Home</g:link>
                    </li>
                    <li>My account</li>
                </ul>

            </div>

            <div class="col-md-3">
                <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Customer section</h3>
                    </div>

                    <div class="panel-body">

                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <g:link action="cart" controller="cart"><i class="fa fa-list"></i> My orders</g:link>
                            </li>
                            %{--<li>--}%
                                %{--<a href="customer-wishlist.html"><i class="fa fa-heart"></i> My wishlist</a>--}%
                            %{--</li>--}%
                            <li>
                                <g:link action="myProfile" controller="endUserInformation"><i class="fa fa-user"></i> My account</g:link>
                            </li>
                            <li>
<a href="#" onclick="logoutUser();"><i class="fa fa-sign-out"></i>Logout</a>

    %{--<a href="index.html"><i class="fa fa-sign-out"></i> Logout</a>--}%
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.col-md-3 -->

                <!-- *** CUSTOMER MENU END *** -->
            </div>

            <div class="col-md-9">
                <div class="box">
                    <h1>My account</h1>
                    <p class="lead">Change your personal details or your password here.</p>
                    <p class="text-muted">You can set up personal information anytime.</p>

                    <h3>Change password</h3>

                    <form method="post" id="accountDetail">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email" value="${session.endUser.email}" disabled="true">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="oldPassword">Old password</label>
                                    <g:passwordField name="oldPassword" placeholder="oldPassword" class="form-control" id="oldPassword"/>
<small style="color: #a94442;display: none" id="oldPassMsgEmpty">Please supply your old password</small>
                                    <small style="color: #a94442;display: none" id="oldPassMsgNotMatch">your password does not match </small>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="newPasswordOne">New password</label>
                                    <g:passwordField class="form-control" id="newPasswordOne" placeholder="new password"
                                           name="newPasswordOne"/>
                                    <small style="color: #a94442;display: none" id="newPassOneMsgEmpty">Please supply your new password</small>
                                    <small style="color: #a94442;display: none" id="newPassOneMsgEqualsOldPassword">Password matches with old password.</small>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="newPasswordTwo">Confirm new password</label>
                                    <g:passwordField class="form-control" id="newPasswordTwo" placeholder="Confirm new password"
                                           name="newPasswordTwo"/>
                                    <small style="color: #a94442;display: none" id="newPassTwoMsgEmpty">Please supply your confirm new password</small>
                                    <small style="color: #a94442;display: none" id="newPassTwoMsgMismatch">Confirm new password mismatch</small>

                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="col-sm-12 text-center">
                            <button type="submit" id="updatePassword" class="btn btn-primary" ><i class="fa fa-save"></i> Save new password</button>
                        </div>
                    </form>

                    <hr>
<script>
    $("#updatePassword").click(function(evt) {
        var oldPassword=document.getElementById("oldPassword").value;
        var newPasswordOne=document.getElementById("newPasswordOne").value;
        var newPasswordTwo=document.getElementById("newPasswordTwo").value;
        var array = [];
        array[0] = oldPassword;
        array[1] = newPasswordOne;
        array[2]=newPasswordTwo;
        bootbox.confirm({
            message: "Are you sure want to update your password?",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancel'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> Confirm'
                }
            },
            callback: function (result) {
                var isValid=true;
                if(result==true){
                    if(oldPassword==''){
                        document.getElementById('oldPassMsgEmpty').style.display='block';
                        $("#oldPassword").css("border", "1px solid #a94442");
                        $('#oldPassMsgNotMatch').hide();
                        isValid=false;
                    }
                    if(oldPassword!=''){
                        $.ajax({
                            url: "${createLink(controller:'endUserInformation', action:'checkPassword')}",
                            type : 'POST',
                            data: { "oldPassword":oldPassword},
                            cache: false,
                            async : false,
                            success: function(result) {
                                if(result=="false"){
                                $("#oldPassword").css("border", "1px solid #a94442");
                                $('#oldPassMsgNotMatch').show();
                                    $('#oldPassMsgEmpty').hide();
                                    isValid=false
                                }
                                else{
                                    $("#oldPassword").css("border","1px solid #3c763d");
                                    $('#oldPassMsgNotMatch').hide();
                                    $('#oldPassMsgEmpty').hide();
                                }

                            }
                        });

                    }
                    if(newPasswordOne==''){
                        document.getElementById('newPassOneMsgEmpty').style.display='block';
                        $("#newPasswordOne").css("border", "1px solid #a94442");
                        isValid=false;
                    }
                    if(newPasswordOne!=''){
                        $.ajax({
                            url: "${createLink(controller:'endUserInformation', action:'checkPassword')}",
                            type : 'POST',
                            data: { "oldPassword":newPasswordOne},
                            cache: false,
                            async : false,
                            success: function(result) {
                                if(result=="true"){
                                    $('#newPassOneMsgEmpty').hide();
                                    $('#newPassOneMsgEqualsOldPassword').show();
                                    $("#newPasswordOne").css("border", "1px solid #a94442");
                                    isValid=false
                                }
                                else{
                                    $('#newPassOneMsgEmpty').hide();
                                    $('#newPassOneMsgEqualsOldPassword').hide();
                                    $("#newPasswordOne").css("border", "1px solid #3c763d");
                                }

                            }
                        });


                    }
                    if(newPasswordTwo==''){
                        document.getElementById('newPassTwoMsgEmpty').style.display='block';
                        $("#newPasswordTwo").css("border", "1px solid #a94442");
                        isValid=false;
                    }
                    if(newPasswordTwo!=''){

                        $('#newPassTwoMsgEmpty').hide();
                        $("#newPasswordTwo").css("border", "1px solid #3c763d");
                    }
                    if(newPasswordTwo!=newPasswordOne){
                        document.getElementById('newPassTwoMsgMismatch').style.display='block';
                        $('#newPassTwoMsgEmpty').hide();
                        $("#newPasswordTwo").css("border", "1px solid #a94442");
                        isValid=false;
                    }
                    if(newPasswordTwo==newPasswordOne && newPasswordOne!='' && newPasswordTwo!=''){
                        $('#newPassTwoMsgEmpty').hide();
                        $('#newPassTwoMsgMismatch').hide();
                        $("#newPasswordTwo").css("border", "1px solid #3c763d");
                    }
                    if(isValid==true){
                        $.ajax({
                            url: "${createLink(controller:'endUserInformation', action:'editEndUserPassword')}",
                            type : 'POST',
                            data: { "newPassword":newPasswordOne},
                            cache: false,
                            async : false,
                            success: function(result) {
                            if(result=="true"){
                                bootbox.alert({
                                    message:"password successfully updated",
                                    size: 'small',
                                    callback: function(){
                                        $("#accountDetail").load(location.href + " #accountDetail");
                                    }

                                });

                            }
                                else if(result=="false") {
                                bootbox.alert({
                                    message:"you are not logged in",
                                    size: 'small',
                                    callback: function(){
                                        location.reload();
                                    }

                                });
                            }
                                else{
                                bootbox.alert({
                                    message:"could not update. Try later.",
                                    size: 'small',
                                    callback: function(){
                                        location.reload();
                                    }

                                });
                            }
                            }
                        });

                    }

                }

            }
        });
        evt.preventDefault();
    })

</script>
                    <h3>Personal details</h3>
                    <form id="personalDetail">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="firstName">First Name</label>
                                    <g:textField class="form-control" name="firstName" id="firstName" value="${session.endUser.firstName}"/>
                                    <small style="color: #a94442;display: none" id="firstNameEmpty">Please supply your first name</small>
                                    <small style="color: #a94442;display: none" id="firstNameNotValid">This value is not valid</small>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="lastName">Last Name</label>
                                    <g:textField name="lastName" class="form-control" id="lastName" value="${session.endUser.lastName}"/>
                                    <small style="color: #a94442;display: none" id="lastNameEmpty">Please supply your last name</small>
                                    <small style="color: #a94442;display: none" id="lastNameNotValid">This value is not valid</small>

                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone">mobile</label>
                                    <g:textField class="form-control" name="phone" id="phone" value="${session.endUser.phone}"/>
                                    <small style="color: #a94442;display: none" id="phoneEmpty">Please supply your phone number </small>
                                    <small style="color: #a94442;display: none" id="phoneNotValid">Please supply a valid mobile number</small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <g:textField name="address" class="form-control" id="address" value="${session.endUser.address}"/>
                                    <small style="color: #a94442;display: none" id="addressEmpty">Please supply your address</small>
                                    <small style="color: #a94442;display: none" id="addressNotValid">This value is not valid</small>

                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <g:textField class="form-control" name="city" id="city" value="${session.endUser.city}"/>
                                    <small style="color: #a94442;display: none" id="cityEmpty">Please supply your city</small>
                                    <small style="color: #a94442;display: none" id="cityNotValid">This value is not valid</small>

                                </div>
                            </div>

                            <div class="col-sm-12 text-center">
                                <button type="submit" id="updatePersonalDetails" class="btn btn-primary"><i class="fa fa-save"></i> Save changes</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <!-- /.container -->
    </div>
<script>
    $("#updatePersonalDetails").click(function(evt) {
        var firstName=document.getElementById("firstName").value;
        var lastName=document.getElementById("lastName").value;
        var phone=document.getElementById("phone").value;
        var address=document.getElementById("address").value;
        var city=document.getElementById("city").value;
        var phoneCheck= /^\d{10}$/;
        var array = [];
        array[0] = firstName;
        array[1] = lastName;
        array[2]=phone;
        array[3]=address;
        array[4]=city;

        bootbox.confirm({
            message: "Are you sure want to update your personal details?",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancel'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> Confirm'
                }
            },
            callback: function (result) {
                var isValid=true;
                if(result==true){
                    if(firstName==''){
                        document.getElementById('firstNameEmpty').style.display='block';
                        $("#firstName").css("border", "1px solid #a94442");
                        $('#firstNameNotValid').hide();
                        isValid=false;
                    }
                    if(firstName.length<=2 && firstName!=''){
                        document.getElementById('firstNameNotValid').style.display='block';
                        $("#firstName").css("border", "1px solid #a94442");
                        $('#firstNameEmpty').hide();
                        isValid=false;
                    }
                    if(firstName.length>=2){
                        $("#firstName").css("border","1px solid #3c763d");
                        $('#firstNameNotValid').hide();
                        $('#firstNameEmpty').hide();
                    }
                    if(lastName==''){
                        document.getElementById('lastNameEmpty').style.display='block';
                        $("#lastName").css("border", "1px solid #a94442");
                        $('#lastNameNotValid').hide();
                        isValid=false;
                    }
                    if(lastName.length<=2 && lastName!=''){
                        document.getElementById('lastNameNotValid').style.display='block';
                        $("#lastName").css("border", "1px solid #a94442");
                        $('#lastNameEmpty').hide();
                        isValid=false;
                    }
                    if(lastName.length>=2){
                        $("#lastName").css("border","1px solid #3c763d");
                        $('#lastNameNotValid').hide();
                        $('#lastNameEmpty').hide();
                    }
                    if(phone==''){
                        document.getElementById('phoneEmpty').style.display='block';
                        $("#phone").css("border", "1px solid #a94442");
                        $('#phoneNotValid').hide();
                        isValid=false;
                    }
                    if(!(phone.match(phoneCheck)) && phone!='')
                    {
                        $('#phoneEmpty').hide();
                        $('#phoneNotValid').show();
                        $("#phone").css("border", "1px solid #a94442");
                        isValid=false;

                    }
                    if(phone.match(phoneCheck))
                    {
                        $('#phoneEmpty').hide();
                        $('#phoneNotValid').hide();
                        $("#phone").css("border", "1px solid #3c763d");
                    }

                    if(address==''){
                        document.getElementById('addressEmpty').style.display='block';
                        $("#address").css("border", "1px solid #a94442");
                        $('#addressNotValid').hide();
                        isValid=false;
                    }
                    if(address.length<=8 && address!=''){
                        document.getElementById('addressNotValid').style.display='block';
                        $("#address").css("border", "1px solid #a94442");
                        $('#addressEmpty').hide();
                        isValid=false;
                    }
                    if(address.length>=8){
                        $("#address").css("border","1px solid #3c763d");
                        $('#addressNotValid').hide();
                        $('#addressEmpty').hide();
                    }
                    if(city==''){
                        document.getElementById('cityEmpty').style.display='block';
                        $("#city").css("border", "1px solid #a94442");
                        $('#cityNotValid').hide();
                        isValid=false;
                    }
                    if(city.length<=4 && city!=''){
                        document.getElementById('cityNotValid').style.display='block';
                        $("#city").css("border", "1px solid #a94442");
                        $('#cityEmpty').hide();
                        isValid=false;
                    }
                    if(city.length>=8){
                        $("#address").css("border","1px solid #3c763d");
                        $('#cityNotValid').hide();
                        $('#cityEmpty').hide();
                    }
                    if(isValid==true){
                        $.ajax({
                            url: "${createLink(controller:'endUserInformation', action:'editEndUserPersonalDetails')}",
                            type : 'POST',
                            data: { "array": JSON.stringify(array)},
                            cache: false,
                            async : false,
                            success: function(result) {
                                if(result=="true"){
                                    bootbox.alert({
                                        message:"personal details successfully updated",
                                        size: 'small',
                                        callback: function(){
                                            $("#personalDetail").load(location.href + " #personalDetail");

                                        }

                                    });

                                }
                                else if(result=="false"){
                                    bootbox.alert({
                                        message:"you are not logged in",
                                        size: 'small',
                                        callback: function(){
                                            location.reload();
                                        }

                                    });
                                }
                                else{
                                    bootbox.alert({
                                        message:"could not update. Try later.",
                                        size: 'small',
                                        callback: function(){
                                            location.reload();
                                        }

                                    });
                                }

                            }
                        });

                    }

                }

            }
        });
        evt.preventDefault();
    })

</script>

    <!-- /#content -->


    <!-- *** FOOTER ***
 _________________________________________________________ -->
    <!-- /#footer -->

    <!-- *** FOOTER END *** -->




    <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
    <!-- *** COPYRIGHT END *** -->



%{--</div>--}%
<!-- /#all -->




<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->



</body>

</html>