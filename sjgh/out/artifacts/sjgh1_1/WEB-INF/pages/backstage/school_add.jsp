<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================添加学校页面=======================-->

<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加学校 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <!--Spring Form标签-->
                <form:form action="/school/add" modelAttribute="school" id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="school_name" class="gui-input" placeholder="学校名称..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6" style="margin-bottom: 30px">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="sheng_shi" class="gui-input" placeholder="省 / 市..."/>
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