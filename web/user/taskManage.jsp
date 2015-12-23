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

    <%@include file="navbar.jsp"%>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="header.jsp"%>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>任务管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.jsp">Home</a>
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
            <div class="ibox-content">
                <form class="reg-page" action="taskManage" method="post">
                    <div class="row">
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
                                    String[] taskNames = (String[])session.getAttribute("taskName");
                                    String[] taskThis = (String[])session.getAttribute("This");
                                    String[] taskThat = (String[])session.getAttribute("That");
                                    String[] taskRunning = (String[])session.getAttribute("isRunning");

                                    for(int i=0;i<taskNames.length;i++){
                                      //  out.print("<input type=\"hidden\" class=\"form-control\" value="+taskNames[i]+" name=\"index"+taskNames[i]+"\" >");
                                        out.print("<tr>");
                                        out.print("<td>"+taskNames[i]+"</td>");
                                        out.print("<td>"+taskThis[i]+"</td>");
                                        out.print("<td>"+taskThat[i]+"</td>");
                                        out.print("<td>"+taskRunning[i]+"</td>");
                                        String runtext = (taskRunning[i]=="Paused")?"Run":"Pause";
                                        out.print("<td> <form action=\"taskManage\" method=\"post\">\n" +
                                                "<button class=\"btn btn-primary\" type=\"button\" name=\""+taskNames[i]+"\" onclick=\"return mysubmit(this.name)\">"+runtext+"</button>\n" +
                                                "</form></td>");
                                        out.print("<td>"+
                                                "<button class=\"btn btn-primary\" type=\"button\" name=\"n"+taskNames[i]+"\" onclick=\"return mysubmit2(this.name)\">Modify</button>\n" +
                                                "</td>");
                                        out.print("<td>"+
                                                "<button class=\"btn btn-primary\" type=\"button\" name=\"d"+taskNames[i]+"\" onclick=\"return mysubmit3(this.name)\">Delete</button>\n" +
                                                "</td>");
                                        out.print("</tr>");
                                    }

                                %>

                                </tbody>
                            </table>

                            <span id="modify"></span>
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

    });
</script>
<script>
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
       var elem= document.getElementsByName(name);
        if(elem.innerText == "Run")
            elem.innerText="Pause";
        else {
            elem.innerText="Run";
        }
        form.submit();

    }
    function mysubmit2(name) {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","taskModify");


        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "index");
        field.attr("value", name.substr(1));

        form.append(field);
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

