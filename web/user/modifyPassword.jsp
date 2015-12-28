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

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>修改密码</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/user/index">主页</a>
                    </li>
                    <li>
                        <a>账户管理</a>
                    </li>
                    <li class="active">
                        <strong>修改密码</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox-content">
                <form id="passwordModify" class="reg-page" action="/user/modifyPassword" method="post">
                    <div class="row">
                        <div class="col-sm-6 b-r"><h3 class="m-t-none m-b">修改密码</h3>
                            <span id="alert"></span>
                            <p>修改密码需要先输入原密码</p>
                            <form role="form">
                                <div class="form-group"><label>原密码</label> <input type="password" placeholder="Origin Password" class="form-control" name="old password"></div>
                                <div class="form-group"><label>新密码</label><input type="password" placeholder="New Password" class ="form-control" name="new password" id="password"></div>
                                <div>
                                    <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>确定修改</strong></button>
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
<script type="text/javascript" src="static/INSPINIA/js/plugins/validate/jquery.validate.min.js"></script>

<script>
    $(document).ready(function() {
        function failMessage(n) {
            if(n) {
                document.getElementById("alert").innerHTML+="<div id=\"myAlert\" class=\"alert alert-warning\">\
            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a> \
            <strong>原密码错误！</strong> </div>";
            }
            <%
                session.setAttribute("isFail", false);
            %>
        }
        failMessage(<%=isFail%>)
    });
</script>

</body>
</html>

