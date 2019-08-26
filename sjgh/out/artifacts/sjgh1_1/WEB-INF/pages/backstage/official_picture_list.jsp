<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--===================================官方图片、广告列表界面=================================-->

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 官方图片、广告列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='/employee/to_add';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <%--<th class="text-center hidden-xs">Select</th>--%>
                            <th class="text-center hidden-xs">id</th>
                            <th class="hidden-xs">图片</th>
                            <th class="hidden-xs">类型</th>
                            <th class="hidden-xs">价格</th>
                            <th class="hidden-xs">处理人</th>
                            <th class="hidden-xs">尺寸</th>
                            <th class="hidden-xs">学校</th>
                            <th class="hidden-xs">开始时间</th>
                            <th class="hidden-xs">结束时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="pic">
                        <tr class="message-unread">
                            <td>${pic.picture_id}</td>
                            <!--====================头像部分==================-->
                            <td><img style="width: 50px; height: 50px" src="${pic.road}"></td>
                            <td>${pic.picture_describe}</td>
                            <td class="hidden-xs">
                                <span class="badge badge-warning mr10 fs11">${pic.money}</span>
                            </td>
                            <td>${pic.employee_er.employee_name}</td>
                            <td>${pic.size}</td>
                            <td>${pic.school_er.school_name}</td>
                            <td>${pic.update_time}</td>
                            <td>${pic.end_time}</td>
                            <!--让内容居中的方法 class="text-center fw600"-->
                            <td>
                                <%--<a href="/officialPicture/detail/?picture_id=${pic.picture_id}">查看大图</a>--%>
                                <a href="/officialPicture/to_update?picture_id=${pic.picture_id}">更新</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>