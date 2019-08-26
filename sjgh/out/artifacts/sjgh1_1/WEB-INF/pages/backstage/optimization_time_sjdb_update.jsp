<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--==============================事件代办时间修改页面==============================-->

<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑事件代办时间信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <%--@elvariable id="agentEvent" type=""--%>
                <form:form action="/optimization_time/sjdb_update" modelAttribute="agentEvent"  id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 简要信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="event_id" class="field prepend-icon">
                                    <form:input path="event_id" cssClass="gui-input" placeholder="事件..." readonly="true" />
                                    <label for="event_id" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="optimization_time" class="field prepend-icon">
                                    <form:input path="optimization_time" class="gui-input" placeholder="时间..."/>
                                    <label for="optimization_time" class="field-icon">
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