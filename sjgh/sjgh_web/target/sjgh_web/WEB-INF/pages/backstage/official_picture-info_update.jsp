<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================修改官方图片、广告信息页面======================-->

<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑员工信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/employee/update" modelAttribute="employee"  id="admin-form" name="addForm">
                    <!--隐藏密码项，然后提交时，就可以达到设置初始密码效果-->
                    <form:hidden path="password"/>
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="employee_id" class="field prepend-icon">
                                    <form:input path="employee_id" cssClass="gui-input" placeholder="工号..." readonly="true" />
                                    <label for="employee_id" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="employee_name" class="field prepend-icon">
                                    <form:input path="employee_name" class="gui-input" placeholder="姓名..."/>
                                    <label for="employee_name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="employee_phone" class="field prepend-icon">
                                    <form:input path="employee_phone" cssClass="gui-input" placeholder="电话..."/>
                                    <label for="employee_phone" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="id_number" class="field prepend-icon">
                                    <form:input path="id_number" class="gui-input" placeholder="身份证..."/>
                                    <label for="id_number" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="school_er.school_name" class="field prepend-icon">
                                    <form:input path="school_er.school_name" cssClass="gui-input" placeholder="学校..." />
                                    <label for="school_er.school_name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="position" class="field prepend-icon">
                                    <form:input path="position" class="gui-input" placeholder="职务..."/>
                                    <label for="position" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="employee_sex" class="field prepend-icon">
                                    <form:input path="employee_sex" cssClass="gui-input" placeholder="性别..." />
                                    <label for="employee_sex" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="head_portrait" class="field prepend-icon">
                                    <form:input path="head_portrait" class="gui-input" placeholder="头像..." readonly="true"/>
                                    <label for="head_portrait" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 提交 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>