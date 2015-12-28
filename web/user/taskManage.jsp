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
    <link href="../static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/style.css" rel="stylesheet">

    <!-- Data Tables -->
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="../static/INSPINIA/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

</head>

<body>
<div id="wrapper">

    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <% int a = (Integer)session.getAttribute("balanceNotEnough");
            if(a==1) {
                out.print("<div id=\"myAlert\" class=\"alert alert-warning\">\n" +
                        "        <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\n" +
                        "        <strong>余额不足，请充值</strong>\n" +
                        "    </div>");
            }
        %>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>任务管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/user/index">主页</a>
                    </li>
                    <li class="active">
                        <strong>任务管理</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
                <form class="reg-page" action="taskManage" method="post">
                    <div class="row">
<<<<<<< HEAD
                        <div class="col-sm-6 b-r"><h3 class="m-t-none m-b">任务列表</h3>
                            <table class="table table-striped table-bordered table-hover dataTables-example" >
                                <thead>
                                <tr>
                                    <th>任务名</th>
                                    <th>This</th>
                                    <th>That</th>
                                    <th>Is Running</th>
                                    <th>控制</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>

                                <tbody  id="taskList">

                                <%
                                        try {
                                            String[] taskNames = (String[]) session.getAttribute("taskName");
                                            String[] taskThis = (String[]) session.getAttribute("This");
                                            String[] taskThat = (String[]) session.getAttribute("That");
                                            String[] taskRunning = (String[]) session.getAttribute("isRunning");
                                            int[] taskThisEvents = (int[]) session.getAttribute("thisEvents");
                                            int[] taskThatEvents = (int[]) session.getAttribute("thatEvents");

                                            for (int i = 0; i < taskNames.length; i++) {
                                                out.print("<tr>");
                                                out.print("<td>" + taskNames[i] + "</td>");
                                                out.print("<td>" + taskThis[i] + "</td>");
                                                out.print("<td>" + taskThat[i] + "</td>");
                                                out.print("<td>" + taskRunning[i] + "</td>");
                                                String runtext = (taskRunning[i] == "Paused") ? "Run" : "Pause";


                                                String ta = String.valueOf(taskThisEvents[i]);
                                                String tb = String.valueOf(taskThatEvents[i]);

                                                out.print("<td> <form action=\"taskManage\" method=\"post\">\n" +
                                                        "<button class=\"btn btn-primary\" type=\"button\" name=\"" + taskNames[i] + "\" onclick=\"return mysubmit(this.name)\">" + runtext + "</button>\n" +
                                                        "</form></td>");

                                                out.print("<td>" +
                                                        "<button class=\"btn btn-info\" type=\"button\" name=\"n" + taskNames[i] + "\" onclick=\"return mysubmit2(this.name" + "," + ta + "," + tb + ")\">Modify</button>\n" +
                                                        "</td>");

                                                out.print("<td>" +
                                                        "<button class=\"btn btn-warning\" type=\"button\" name=\"d" + taskNames[i] + "\" onclick=\"return mysubmit3(this.name)\">Delete</button>\n" +
                                                        "</td>");

                                                out.print("</tr>");
=======
                        <div class="col-sm-13">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 class="m-t-none m-b">任务列表</h3>
                                </div>
                                <div class="ibox-content">
                                    <table class="table table-striped table-bordered table-hover" >
                                        <thead>
                                        <tr>
                                            <th>任务名</th>
                                            <th>This</th>
                                            <th>That</th>
                                            <th>状态</th>
                                            <th>控制</th>
                                            <th>修改</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>

                                        <tbody  id="taskList">

                                        <%
                                            try {
                                                String[] taskNames = (String[]) session.getAttribute("taskName");
                                                String[] taskThis = (String[]) session.getAttribute("This");
                                                String[] taskThat = (String[]) session.getAttribute("That");
                                                String[] taskRunning = (String[]) session.getAttribute("isRunning");
                                                int[] taskThisEvents = (int[]) session.getAttribute("thisEvents");
                                                int[] taskThatEvents = (int[]) session.getAttribute("thatEvents");

                                                for (int i = 0; i < taskNames.length; i++) {
                                                    out.print("<tr>");
                                                    out.print("<td>" + taskNames[i] + "</td>");
                                                    out.print("<td>" + taskThis[i] + "</td>");
                                                    out.print("<td>" + taskThat[i] + "</td>");
                                                    out.print("<td>" + taskRunning[i] + "</td>");
                                                    String runtext = (taskRunning[i] == "Paused") ? "Run" : "Pause";


                                                    String ta = String.valueOf(taskThisEvents[i]);
                                                    String tb = String.valueOf(taskThatEvents[i]);

                                                    out.print("<td> <form action=\"taskManage\" method=\"post\">\n" +
                                                            "<button class=\"btn btn-sm btn-primary\" type=\"button\" name=\"" + taskNames[i] + "\" onclick=\"return mysubmit(this.name)\">" + runtext + "</button>\n" +
                                                            "</form></td>");

                                                    out.print("<td>" +
                                                            "<button class=\"btn btn-sm btn-primary\" type=\"button\" name=\"n" + taskNames[i] + "\" onclick=\"return mysubmit2(this.name" + "," + ta + "," + tb + ")\">Modify</button>\n" +
                                                            "</td>");

                                                    out.print("<td>" +
                                                            "<button class=\"btn btn-sm btn-primary\" type=\"button\" name=\"d" + taskNames[i] + "\" onclick=\"return mysubmit3(this.name)\">Delete</button>\n" +
                                                            "</td>");

                                                    out.print("</tr>");
                                                }
                                            }catch (Exception e) {
                                                //  e.printStackTrace();
>>>>>>> upstream/master
                                            }

                                        %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>

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
    $(document).ready(function() {
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

    function mysubmit(name) {
        var form =$('<form></form>');
        form.attr("method","post");
        form.attr("action","taskManage");


        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "index");
        field.attr("value", name);

        form.append(field);
        $(document.body).append(form);

        form.submit();

    }
    function mysubmit2(name,thisEvent,thatEvent) {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","taskModify");


        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "index");
        field.attr("value", name.substr(1));
        form.append(field);

         var field2 = $('<input></input>');
        field2.attr("type", "hidden");
        field2.attr("name", "a");
        field2.attr("value", thisEvent);
        form.append(field2);

        var field3 = $('<input></input>');
        field3.attr("type", "hidden");
        field3.attr("name", "b");

        field3.attr("value", thatEvent);
        form.append(field3);
        $(document.body).append(form);

        form.submit();


    }
    function mysubmit3(name) {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","taskDelete");


        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "index");
        field.attr("value", name.substr(1));

        form.append(field);
        $(document.body).append(form);

        form.submit();

    }
</script>

</body>
</html>

