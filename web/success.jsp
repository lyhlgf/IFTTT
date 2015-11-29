<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding ="gb2312"%>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<%
    String userName = (String)session.getAttribute("username") ;
    String age = (String)session.getAttribute("age") ;
    String weight = (String)session.getAttribute("weight") ;
    String sex = (String)session.getAttribute("sex") ;
    System.out.println("性别：A" + sex +"A")  ;
    if (sex.trim().equals("M")) {
        sex ="男" ;
    }else{
        sex = "女" ;
    }
%>
<div align="center">
    <%=userName %>
    欢迎您，登陆成功！<br />
    <font color="blue">登陆用户信息：</font>
    <table border =1 >
        <tr>
            <td>&nbsp;姓名：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=userName %>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;年龄：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=age %>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;体重：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=weight %>&nbsp;kg&nbsp;</>
        </tr>
        <tr>
            <td>&nbsp;性别：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=sex %>&nbsp;&nbsp;</>
        </tr>
    </table>
    <a href="login.jsp">返回</a>
</div>
</body>
</html>
