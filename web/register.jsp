<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/5
  Time: 上午5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>Registration | IFTTT</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="static/Unify/img/favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="static/Unify/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/Unify/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="static/Unify/css/headers/header-default.css">
    <link rel="stylesheet" href="static/Unify/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="static/Unify/plugins/animate.css">
    <link rel="stylesheet" href="static/Unify/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="static/Unify/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="static/Unify/css/pages/page_log_reg_v1.css">
    <link rel="stylesheet" href="static/Unify/css/pages/page_misc_sticky_footer.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="static/Unify/css/custom.css">
</head>

<body>

<div class="wrapper">
    <%
        Boolean isFail = (Boolean)session.getAttribute("isFail");
        String message = (String)session.getAttribute("message");
    %>
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <form id="registerform" class="reg-page" action="register" method="post">
                    <div class="reg-header">
                        <h2>注册新用户</h2>
                        <p>已经拥有账号？<a href="login" class="color-green">直接登录</a></p>
                    </div>
                    <span id="alert"></span>
                    <label>邮箱 <span class="color-red">*</span></label>
                    <input type="email" class="form-control margin-bottom-20" name="email">

                    <div class="row">
                        <div class="col-sm-6">
                            <label>密码 <span class="color-red">*</span></label>
                            <input type="password" class="form-control margin-bottom-20" name="password" id="password">
                        </div>
                        <div class="col-sm-6">
                            <label>重复密码 <span class="color-red">*</span></label>
                            <input type="password" class="form-control margin-bottom-20" name="passwordCheck">
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-lg-6 checkbox">
                            <label>
                                <input type="checkbox">
                                我已经阅读并同意 <a href="#" class="color-green">使用协议</a>
                            </label>
                        </div>
                        <div class="col-lg-6 text-right">
                            <button class="btn-u" type="submit">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div><!--/container-->
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <%@include file="footer.jsp"%>
    <!--=== End Footer Version 1 ===-->
</div>

<!-- JS Global Compulsory -->
<script type="text/javascript" src="static/Unify/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/Unify/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="static/Unify/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="static/Unify/plugins/back-to-top.js"></script>
<script type="text/javascript" src="static/Unify/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="static/INSPINIA/js/plugins/validate/jquery.validate.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="static/Unify/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="static/Unify/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        function failMessage(n) {
            if(n) {
                document.getElementById("alert").innerHTML+="<div id=\"myAlert\" class=\"alert alert-danger\">\
            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a> \
            <strong><%=message%></strong> </div>";
            }
            <%
                session.setAttribute("isFail", false);
            %>
        }
        failMessage(<%=isFail%>)

        $('#registerform').validate({
            rules: {
                email: {
                    required: true,
                    minlength: 1
                },
                password: {
                    required: true
                },
                passwordCheck: {
                    equalTo: "#password"
                }
            },
        });
    });
</script>
<!--[if lt IE 9]>
<script src="static/Unify/plugins/respond.js"></script>
<script src="static/Unify/plugins/html5shiv.js"></script>
<script src="static/Unify/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 
