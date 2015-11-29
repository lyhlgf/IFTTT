<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=gb2312" pageEncoding ="gb2312"%>
<html>
<head>
    <title>登陆失败</title>
</head>
<body>
<%
    String userName = (String)session.getAttribute("username") ;
    String msg  = (String)session.getAttribute("message") ;
%>
<div align="center">
    <%=userName %>
    对不起，登陆失败！<br />
    <font color="red">原因： </font>
    <%=msg %>
    <br/>
    <br/>
    5秒后将返回登陆界面。
</div>

<%
    response.setHeader("Refresh","5;URL=/login.jsp");
%>
</body>
</html>
