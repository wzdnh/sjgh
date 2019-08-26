<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--===================================待处理的学生认证的列表界面=================================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 待处理学生认证列表 </h2>
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
                                    <i class="fa fa-plus"
                                       onclick="javascript:window.location.href='/employee/to_add';"></i>
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
                            <th class="hidden-xs">学生证</th>
                            <th class="hidden-xs">姓名</th>
                            <th class="hidden-xs">学号</th>
                            <th class="hidden-xs">用户名</th>
                            <th class="hidden-xs">上传时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="scl">
                            <tr class="message-unread">
                                <td>${scl.id}</td>
                                <td><img style="width: 50px; height: 50px" src="${scl.road}" ></td><%--onclick="view_larger_image(${scl.road})"--%>
                                <td>${scl.name}</td>
                                <td class="hidden-xs">
                                    <span class="badge badge-warning mr10 fs11">${scl.student_id}</span>
                                </td>
                                <td>${scl.user_er.user_name}</td>
                                <td>${scl.create_time}</td>
                                <!--让内容居中的方法 class="text-center fw600"-->
                                <td>
                                    <a href="javascript:void(0);" onclick="setState('${scl.id}', 1, '${scl.user_id}')">同意</a>
                                    <a href="javascript:void(0);" onclick="setState('${scl.id}', 2, '${scl.user_id}')">不同意</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <!--陈政 5-4 15.23 查看大图后的显示部分-->
                        <div class=view_larger_image_bac onclick="view_larger_image_hidden()" style="display: none">
                            <img id="student_card_img">
                        </div>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

</section>


<%--<jsp:include page="bottom.jsp"/>
</section>-
</div>--%>

<style>
    /* demo page styles */
    body { min-height: 2300px; }

    .content-header b,
    .admin-form .panel.heading-border:before,
    .admin-form .panel .heading-border:before {
        transition: all 0.7s ease;
    }
    /* responsive demo styles */
    @media (max-width: 800px) {
        .admin-form .panel-body { padding: 18px 12px; }
    }

    .ui-datepicker select.ui-datepicker-month,
    .ui-datepicker select.ui-datepicker-year {
        width: 48%;
        margin-top: 0;
        margin-bottom: 0;

        line-height: 25px;
        text-indent: 3px;

        color: #888;
        border-color: #DDD;
        background-color: #FDFDFD;

        -webkit-appearance: none; /*Optionally disable dropdown arrow*/
    }


    /**
     *
     *点击查看大图
     **/
    .view_larger_image_bac{
        width: 59%;
        height: 65%;
        position: fixed;
        z-index: 99999;
        /*background-color:rgba(80,80,80,0.9);// -->70%的不透明度*/
        background: rgba(190, 190, 190, 0.5);
    }
    .view_larger_image_bac img{
        /* 有了这个就自动居中了 */
        position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        margin: auto;
        max-width: 90%;
        max-height: 90%;
    }
</style>



<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    <!--处理学生认证的ajax代码-->
    function setState(id, state, user_id) {
        var employee_id = "${sessionScope.employee.employee_id}";
        var formData = new FormData();
        formData.append("id", id);
        formData.append("state", state);
        formData.append("employee_id", employee_id);
        formData.append("user_id", user_id);

        $.ajax({
            url: "<%=basePath%>/user/set_certification_state",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                /*alert("ok")*/
                var title = "成功";
                var text = "已处理此用户的认证信息";
                friendly_tips_timer(title, text);
                //1500毫秒后刷新当前页面.
                setTimeout(function(){window.location.reload()}, 1500);
            },
            error: function () {
                /*alert("shibai")*/
                var title = "错误";
                var text = "请重新输入电话号码";
                friendly_tips(title, text);
            }
        });
    }

    //查看大图
    $("table#message-table").on("click","img",function(){
        $(".view_larger_image_bac").show();
        $("#student_card_img").attr("src", $(this)[0].src);
    });

    //点击任意地方取消查看大图
    function view_larger_image_hidden() {
        $(".view_larger_image_bac").hide();
    }

    //友好提示---带定时器
    function friendly_tips_timer(title, text) {
        swal({
            title: title,
            text: text,
            timer: 1500
        });
    };

    //友好提示，不带定时器
    function friendly_tips(title, text) {
        swal(title, text)
    };

</script>


<script src="<%=request.getContextPath()%>/static/backstage/vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/additional-methods.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/utility/utility.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/demo/demo.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/backstage/js/pages.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/backstage/js/items.js"></script>
</body>
</html>



