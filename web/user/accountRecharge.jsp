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
        Boolean isFail = (Boolean)session.getAttribute("isFail");
    %>
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>
        <span id="alert"></span>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>账户充值</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/user/index">主页</a>
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
        <%@include file="footer.jsp"%>
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

