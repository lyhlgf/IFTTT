<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/23
  Time: 上午7:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PostMessage" %>
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
<%
    PostMessage postMessage = (PostMessage) session.getAttribute("messageDetail");
%>
<div id="wrapper">
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>信件内容</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/user/index">Home</a>
                    </li>
                    <li>
                        <a href="/user/mailbox">站内信</a>
                    </li>
                    <li class="active">
                        <strong>信件内容</strong>
                    </li>
                </ol>
            </div>
        </div>

        <div class="col-lg-13 animated fadeInRight">
            <div class="mail-box-header">
                <h2>
                    <%=postMessage.getSubject()%>
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <h5>
                        <span class="font-noraml"><%=postMessage.getTime()%></span>
                    </h5>
                </div>
            </div>
            <div class="mail-box">
                <div class="mail-body">
                    <%=postMessage.getContent()%>
                </div>
                <div class="mail-body text-right tooltip-demo">
                    <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-reply"></i> Reply</a>
                    <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-arrow-right"></i> Forward</a>
                    <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="Print" class="btn btn-sm btn-white"><i class="fa fa-print"></i> Print</button>
                    <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> Remove</button>
                </div>
                <div class="clearfix"></div>
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

</body>
</html>


