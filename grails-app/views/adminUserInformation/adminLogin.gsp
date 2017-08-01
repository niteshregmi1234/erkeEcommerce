<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/admin.css')}" type="text/css" media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'yarsaa/bootstrap.css')}" type="text/css" media="all"/>
    <link rel="stylesheet" href="${resource(dir: 'css/yarsaa', file:"${"style."+StyleManagement.list()[0].style.name+".css"}")}" type="text/css"
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
                                    %{--<img src="css/images/logo.png" class="img-responsive logo-login">--}%
                                    <h2 class="logo-title"> Login</h2>
                                </div>
                                <form role="form" class="form-fix">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                    </div>
                                    <a href="index.html" class="btn btn-lg btn-primary btn-block">Login</a>
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