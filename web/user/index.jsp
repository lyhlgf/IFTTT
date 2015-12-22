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
                <div class="col-lg-9">
                    <h2>主页</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                    </ol>
                </div>
            </div>

        <div class="row">

            <div class="box float-e-margins">
                <div class="ibox-title">
                    <h3>新任务</h3>
                </div>
                <div class="ibox-content">
                    <form role=\"form\"  action="newTask" method="post">
                    <h3 class="font-bold">IF</h3>
                        <button class="btn btn-primary  dim btn-dim" type="button" onclick="myclick_receive_mail()"><img src="../static/Unify/img/mail.png" width="80" height="80" ></button>
                        <button class="btn btn-primary  dim btn-dim" type="button" onclick="myclick_time()"><img src="../static/Unify/img/clock.png" width="80" height="80" ></button>
                        <button class="btn btn-primary  dim btn-dim" type="button" onclick="myclick_listen_weibo()"><img src="../static/Unify/img/weibo.png" width="80" height="80" ></button>
                        <span id="region1">
                        </span>

                    <h3 class="font-bold">THEN</h3>
                        <button class="btn btn-primary  dim btn-dim" type="button" onclick="myclick_send_mail()"><img src="../static/Unify/img/sendmail.png" width="80" height="80" ></button>
                        <button class="btn btn-primary  dim btn-dim" type="button" onclick="myclick_send_weibo()"><img src="../static/Unify/img/weibo.png" width="80" height="80" ></button>
                        <span id="region2">
                        </span>
                        </br>
                    <button class="btn btn-primary " type="button" onclick="return mysubmit(this.form)"><i class="fa fa-check"></i>&nbsp;Add Task</button>
                </form>
                </div>

            </div>
            <div class="box float-e-margins">
                <div class="ibox-title">
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
<script src="../static/INSPINIA/js/plugins/datapicker/bootstrap-datepicker.js"></script>


<script>
    $(document).ready(function() {

    });

</script>
<script>
    var receive_mail_clicked=false;
    var time_clicked=false;
    var listen_weibo=false;
    var send_mail_clicked=false;
    var send_weibo_clicked=false;

    function myclick_receive_mail() {
        receive_mail_clicked=true;time_clicked=false; listen_weibo=false;
        document.getElementById("region1").innerHTML=" <h3 class=\"m-t-none m-b\">收件邮箱信息</h3> \
                <div class=\"form-group\" id=\"data_1\"><label>Account</label> <input type=\"text\" placeholder=\"Mail Address\" class=\"form-control\" \
                name=\"receive_mail\"></div>\
                <div class=\"form-group\"><label>Password</label><input type=\"password\" placeholder=\"Password\" class =\"form-control\" name=\"receive_mail_password\"></div>\
                <div>\
                </div>\
              ";
    }
    function  myclick_listen_weibo() {
        listen_weibo=true;receive_mail_clicked=false;time_clicked=false;
        document.getElementById("region1").innerHTML=" <h3 class=\"m-t-none m-b\">监听微博信息</h3> \
                <div class=\"form-group\" id=\"data_1\"><label>Weibo ID</label> <input type=\"text\" placeholder=\"Weibo ID\" class=\"form-control\" \
                name=\"listen_weibo_id\"></div>\
                <div class=\"form-group\"><label>Password</label><input type=\"password\" placeholder=\"Password\" class =\"form-control\" name=\"listen_weibo_password\"></div>\
                 <div class=\"form-group\"><label>监听内容</label><input type=\"text\" placeholder=\"监听消息内容\" class =\"form-control\" name=\"listen_weibo_content\"></div>\
              ";
    }
    function myclick_time() {
        receive_mail_clicked=false;time_clicked=true;
        document.getElementById("region1").innerHTML= " <h3 class=\"m-t-none m-b\">时间设置</h3> \
       <div class=\"form-group\" id=\"data_1\">\
        <div class=\"input-group date\">\
                <span class=\"input-group-addon\"><i class=\"fa fa-calendar\"></i></span><input type=\"text\" class=\"form-control\" value=\"03/04/2015\">\
                </div></div>";


        $('#data_1 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });
    }

    function myclick_send_mail() {
        send_mail_clicked=true;
        send_weibo_clicked=false; listen_weibo=false;
        document.getElementById("region2").innerHTML=" <h3 class=\"m-t-none m-b\">发送邮件</h3> \
                <div class=\"form-group\" id=\"data_1\"><label>From Account</label> <input type=\"text\" placeholder=\"From Mail Address\" class=\"form-control\" \
                name=\"send_email\"></div>\
                <div class=\"form-group\"><label>Password</label><input type=\"password\" placeholder=\"Password\" class =\"form-control\" name=\"send_mail_password\"></div>\
                <div class=\"form-group\"><label>To Mail</label><input type=\"text\" placeholder=\"To Mail Address\" class =\"form-control\" name=\"send_to_mail\"></div>\
                <div class=\"form-group\"><label>Message</label> <textarea class=\"form-control\" placeholder=\"Message\" name=\"message\"></textarea> </div>\
              ";
    }
    function myclick_send_weibo() {
        send_mail_clicked=false;
        send_weibo_clicked=true;
        document.getElementById("region2").innerHTML=" <h3 class=\"m-t-none m-b\">微博账号</h3> \
                <div class=\"form-group\" id=\"data_1\"><label>Account</label> <input type=\"text\" placeholder=\"Weibo Account\" class=\"form-control\" \
                name=\"weibo_acount\"></div>\
                <div class=\"form-group\"><label>Password</label><input type=\"password\" placeholder=\"Password\" class =\"form-control\" name=\"weibo_password\"></div>\
              <div class=\"form-group\"><label>Message</label> <textarea class=\"form-control\" placeholder=\"Message\" name=\"message\"></textarea> </div>\
              ";
    }
    function mysubmit(fm) {
        if((receive_mail_clicked || time_clicked ) && (send_mail_clicked || send_weibo_clicked))
            fm.submit();
    }

</script>
</body>
</html>

