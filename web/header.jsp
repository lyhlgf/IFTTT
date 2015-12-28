<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="container">
        <!-- Logo -->
        <a class="logo" href="/">
            <img src="static/Unify/img/logo.svg" alt="Logo">
        </a>
        <!-- End Logo -->
        <!-- Topbar -->
        <div class="topbar">
            <ul class="nav navbar-nav">
                <!-- Home -->
                <li>
                    <a href="/">主页</a>
                </li>
                <!-- End Home -->

                <li>
                    <a href="/login">登录</a>
                </li>

                <li>
                    <a href="/register">注册</a>
                </li>
            </ul>
        </div>
        <!-- End Topbar -->

        <!-- Toggle get grouped for better mobile display -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="fa fa-bars"></span>
        </button>
        <!-- End Toggle -->
    </div><!--/end container-->

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
        <div class="container">
            <ul class="nav navbar-nav">
                <!-- Home -->
                <li>
                    <a href="/">&nbsp;</a>
                </li>
                <!-- End Home -->
            </ul>
        </div><!--/end container-->
    </div><!--/navbar-collapse-->
</div>