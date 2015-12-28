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

    <link href="../static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/style.css" rel="stylesheet">

</head>

<body>
<%
    boolean edit = (boolean) session.getAttribute("edit");
    PostMessage postMessage = (PostMessage) session.getAttribute("postMessage");
    String subject = "";
    String content = "";
    String editStr = "";
    boolean hasEmail = (boolean) session.getAttribute("hasEmail");
    String toEmail = (String) session.getAttribute("email");
    boolean privateMessage = false;
    if (edit) {
        editStr = "?ID="+postMessage.getId();
        subject = postMessage.getSubject();
        content = postMessage.getContent();
        if (!postMessage.getEmail().equals("public")) {
            privateMessage = true;
            toEmail = postMessage.getEmail();
        }
    }
%>
<div id="wrapper">
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2 id="title">新建消息</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin/index">主页</a>
                    </li>
                    <li>
                        <a href="/admin/postMessageManage">消息管理</a>
                    </li>
                    <li class="active">
                        <strong id="titleNav">新建消息</strong>
                    </li>
                </ol>
            </div>
        </div>

        <div class="col-lg-13">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5 id="iboxTitle">新建消息</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" action="/admin/newPostMessage<%=editStr%>" method="post">
                        <div class="form-group"><label class="col-lg-2 control-label">主题</label>
                            <div class="col-lg-10"><input type="text" name="subject" placeholder="主题" class="form-control" value="<%=subject%>" /> <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-lg-2 control-label">收件人</label>
                            <div class="col-lg-10"><input type="email" name="email" placeholder="Email" class="form-control" disabled value="public" /> <span class="help-block m-b-none">
                                <div class="col-md-10">
                                    <div class="form-group" id="messageType">
                                        <input type="radio" name="messageType" value="public" checked/>
                                        <label>公共消息&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        <input type="radio" name="messageType" value="private"/>
                                        <label>私人消息</label>
                                    </div>
                                </div>
                                </span>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-lg-2 control-label">内容</label>

                            <div class="col-lg-10"><textarea name="content" placeholder="输入消息内容..." class="form-control" rows="15"><%=content%></textarea></div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button class="btn btn-sm btn-white" type="submit">提交</button>
                                <a class="btn btn-sm btn-white" href="/admin/postMessageManage">取消</a>
                            </div>
                        </div>
                    </form>
                </div>
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
        if (<%=edit%>) {
            $('#title').text("编辑消息");
            $('#titleNav').text("编辑消息");
            $('#iboxTitle').text("编辑消息");
        }

        if (<%=privateMessage%> || <%=hasEmail%>) {
            $("input[name='email']").attr("disabled", false);
            $("input[name='email']").attr("value", "<%=toEmail%>");
            $("input[name='messageType'][value='private']").attr("checked", true);
        }

        $(':radio').click(function() {
            if ($(this).val() == "private") {
                $("input[name='email']").attr("disabled", false);
                $("input[name='email']").removeAttr("value");
            } else {
                $("input[name='email']").attr("disabled", true);
                $("input[name='email']").attr("value", "public");
            }
        })
    });
</script>

</body>
</html>


