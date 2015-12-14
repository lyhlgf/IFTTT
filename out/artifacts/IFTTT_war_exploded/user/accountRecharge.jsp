<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/13
  Time: 下午7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>IFTTT | Dashboard</title>

    <link href="../static/INSPINIA/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/INSPINIA/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="../static/INSPINIA/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="../static/INSPINIA/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="../static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/style.css" rel="stylesheet">

</head>

<body>
<div id="wrapper">
    <%
        String email = (String)session.getAttribute("email") ;
        Boolean isFail = (Boolean)session.getAttribute("isFail");
    %>
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="../static/INSPINIA/img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=email %></strong>
                             </span> <span class="text-muted text-xs block">User Information</span> </span> </a>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li>
                    <a href="/user/index"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span></a>
                </li>
                <li>
                    <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">产品</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">任务管理</span></a>
                </li>
                <li class="active">
                    <a href="userInformation.jsp"><i class="fa fa-flask"></i> <span class="nav-label">账户管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="userInformation.jsp">账户信息</a></li>
                        <li><a href="consumeRecord.jsp">消费记录</a></li>
                        <li class="active"><a href="accountRecharge.jsp">账户充值</a></li>
                        <li><a href="modifyPassword.jsp">修改密码</a></li>
                    </ul>
                </li>
                <li>
                    <a href="widgets.html"><i class="fa fa-envelope"></i> <span class="nav-label">站内信</span> </a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">支持(非必须)</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="form_basic.html">联系客服</a></li>
                        <li><a href="form_advanced.html">意见反馈</a></li>
                        <li><a href="form_wizard.html">帮助</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>


    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.html"%>
        <span id="alert"></span>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>账户充值</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a>账户管理</a>
                    </li>
                    <li class="active">
                        <strong>账户充值</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-content">
            <form class="reg-page" action="accountRecharge" method="post">
                <div class="row">
                    <div class="col-sm-6 b-r"><h3 class="m-t-none m-b">账户充值</h3>
                        <form role="form">
                            <div class="form-group"><label>密码</label> <input type="password" placeholder="确认密码" class="form-control" name="password"></div>
                            <div class="form-group"><label>充值金额</label><input type="number" min="0" placeholder="金额，以元为单位" class ="form-control" name="money"></div>
                            <div>
                                <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>确定充值</strong></button>
                            </div>
                        </form>
                    </div>

                </div>
            </form>

        </div>
    </div>
    </div>
        <%@include file="footer.html"%>

    </div>
</div>

<!-- Mainly scripts -->
<script src="../static/INSPINIA/js/jquery-2.1.1.js"></script>
<script src="../static/INSPINIA/js/bootstrap.min.js"></script>
<script src="../static/INSPINIA/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../static/INSPINIA/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="../static/INSPINIA/js/inspinia.js"></script>
<script src="../static/INSPINIA/js/plugins/pace/pace.min.js"></script>

<script>
    $(document).ready(function() {

    });
</script>
<script type="text/javascript">
    function failMessage(n) {
        if(n) {
            document.getElementById("alert").innerHTML+="<div id=\"myAlert\" class=\"alert alert-warning\">\
            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a> \
            <strong>密码错误！</strong> </div>";
        }
    }
    failMessage(<%=isFail%>)
</script>
</body>
</html>

