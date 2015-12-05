<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>Login | IFTTT</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="static/css/headers/header-default.css">
    <link rel="stylesheet" href="static/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="static/plugins/animate.css">
    <link rel="stylesheet" href="static/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="static/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="static/css/pages/page_log_reg_v1.css">
    <link rel="stylesheet" href="static/css/pages/page_misc_sticky_footer.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="static/css/custom.css">
</head>

<body>

<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.html"%>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <form class="reg-page" action="login" method="post">
                    <div class="reg-header">
                        <h2>登录</h2>
                    </div>

                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="email" placeholder="邮箱" class="form-control" name="email">
                    </div>
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" placeholder="密码" class="form-control" name="password">
                    </div>

                    <div class="row">
                        <div class="col-md-6 checkbox">
                            <label><input type="checkbox"> 保持登录状态</label>
                        </div>
                        <div class="col-md-6">
                            <button class="btn-u pull-right" type="submit">登录</button>
                        </div>
                    </div>

                    <hr>

                    <h4>忘记密码?</h4>
                    <p>点击<a class="color-green" href="#">这里</a>重置密码</p>
                </form>
            </div>
        </div><!--/row-->
    </div><!--/container-->
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <%@include file="footer.html"%>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="static/plugins/back-to-top.js"></script>
<script type="text/javascript" src="static/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="static/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="static/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<!--[if lt IE 9]>
<script src="static/plugins/respond.js"></script>
<script src="static/plugins/html5shiv.js"></script>
<script src="static/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>

<%--
<html>
<head>
    <title>登陆</title>
</head>
<body>
<form method="POST" name="frmLogin" action="LoginServlet">
    <h1 align="center">用户登录</h1><br />
    <center>
        <table border=1>
            <tr>
                <td>用户名：</td>
                <td>
                    <input type="text" name="username" value="Your name" size="20" maxlength="20" onfocus="if (this.value=='Your name')  this.value='';" />
                </td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;码：</td>
                <td>
                    <input type="password" name="password" value="Your password" size="20" maxlength="20" onfocus="if (this.value=='Your password')  this.value='';" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="Submit" value="提交" onClick="return validateLogin()" />
                </td>
                <td>
                    <input type="reset" name="Reset" value="重置" />
                </td>
            </tr>
        </table>
    </center>
</form>
<script language="javascript">
    function validateLogin(){
        var sUserName = document.frmLogin.username.value ;
        var sPassword = document.frmLogin.password.value ;
        if ((sUserName =="") || (sUserName=="Your name")){
            alert("请输入用户名!");
            return false ;
        }

        if ((sPassword =="") || (sPassword=="Your password")){
            alert("请输入密码!");
            return false ;
        }
    }
</script>
</body>
</html>
--%>