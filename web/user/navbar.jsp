<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String navbarActive = (String)session.getAttribute("navbarActive");
    String email = (String)session.getAttribute("email");
    String userIndex = "";
    String product = "";
    String taskManage = "";
    String accountManager = "";
    String accountInfo = "";
    String accountRecharge = "";
    String modifyPassword = "";
    String mailbox = "";
    switch (navbarActive) {
        case "userIndex" : userIndex = "active";break;
        case "product" : product = "active";break;
        case "taskManage" : taskManage = "active";break;
        case "accountInfo" : accountManager = "active";accountInfo = "active";break;
        case "accountRecharge" : accountManager = "active";accountRecharge = "active";break;
        case "modifyPassword" : accountManager = "active";modifyPassword = "active";break;
        case "mailbox" : mailbox = "active";break;
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
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li class=<%=userIndex%>>
                <a href="/user/index"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span></a>
            </li>
            <li class=<%=product%>>
                <a href="#"><i class="fa fa-diamond"></i> <span class="nav-label">产品</span></a>
            </li>
            <li class=<%=taskManage%>>
                <a href="/user/taskManage"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">任务管理</span></a>
            </li>
            <li class=<%=accountManager%>>
                <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">账户管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li class=<%=accountInfo%>><a href="/user/userInfo">账户信息</a></li>
                    <li class=<%=accountRecharge%>><a href="/user/accountRecharge">账户充值</a></li>
                    <li class=<%=modifyPassword%>><a href="/user/modifyPassword">修改密码</a></li>
                </ul>
            </li>
            <li class=<%=mailbox%>>
                <a href="/user/mailbox"><i class="fa fa-envelope"></i> <span class="nav-label">站内信</span></a>
            </li>
        </ul>
    </div>
</nav>