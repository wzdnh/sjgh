<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--===================================广告记录列表界面=================================-->

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 广告统计 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3"><div class="btn-group"></div></div>
                        <div class="col-xs-12 col-md-9 text-right"><div class="btn-group"></div></div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">id</th>
                            <th class="hidden-xs">价格</th>
                            <th class="hidden-xs">学校</th>
                            <th class="hidden-xs">处理人</th>
                            <th class="hidden-xs">处理时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="adv">
                            <td>${adv.id}</td>
                            <td class="hidden-xs">
                                <span class="badge badge-warning mr10 fs11">${adv.money}</span>
                            </td>
                            <td>${adv.school_er.school_name}</td>
                            <td>${adv.employee_er.employee_name}</td>
                            <td>${adv.create_time}</td>
                            <%--<td>
                                <a href="/employee/employee_detail?employee_id=${emp.employee_id}">详细</a>
                                <a href="/employee/to_update?employee_id=${emp.employee_id}">编辑</a>
                                <a href="/employee/remove?employee_id=${emp.employee_id}">删除</a>
                            </td>--%>
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