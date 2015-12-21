<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String navbarActive = (String)session.getAttribute("navbarActive");
    String email = (String)session.getAttribute("email");;
    String userIndex = "";
    String product = "";
    String taskManager = "";
    String accountManager = "";
    String accountInfo = "";
    String consumeRecord = "";
    String accountRecharge = "";
    String modifyPassword = "";
    String postMessage = "";
    switch (navbarActive) {
        case "userIndex" : userIndex = "active";break;
        case "product" : product = "active";break;
        case "taskManager" : taskManager = "active";break;
        case "accountInfo" : accountManager = "active";accountInfo = "active";break;
        case "consumeRecord" : accountManager = "active";consumeRecord = "active";break;
        case "accountRecharge" : accountManager = "active";accountRecharge = "active";break;
        case "modifyPassword" : accountManager = "active";modifyPassword = "active";break;
        case "postMessage" : postMessage = "active";break;
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
                <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">产品</span></a>
            </li>
            <li class=<%=taskManager%>>
                <a href="/user/taskManage.jsp"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">任务管理</span></a>
            </li>
            <li class=<%=accountManager%>>
                <a href="userInformation.jsp"><i class="fa fa-flask"></i> <span class="nav-label">账户管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li class=<%=accountInfo%>><a href="/user/userInfo">账户信息</a></li>
                    <li class=<%=consumeRecord%>><a href="consumeRecord.jsp">消费记录</a></li>
                    <li class=<%=accountRecharge%>><a href="/user/accountRecharge">账户充值</a></li>
                    <li class=<%=modifyPassword%>><a href="/user/modifyPassword">修改密码</a></li>
                </ul>
            </li>
            <li class=<%=postMessage%>>
                <a href="widgets.html"><i class="fa fa-envelope"></i> <span class="nav-label">站内信</span> </a>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">支持(非必须)</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="form_basic.html">联系客服</a></li>
                    <li><a href="form_advanced.html">意见反馈</a></li>
                    <li><a href="form_wizard.html">帮助</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>