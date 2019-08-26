<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--======================学校详细信息页面===========================-->

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 学校信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 详细信息 </span>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">id:</div>
                        <!--sessionScope:表明是从哪个作用域中获取的，-->
                        <div class="col-md-4">${sessionScope.school.school_id}</div>
                        <div class="col-md-2">学校名称:</div>
                        <div class="col-md-4">${sessionScope.school.school_name}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">省 / 市:</div>
                        <div class="col-md-4">${sessionScope.school.sheng_shi}</div>
                        <div class="col-md-2">注册用户数:</div>
                        <div class="col-md-4"><%--${sessionScope.employee.jurisdiction}--%></div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">员工数:</div>
                        <div class="col-md-4"><%--${sessionScope.school.sheng_shi}--%></div>
                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>