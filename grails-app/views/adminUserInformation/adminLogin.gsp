<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/admin.css')}" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/bootstrap.css')}" type="text/css"
          media="all"/>

</head>

<body>
<div class="height-body">
    <div class="login-body">
        <div class="login-color">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-default">
                            <div class="panel-body">
                                <div class="logo-segment">
                                    <img src="css/images/logo.png" class="img-responsive logo-login"><center><h2 class="logo-title"> Login</h2></center>
                                </div>
                                <form role="form">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <center><a href="index.html" class="btn btn-lg btn-warning btn-block">Login</a><center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>