<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--========================================共享头部=================================-->

<!DOCTYPE html>
<html>
<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">

    <title> 赏金工会--欢迎使用赏金工会后台管理系统 </title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/backstage/assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon"  href="<%=request.getContextPath()%>/static/backstage/assets/img/favicon.ico">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="dashboard.html">
                <b>赏金工会后台管理系统</b>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>

        </div>
        <!--            学校              -->
        <div style="float: left; margin-top: 25px"><b>${sessionScope.employee.school_er.school_name}</b></div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                    <!--=======================头像部分=======================-->
                    <img src="${sessionScope.employee.head_portrait}" style="width: 40px; height: 40px">
                    <span class="hidden-xs pl15"> ${sessionScope.employee.employee_name} </span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="/self" class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/to_change_password" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/employee/to_file_update?employee_id=${sessionScope.employee.employee_id}" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 修改头像 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="/quit" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a  href="#" style="width: 40px; height: 40px; float: left; margin-right: 10%">
                            <!---========================头像部分<%=request.getContextPath()%>=========================-->
                            <img src="${sessionScope.employee.head_portrait}" style="width: 40px; height: 40px">
                        </a>
                        <div class="media-body">
                            <div class="media-author">${sessionScope.employee.employee_name}</div>
                            <div class="media-links">
                                <a href="#">${sessionScope.employee.position}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">日常管理</li>
                <li class="active">
                    <a href="/claim_voucher/self">
                        <span class="glyphicon glyphicon-home"></span>
                        <span class="sidebar-title">首页</span>
                    </a>
                </li>
                <li>
                    <a href="/claim_voucher/to_add">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">热词管理</span>
                    </a>
                </li>
                <%--<li>
                    <a href="/claim_voucher/deal">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">待处理报销单</span>
                        <span class="sidebar-title-tray">
                            <span class="label label-xs bg-primary">New</span>
                        </span>
                    </a>
                </li>--%>
                <%--<li>
                    <a href="/claim_voucher/to_add">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">时间优化</span>
                    </a>
                </li>--%>
                <li class="sidebar-label pt15">基础信息管理</li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">信息查看</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/department/list">
                                <span class="glyphicon glyphicon-calendar"></span> 黑名单 </a>
                        </li>
                        <li>
                            <a href="/department/list">
                                <span class="glyphicon glyphicon-calendar"></span> 收入（root） </a>
                        </li>
                        <li>
                            <a href="/department/list">
                                <span class="glyphicon glyphicon-calendar"></span> 黑名单 </a>
                        </li>
                        <%--<li class="active">
                            <a href="/department/to_add">
                                <span class="glyphicon glyphicon-check"></span> 添加部门 </a>
                        </li>--%>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">时间优化</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/optimization_time/sjdb_list">
                                <span class="glyphicon glyphicon-calendar"></span> 事件代办 </a>
                        </li>
                        <li>
                            <a href="/optimization_time/swjy_list">
                                <span class="glyphicon glyphicon-calendar"></span> 事物交易 </a>
                        </li>
                        <li>
                            <a>
                                <span class="glyphicon glyphicon-calendar"></span> 失物招领 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">图片管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/officialPicture/list">
                                <span class="glyphicon glyphicon-calendar"></span> 图片、广告（root）</a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="glyphicon glyphicon-calendar"></span> 图片、广告 </a>
                        </li>
                        <li>
                            <a href="/advertisement/list">
                                <span class="glyphicon glyphicon-calendar"></span> 广告统计 </a>
                        </li>
                        <%--<li>
                            <a href="#">
                                <span class="glyphicon glyphicon-calendar"></span> 宣传图 </a>
                        </li>--%>
                        <%--<li class="active">
                            <a href="#">
                                <span class="glyphicon glyphicon-check"></span> 添加test </a>
                        </li>--%>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">员工管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/employee/list">
                                <span class="glyphicon glyphicon-calendar"></span> 所有员工（ROOT） </a>
                        </li>
                        <li>
                            <a href="/employee/listBySchool?school_id=${sessionScope.employee.school_id}">
                                <span class="glyphicon glyphicon-calendar"></span> 所有员工 </a>
                        </li>
                        <li class="active">
                            <a href="/employee/to_add">
                                <span class="glyphicon glyphicon-check"></span> 添加员工 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">学校管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/school/list">
                                <span class="glyphicon glyphicon-calendar"></span> 所有学校（ROOT） </a>
                        </li>
                        <li class="active">
                            <a href="/school/to_add">
                                <span class="glyphicon glyphicon-check"></span> 添加学校 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">用户管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/user/get_certification?school_id=${sessionScope.employee.school_id}">
                                <span class="glyphicon glyphicon-calendar"></span> 用户验证 </a>
                        </li>
                        <li>
                            <a href="/user/list">
                                <span class="glyphicon glyphicon-calendar"></span> 查看所有用户（ROOT） </a>
                        </li>
                        <%--<li>
                            <a href="/user/list">
                                <span class="glyphicon glyphicon-calendar"></span> 查看所有用户 </a>
                        </li>--%>
                        <%--<li class="active">
                            <a href="/department/to_add">
                                <span class="glyphicon glyphicon-check"></span> 其他 </a>
                        </li>--%>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">日志查看</span>
                        <span class="caret"></span>
                    </a>
                    <%--<ul class="nav sub-nav">
                        <li>
                            <a href="/department/list">
                                <span class="glyphicon glyphicon-calendar"></span> 黑名单 </a>
                        </li>
                    </ul>--%>
                </li>
            </ul>
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
        </div>
    </aside>
    <section id="content_wrapper">