<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/23
  Time: 上午7:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PostMessage" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<div id="wrapper">
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>消息内容</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin/index">主页</a>
                    </li>
                    <li>
                        <a href="/admin/postMessageManage">消息管理</a>
                    </li>
                    <li class="active">
                        <strong>消息内容</strong>
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
                        <span class="font-noraml"><%=dateFormat.format(postMessage.getTime())%></span>
                    </h5>
                </div>
            </div>
            <div class="mail-box">
                <div class="mail-body">
                    <textarea disabled class="textarea-noborder" rows="15"><%=postMessage.getContent()%></textarea>
                </div>
                <div class="mail-body text-right tooltip-demo">
                    <a class="btn btn-sm btn-white" href="/admin/postMessageManage?ID=<%=postMessage.getId()%>&type=edit"><i class="fa fa-pencil"></i> 编辑</a>
                    <a class="btn btn-sm btn-white" href="/admin/postMessageManage?ID=<%=postMessage.getId()%>&type=delete"><i class="fa fa-trash-o"></i> 删除</a>
                </div>
                <!-- TODO: Show notifiction when click buttons -->
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

<style type="text/css">
    .textarea-noborder {
        font-size: 14px;
        background-color: #ffffff;
        width:100%;
        padding-right:5px;
        padding-left:5px;
        letter-spacing:0;
        border-style:none;
    }
</style>

</body>
</html>


