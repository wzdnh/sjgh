<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加员工 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <!--Spring Form标签-->
                <form:form action="/employee/add?school_id=${sessionScope.employee.school_id}"  modelAttribute="employee" id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="employee_name" class="gui-input" placeholder="姓名..." value=""/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="school_er.school_name" class="gui-input" placeholder="学校..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="position" class="gui-input" placeholder="职务..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="employee_phone" class="gui-input" placeholder="电话..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="id_number" class="gui-input" placeholder="身份证号..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="jurisdiction" class="gui-input" placeholder="权限号..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="employee_sex" class="gui-input" placeholder="性别..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                        </div>
                        <div class="panel-footer text-right" style="margin-bottom: 30px">
                            <button type="submit" class="button"> 添加 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>


<jsp:include page="bottom.jsp"/>