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
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <!-- Interactive Slider v2 -->
    <div class="interactive-slider-v2">
        <div class="container">
            <h1>&nbsp;</h1>
        </div>
    </div>
    <!-- End Interactive Slider v2 -->

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
<script type="text/javascript" src="static/Unify/plugins/jquery.parallax.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="static/Unify/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="static/Unify/js/app.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<!--[if lt IE 9]>
<script src="static/Unify/plugins/respond.js"></script>
<script src="static/Unify/plugins/html5shiv.js"></script>
<script src="static/Unify/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
