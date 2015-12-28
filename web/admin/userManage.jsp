<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/13
  Time: 下午7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>IFTTT | Dashboard</title>

    <link href="../static/INSPINIA/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/bootstrap.min2.css" rel="stylesheet">
    <link href="../static/INSPINIA/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/style.css" rel="stylesheet">

    <!-- Data Tables -->
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">
</head>

<body>
<%
    ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
%>
<div id="wrapper">
    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-9">
                <h2>用户管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin/index">主页</a>
                    </li>
                    <li class="active">
                        <strong>用户管理</strong>
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-13">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>用户列表</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th>邮箱</th>
                                <th>昵称</th>
                                <th>等级</th>
                                <th>余额</th>
                                <th>详情</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (User user : users) {

                            %>
                            <tr>
                                <td><%=user.getEmail()%></td>
                                <td>noodles</td>
                                <td><%=user.getRank()%></td>
                                <td><%=user.getBalance()%></td>
                                <td><a href="/admin/userDetail?email=<%=user.getEmail()%>"><u>查看用户详情</u></a></td>
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

<!-- Data Tables -->
<script src="../static/INSPINIA/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.tableTools.min.js"></script>

<script>
    $(document).ready(function(){
        $('.table').dataTable({
            paging: true,//分页
            ordering: false,//是否启用排序
            searching: true,//搜索
            language: {
                lengthMenu: '每页显示 _MENU_ 条记录',
                search: '搜索: ',//右上角的搜索文本，可以写html标签

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
            dom: 'lftp',
            pagingType: "full_numbers"//分页样式的类型

        });
    });
</script>

</body>
</html>

