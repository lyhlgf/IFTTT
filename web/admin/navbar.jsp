<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String navbarActive = (String)session.getAttribute("navbarActive");
    String email = (String)session.getAttribute("email");
    String adminIndex = "";
    String thingManage = "";
    String postMessageManage = "";
    String userManage = "";
    switch (navbarActive) {
        case "adminIndex" : adminIndex = "active";break;
        case "thingManage" : thingManage = "active";break;
        case "postMessageManage" : postMessageManage = "active";break;
        case "userManage" : userManage = "active";break;
        default:break;
    }

%>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="../static/INSPINIA/img/profile_small.jpg" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=email %></strong>
                             </span> <span class="text-muted text-xs block">User Information</span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="/user/index">切换为普通用户</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li class=<%=adminIndex%>>
                <a href="/admin/index"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span></a>
            </li>
            <li class=<%=userManage%>>
                <a href="/admin/userManage"><i class="fa fa-diamond"></i> <span class="nav-label">用户管理</span></a>
            </li>
            <li class=<%=thingManage%>>
                <a href="/admin/thingManage"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">事件管理</span></a>
            </li>
            <li class=<%=postMessageManage%>>
                <a href="/admin/postMessageManage"><i class="fa fa-envelope"></i> <span class="nav-label">消息管理</span></a>
            </li>

        </ul>
    </div>
</nav>