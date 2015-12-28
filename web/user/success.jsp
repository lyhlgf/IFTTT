<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding ="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>登陆成功</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="../static/Unify/favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="../static/Unify/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/Unify/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="../static/Unify/css/headers/header-default.css">
    <link rel="stylesheet" href="../static/Unify/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="../static/Unify/plugins/animate.css">
    <link rel="stylesheet" href="../static/Unify/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="../static/Unify/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="../static/Unify/css/pages/page_log_reg_v1.css">
    <link rel="stylesheet" href="../static/Unify/css/pages/page_misc_sticky_footer.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="../static/Unify/css/custom.css">
</head>
<%
    String email = (String)session.getAttribute("email") ;
    String rank  = (String)session.getAttribute("rank") ;
    String balance = (String)session.getAttribute("balance");
    String consumption = (String) session.getAttribute("consumption");
%>
<body>
<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="../header.jsp"%>
    <div id="myAlert" class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>登陆成功！</strong>
    </div>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-4 col-md-offset-0">
               <h2>登陆用户信息</h2>
               <p class="lead">
                      邮箱：<%=email %> </br>
                      <span id="rank"> 等级: <%=rank%>  </br></span>
                      余额: <%=balance%> </br>
                      消费: <%=consumption%></br>
               </p>
                <a href="../user_information.jsp">返回</a>

            </div>
        </div><!--/row-->

    </div><!--/container-->
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <%@include file="../footer.jsp"%>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="../static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../static/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="../static/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../static/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="../static/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../static/js/app.js"></script>
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
<script>
    function showStar(n) {
        var elem = document.getElementById('rank');
        elem.innerHTML = "等级: ";
        for (var i = 0; i < n; i++) {
            elem.innerHTML+=("<img src=/static/img/star.jpg width = \"20\" height =\"20\">");
        }
        elem.innerHTML+="</br>"
    }
</script>
<script type="text/javascript">showStar(<%=rank%>)</script>
</body>
</html>

<!--
<div class = "row" style="margin-top: 50px" >
<div class ="col-md-4 col-md-offset-1">
<img src="/static/img/if.png">
</div>
</div>
<div class="row"  style="margin-top: 20px" >
<div class="col-sm-6 col-md-2">
<a href="#" class="thumbnail">
<img src="/static/img/weibo.png" width="80" height="80"
alt="通用的占位符缩略图">
</a>
</div>
<div class="col-sm-6 col-md-2">
<a href="#" class="thumbnail">
<img src="/static/img/qqmail.jpg" width="80" height="80"
alt="通用的占位符缩略图">
</a>
</div>


</div>
--!>

