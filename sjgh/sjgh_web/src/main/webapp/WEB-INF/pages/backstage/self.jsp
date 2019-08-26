<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--======================登录的管理员的个人详细信息页面===========================-->

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 个人信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 基本信息 </span>
                    </div>
                    <!--====================头像部分==================-->
                    <div style="width: 100px; height: 100px; margin-bottom: 50px">
                        <img style="width: 100px; height: 100px" src="${sessionScope.employee.head_portrait}">
                    </div>
                    <div class="section row">
                        <div class="col-md-2">id:</div>
                        <!--sessionScope:表明是从哪个作用域中获取的，-->
                        <div class="col-md-4">${sessionScope.employee.employee_id}</div>
                        <div class="col-md-2">姓名:</div>
                        <div class="col-md-4">${sessionScope.employee.employee_name}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">学校:</div>
                        <div class="col-md-4">${sessionScope.employee.school_er.school_name}</div>
                        <div class="col-md-2">职务:</div>
                        <div class="col-md-4">${sessionScope.employee.position}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">电话:</div>
                        <div class="col-md-4">${sessionScope.employee.employee_phone}</div>
                        <div class="col-md-2">权限号:</div>
                        <div class="col-md-4">${sessionScope.employee.jurisdiction}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">身份证号:</div>
                        <div class="col-md-4">${sessionScope.employee.id_number}</div>
                        <div class="col-md-2">性别:</div>
                        <div class="col-md-4">${sessionScope.employee.employee_sex}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">加入时间:</div>
                        <div class="col-md-4">${sessionScope.employee.create_time}</div>
                        <div class="col-md-2">密码:</div>
                        <div class="col-md-4">${sessionScope.employee.password}</div>
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