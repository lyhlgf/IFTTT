<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<head>
    <title>登陆失败</title>

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
<%
    String email = (String)session.getAttribute("email") ;
    String msg  = (String)session.getAttribute("message") ;
%>
<div class="wrapper">
    <!--=== Header ===-->
    <div id="myAlert" class="alert alert-warning">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>登陆失败</strong>
    </div>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-4 col-md-offset-0">

                <h1>登陆失败！</h1>
                <h2>失败原因：<%=msg %></h2>
                <h3>登陆账号:<%=email %></h3>
                <br/>
                <br/>
                <span id="num">5</span><span>秒后将返回登陆界面。</span>
                <a href="/login">立即返回</a>
            </div>

        </div><!--/row-->

    </div><!--/container-->
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <%@include file="footer.jsp"%>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="static/Unify/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/Unify/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="static/Unify/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="static/Unify/plugins/back-to-top.js"></script>
<script type="text/javascript" src="static/Unify/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="static/Unify/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="static/Unify/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<script type="text/javascript">
    function autoJump(secs) {
        var num = document.getElementById("num");
        num.innerHTML=secs--;
        if(secs  > 0) {
            setTimeout("autoJump("+secs+")",1000);
        }
        else {
            location.href = "/login"
        }
    }
</script>
<script type="text/javascript">autoJump(5)</script>

<!--[if lt IE 9]>
<script src="static/Unify/plugins/respond.js"></script>
<script src="static/Unify/plugins/html5shiv.js"></script>
<script src="static/Unify/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>


