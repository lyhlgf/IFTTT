<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding ="UTF-8"%>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<%
    String email = (String)session.getAttribute("email") ;
%>
<div align="center">
    <%=email %>
    欢迎您，登陆成功！<br />
    <font color="blue">登陆用户信息：</font>
    <table border =1 >
        <tr>
            <td>&nbsp;邮箱：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=email %>&nbsp;&nbsp;</td>
        </tr>
    </table>
    <a href="/login">返回</a>
</div>
</body>
</html>
