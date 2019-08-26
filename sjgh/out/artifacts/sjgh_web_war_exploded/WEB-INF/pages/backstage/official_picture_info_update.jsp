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
                <form:form action="/officialPicture/update" modelAttribute="officialPicture"  id="admin-form" name="addForm">
                    <%--<!--隐藏密码项，然后提交时，就可以达到设置初始密码效果-->
                    <form:hidden path="password"/>--%>
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="picture_id" class="field prepend-icon">
                                    <form:input path="picture_id" cssClass="gui-input" placeholder="图片id..." readonly="true" />
                                    <label for="picture_id" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="picture_describe" class="field prepend-icon">
                                    <form:input path="picture_describe" class="gui-input" placeholder="类型..."/>
                                    <label for="picture_describe" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="money" class="field prepend-icon">
                                    <form:input path="money" cssClass="gui-input" placeholder="价格..."/>
                                    <label for="money" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="end_time" class="field prepend-icon">
                                    <form:input path="end_time" class="gui-input" placeholder="结束时间..."/>
                                    <label for="end_time" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="size" class="field prepend-icon">
                                    <form:input path="size" cssClass="gui-input" placeholder="尺寸..."/>
                                    <label for="size" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 提交&去修改图片 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>