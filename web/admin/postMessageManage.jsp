<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/21
  Time: 下午8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
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
    <link href="../static/INSPINIA/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/style.css" rel="stylesheet">

    <!-- Data Tables -->
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

</head>

<body>

<%
    ArrayList<PostMessage> postMessages = (ArrayList<PostMessage>) session.getAttribute("postMessages");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>

<div id="wrapper">
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>消息管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin/index">主页</a>
                    </li>
                    <li class="active">
                        <strong>消息管理</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <div class="row">
            <div class="mail-box-header">
                <div class="col-lg-13 animated fadeInRight">
                    <div id="inboxContents" class="tab-content">
                            <div class="mail-box">
                                <table class="table table-hover table-mail">
                                    <thead>
                                    <tr>
                                        <th class="check-mail"><input type="checkbox" class="i-checks"></th>
                                        <th class="mail-ontact">收件人</th>
                                        <th class="mail-subject">消息内容</th>
                                        <th class="mail-date">发件时间</th>
                                        <th>类型</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(postMessages!=null)
                                        for (PostMessage postMessage : postMessages) {
                                            String messageType = "私人";
                                            if (postMessage.getEmail().equals("public")) {
                                                messageType = "公共";
                                            }
                                    %>
                                    <tr id=<%=postMessage.getId()%> class="read">
                                        <td class="check-mail">
                                            <input type="checkbox" class="i-checks">
                                        </td>
                                        <td class="mail-ontact"><%=postMessage.getEmail()%></td>
                                        <td class="mail-subject">
                                            <a href="/admin/postMessageManage?ID=<%=postMessage.getId()%>&type=mailDetail">
                                                <%=postMessage.getSubject()%>
                                            </a>
                                        </td>
                                        <td class="mail-date"><%=dateFormat.format(postMessage.getTime())%></td>
                                        <td><%=messageType%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                    </div>
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

<!-- iCheck -->
<script src="../static/INSPINIA/js/plugins/iCheck/icheck.min.js"></script>

<!-- Data Tables -->
<script src="../static/INSPINIA/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.tableTools.min.js"></script>

<script>
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        $('.table-mail').dataTable({
            paging: true,//分页
            ordering: false,//是否启用排序
            searching: true,//搜索
            language: {
                lengthMenu: '<a class="btn btn-sm btn-primary" href="/admin/newPostMessage">新建消息 </a>',
                search: '<button class="btn btn-sm btn-primary">搜索 </button>',//右上角的搜索文本，可以写html标签

                paginate: {//分页的样式内容。
                    previous: "上一页",
                    next: "下一页",
                    first: "第一页",
                    last: "最后"
                },

                zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
                //下面三者构成了总体的左下角的内容。
                info: "显示第_START_ 到第 _END_ ，共 _TOTAL_ 条",//左下角的信息显示，大写的词为关键字。
                infoEmpty: "0条记录",//筛选为空时左下角的显示。
                infoFiltered: ""//筛选之后的左下角筛选提示，
            },
            dom: '<"ibox-content"lf>t<"ibox-content"p>',
            pagingType: "full_numbers"//分页样式的类型

        });
    });
</script>
</body>
</html>


