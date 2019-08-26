<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--===================================事物交易优化时间列表=================================-->

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 事物交易优化时间列表 </h2>
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
                            <%--<th class="text-center hidden-xs">id</th>--%>
                            <th class="hidden-xs">图片</th>
                            <th class="hidden-xs">价格</th>
                            <th class="hidden-xs">类型</th>
                            <th class="hidden-xs">描述</th>
                            <th class="hidden-xs">时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="tos">
                        <tr class="message-unread">
                            <%--<td>${}</td>--%>
                            <!--====================图片部分==================-->
                            <td><img style="width: 50px; height: 50px" src="${tos.road}"></td>
                            <td class="hidden-xs">
                                <span class="badge badge-warning mr10 fs11">${tos.price}</span>
                            </td>
                             <td>${tos.event_tags}</td>
                             <td>${tos.event_describe}</td>
                            <td>${tos.optimization_time}</td>
                            <!--让内容居中的方法 class="text-center fw600"-->
                            <td>
                                <a href="/optimization_time/swjy_to_update?id=${tos.id}">修改</a>
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