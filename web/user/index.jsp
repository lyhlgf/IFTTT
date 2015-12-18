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

        <div class="row">
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

