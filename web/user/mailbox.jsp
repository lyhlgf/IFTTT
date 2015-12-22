<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/21
  Time: 下午8:46
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
    <link href="../static/INSPINIA/css/plugins/iCheck/custom.css" rel="stylesheet">
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

        <div class="row">
            <div class="mail-box-header">
                <h2>
                    站内信
                </h2>
            <div class="col-lg-13 animated fadeInRight">
                <ul id="inboxTabs" class="nav nav-tabs">
                    <li class="active"><a href="#private" data-toggle="tab">私人</a></li>
                    <li><a href="#public" data-toggle="tab">公共</a></li>
                    <li><a href="#important" data-toggle="tab">重要</a></li>
                </ul>
                <div id="inboxContents" class="tab-content">
                    <div class="tab-pane fade in active" id="private">
                        <div class="mail-box">
                            <table class="table table-hover table-mail">
                                <thead>
                                <tr>
                                    <th class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </th>
                                    <th> </th>
                                    <th>消息内容</th>
                                    <th> </th>
                                    <th>发件时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks" checked>
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Facebook</a> <span class="label label-warning pull-right">Clients</span> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">Many desktop publishing packages and web page editors.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jan 16</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-danger pull-right">Documents</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> <span class="label label-info pull-right">Adv</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-warning pull-right">Clients</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="public">
                        <div class="mail-box">
                            <table class="table table-hover table-mail">
                                <thead>
                                <tr>
                                    <th class="check-mail"><input type="checkbox" class="i-checks"></th>
                                    <th> </th>
                                    <th>消息内容</th>
                                    <th> </th>
                                    <th>发件时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks" checked>
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Facebook</a> <span class="label label-warning pull-right">Clients</span> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">Many desktop publishing packages and web page editors.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jan 16</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-danger pull-right">Documents</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> <span class="label label-info pull-right">Adv</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-warning pull-right">Clients</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="important">
                        <div class="mail-box">
                            <table class="table table-hover table-mail">
                                <thead>
                                <tr>
                                    <th class="check-mail"><input type="checkbox" class="i-checks"></th>
                                    <th>发信人</th>
                                    <th>主题</th>
                                    <th> </th>
                                    <th class="text-right mail-date">发件时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="unread">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks" checked>
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Facebook</a> <span class="label label-warning pull-right">Clients</span> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">Many desktop publishing packages and web page editors.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jan 16</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-danger pull-right">Documents</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> <span class="label label-info pull-right">Adv</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Anna Smith</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">6.10 AM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Jack Nowak</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Aldus PageMaker including versions of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">8.22 PM</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Mailchip</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">There are many variations of passages of Lorem Ipsum.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Mar 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Alex T.</a> <span class="label label-warning pull-right">Clients</span></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Lorem ipsum dolor noretek imit set.</a></td>
                                    <td class=""><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">December 22</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Monica Ryther</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">The standard chunk of Lorem Ipsum used.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 12</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Sandra Derick</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Contrary to popular belief.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Patrick Pertners</a> </td>
                                    <td class="mail-subject"><a href="mail_detail.html">If you are going to use a passage of Lorem </a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">May 28</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Michael Fox</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Humour, or non-characteristic words etc.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Dec 9</td>
                                </tr>
                                <tr class="read">
                                    <td class="check-mail">
                                        <input type="checkbox" class="i-checks">
                                    </td>
                                    <td class="mail-ontact"><a href="mail_detail.html">Damien Ritz</a></td>
                                    <td class="mail-subject"><a href="mail_detail.html">Oor Lorem Ipsum is that it has a more-or-less normal.</a></td>
                                    <td class=""></td>
                                    <td class="text-right mail-date">Jun 11</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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

<!-- iCheck -->
<script src="../static/INSPINIA/js/plugins/iCheck/icheck.min.js"></script>

<!-- Data Tables -->
<script src="../static/INSPINIA/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../static/INSPINIA/js/plugins/dataTables/dataTables.tableTools.min.js"></script>

<script>
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        $('.table-mail').dataTable({
            paging: true,//分页
            ordering: false,//是否启用排序
            searching: true,//搜索
            language: {
                lengthMenu: '<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="刷新"><i class="fa fa-refresh"></i> </button> <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标记为已读"><i class="fa fa-eye"></i> </button> <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标记为重要"><i class="fa fa-exclamation"></i> </button> <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="移到垃圾箱"><i class="fa fa-trash-o"></i> </button>',
                search: '<button class="btn btn-sm btn-primary">搜索 </button>',//右上角的搜索文本，可以写html标签

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
            dom: '<"ibox-content"lf>t<"ibox-content"p>',
            pagingType: "full_numbers"//分页样式的类型

        });
    });
</script>
</body>
</html>


